LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY three_inputs_adder IS
PORT ( data_operandA, data_operandB, data_operandC : IN STD_LOGIC_VECTOR(31 downto 0);
   data_result    : OUT STD_LOGIC_VECTOR(31 downto 0);
   carryout: OUT STD_LOGIC);
END three_inputs_adder;

ARCHITECTURE structure OF three_inputs_adder IS

component onebitadder
PORT ( input1, input2 : IN STD_LOGIC;
   carryout, sum : OuT STD_LOGIC);
end component;

component onebitfulladder
PORT ( input1, input2 , carryin: IN STD_LOGIC;
   carryout, sum : OuT STD_LOGIC);
END component;

SIGNAL firstcarryout : STD_LOGIC_VECTOR(31 downto 0);
SIGNAL firstsum : STD_LOGIC_VECTOR(31 downto 0);
SIGNAL nextcarryout : STD_LOGIC_VECTOR(527 downto 0) ;
SIGNAL nextsum : STD_LOGIC_VECTOR(527 downto 0) ;
SIGNAL cobuffer: STD_LOGIC_VECTOR(31 downto 0);
SIGNAL opB_buffer : STD_LOGIC_VECTOR(31 downto 0);

BEGIN

IFF1 : for i in 31 downto 0 generate
	firstrow: onebitfulladder port map (data_operandA(i),data_operandB(i),data_operandC(i),firstcarryout(i),firstsum(i));
end generate IFF1;

IFF2 : for i in 31 downto 0 generate
	IFF3: for j in i downto 0 generate
		G1: if i=31 generate
			G3: if j/=0 generate	
				halfadder1: onebitadder port map (firstcarryout(j-1),firstsum(j),nextcarryout((i+1)*i/2+j),nextsum((i+1)*i/2+j));
			end generate G3;
			G4: if j=0 generate
				halfadder2: onebitadder port map ('0',firstsum(j),nextcarryout((i+1)*i/2+j),nextsum((i+1)*i/2+j));
			end generate G4;
			G5: if j=i generate
				cobuffer(i)<= firstcarryout(j) or nextsum((i+1)*i/2+j);
			end generate G5;
		end generate G1;
		G2: if i/=31 generate	
			halfadder3: onebitadder port map (nextcarryout((i+2)*(i+1)/2+j),nextsum((i+2)*(i+1)/2+j+1),nextcarryout((i+1)*i/2+j),nextsum((i+1)*i/2+j));
			data_result(30-i) <= nextsum((i+2)*(i+1)/2);
			G6: if j=i generate
				cobuffer(i)<= firstcarryout(j+1) or nextsum((i+1)*i/2+j);
			end generate G6;
		end generate G2;
	end generate IFF3;
end generate IFF2;
data_result(31)<=nextsum(0);
carryout <= cobuffer(0);
END structure;