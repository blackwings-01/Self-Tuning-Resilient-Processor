LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY multdiv IS
PORT ( data_operandA, data_operandB     : IN STD_LOGIC_VECTOR(15 downto 0);
       ctrl_MULT, ctrl_DIV, clock : IN STD_LOGIC;                
       data_result    : OUT STD_LOGIC_VECTOR(31 downto 0);
       data_exception, data_inputRDY, data_resultRDY  : OUT STD_LOGIC);
END multdiv;

ARCHITECTURE structure OF multdiv IS
component add_sub_16
PORT ( data_operandA, data_operandB     : IN STD_LOGIC_VECTOR(15 downto 0);
   data_result    : OUT STD_LOGIC_VECTOR(15 downto 0);
   carryin : IN STD_LOGIC;
   carryout: OUT STD_LOGIC;
   subtract : IN STD_LOGIC);
END component;

component counter
   port
   ( mult,clock,enable,reset : in std_logic;
	  cnt_eq_18,cnt_eq_16,cnt_eq_1,counting : out std_logic
   );
end component;

component reg_32
PORT ( input : IN STD_LOGIC_VECTOR(31 downto 0);
   write_enable :IN STD_LOGIC;
   clock: IN STD_LOGIC;
   reset: IN STD_LOGIC;
   output : OUT STD_LOGIC_VECTOR(31 downto 0));
end component;

component reg_16
PORT ( input : IN STD_LOGIC_VECTOR(15 downto 0);
   write_enable :IN STD_LOGIC;
   clock: IN STD_LOGIC;
   reset: IN STD_LOGIC;
   output : OUT STD_LOGIC_VECTOR(15 downto 0));
end component;

component dflipflop
   port
   ( clock, reset,enable,data : in std_logic;
      output : out std_logic
   );
end component;

component FSM
   port
   ( ctrl_MULT, ctrl_DIV, clock,data_outputRDY : IN STD_LOGIC;     
	  operation_MULT, operation_DIV,data_inputRDY : out std_logic
   );
end component;
component or_16
	PORT ( input : IN STD_LOGIC_VECTOR(15 downto 0);
   output :OUT STD_LOGIC);
END component;

component negate_16
PORT ( data   : IN STD_LOGIC_VECTOR(15 downto 0);
   enable : IN STD_LOGIC;
   result    : OUT STD_LOGIC_VECTOR(15 downto 0));
end component;

signal cnt_eq_16: STD_LOGIC;
signal cnt_eq_1: STD_LOGIC;
signal cnt_eq_18: STD_LOGIC;
signal counting: STD_LOGIC;
signal product_in: STD_LOGIC_VECTOR (31 downto 0);
signal product_out: STD_LOGIC_VECTOR (31 downto 0);
signal adder_out: STD_LOGIC_VECTOR (15 downto 0);
signal adder_buff: STD_LOGIC_VECTOR (15 downto 0);
signal ref: STD_LOGIC;
signal ref_buff: STD_LOGIC;
signal ctrl_add_sub: STD_LOGIC;
signal neg: STD_LOGIC;
signal data_inputRDYb: STD_LOGIC;
signal data_resultRDYb: STD_LOGIC;
signal data_B: STD_LOGIC_VECTOR (15 downto 0);
signal data_B_buff: STD_LOGIC_VECTOR (15 downto 0);
signal data_A_buff: STD_LOGIC_VECTOR (15 downto 0);
signal operation_MULT: STD_LOGIC;
signal operation_DIV: STD_LOGIC;
signal or_buff: STD_LOGIC;
signal overflow_buff: STD_LOGIC;
signal div_buff: STD_LOGIC_VECTOR (15 downto 0);
signal neg_result: STD_LOGIC;

BEGIN

state_machine: FSM port map (ctrl_MULT, ctrl_DIV, clock,data_resultRDYb, operation_MULT, operation_DIV, data_inputRDYb);
data_inputRDY <= data_inputRDYb;
count16: counter port map(operation_MULT,clock,operation_MULT or operation_DIV, ctrl_MULT or ctrl_DIV, cnt_eq_18,cnt_eq_16,cnt_eq_1,counting);
negatedataB: negate_16 port map (data_operandB, operation_DIV and data_operandB(15) , data_B_buff);
negatedataA : negate_16 port map (data_operandA, operation_DIV and data_operandA(15), data_A_buff);
store_operand_sign: dflipflop port map(clock,'0',not counting, data_operandB(15) xor data_operandA(15),neg_result);
operandB: reg_16 port map (data_B_buff, not counting, clock, '0',data_B);

--shift
product_in(31) <= '0' when (counting = '0')
	else adder_out(15) when (counting = '1' and operation_MULT = '1') --adder_out(15) arithmetic shift
	else adder_out(14) when (operation_DIV = '1' and neg = '0' and counting = '1')
	else product_out(30) when (operation_DIV = '1' and neg = '1' and counting = '1');
	
product_in(30 downto 17)<= "00000000000000" when (counting = '0') 
	else adder_out(15 downto 2) when (counting = '1' and operation_MULT = '1')
	else product_out(29 downto 16) when (operation_DIV = '1' and neg = '1')
	else adder_out (13 downto 0) when (operation_DIV = '1' and neg = '0');
	
product_in(16)<= '0' when (counting = '0') 
	else adder_out(1) when (counting = '1' and operation_MULT = '1')
	else product_out(15) when (operation_DIV = '1');
	
product_in(15) <= data_A_buff (15) when (counting = '0') 
	else adder_out(0) when (counting = '1' and operation_MULT = '1')
	else product_out(14) when operation_DIV = '1';
	
product_in(14 downto 1) <= data_A_buff(14 downto 1) when (counting = '0')
	else product_out(15 downto 2) when (counting = '1' and operation_MULT = '1')
	else product_out(13 downto 0) when operation_DIV = '1';
	
product_in(0) <= data_A_buff(0) when (counting = '0')
	else product_out(1) when (counting = '1' and operation_MULT = '1')
	else '0' when (counting = '1' and neg = '1' and operation_DIV = '1')
	else '1' when (counting = '1' and neg = '0' and operation_DIV = '1');
--shift

ref_bit: dflipflop port map(clock,'0',operation_MULT,product_out(0),ref_buff);
ref <= ref_buff when cnt_eq_1 = '0' else '0';
neg <= adder_out(15);

ctrl_add_sub <= product_out(0) when operation_MULT = '1' else '1' when operation_DIV = '1';
calculation: add_sub_16 port map(product_out(31 downto 16),data_B, adder_buff ,'0',overflow_buff, ctrl_add_sub);
adder_out <= adder_buff when (((product_out(0) /= ref) and operation_MULT = '1') or operation_DIV = '1' )
else product_out(31 downto 16) when ((product_out(0)= ref) and operation_MULT = '1');
product: reg_32 port map(product_in,operation_MULT or operation_DIV,clock,'0',product_out);

product_negate: negate_16 port map(product_out(15 downto 0),operation_DIV and neg_result, div_buff);

data_result(31) <= product_out(31) when (data_resultRDYb = '1' and operation_MULT = '1') 
				else '0' when (data_resultRDYb = '0'and operation_MULT = '1') 
				else div_buff(15) when operation_DIV = '1';

G1: for i in 30 downto 16 generate
	data_result(i) <= product_out(i+1) when (data_resultRDYb = '1' and operation_MULT = '1')
				else '0' when (data_resultRDYb = '0'and operation_MULT = '1')
				else div_buff(15) when operation_DIV = '1';
end generate;
				
data_result (15 downto 1) <= product_out(16 downto 2) when (data_resultRDYb = '1' and operation_MULT = '1')
				else "000000000000000" when (data_resultRDYb = '0')
				else div_buff(15 downto 1) when (operation_DIV = '1' and data_resultRDYb = '1');
data_result(0) <= product_out(1) when (data_resultRDYb = '1' and operation_MULT = '1')
				else '0' when (data_resultRDYb = '0')
				else div_buff(0) when (operation_DIV = '1' and data_resultRDYb = '1');
				
data_resultRDYb <= cnt_eq_16 when operation_MULT = '1'
				else cnt_eq_18 when operation_DIV = '1';
data_resultRDY <= data_resultRDYb;

or_dataB: or_16 port map (data_B, or_buff);
data_exception <= (operation_DIV and (not or_buff) and counting); --or (overflow_buff and (not ctrl_add_sub)) ; This will never overflow

END structure;