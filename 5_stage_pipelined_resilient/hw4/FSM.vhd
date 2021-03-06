library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
 
entity FSM is
   port
   ( ctrl_MULT, ctrl_DIV, clock,data_outputRDY : IN STD_LOGIC;     
	  operation_MULT, operation_DIV,data_inputRDY : out std_logic
   );
end entity FSM;
 
architecture Behavioral of FSM is

signal data_inputRDYb: STD_LOGIC;

begin
	data_inputRDY <= data_inputRDYb;
	operation_MULT <= '0' when ctrl_DIV = '1' else '1' when ctrl_MULT = '1';
	operation_DIV <= '0' when ctrl_MULT = '1' else '1' when ctrl_DIV = '1';
	process (clock,data_outputRDY) is
	variable cnt : integer := 1;
		begin
		if (rising_edge(clock)) then 
			if(data_outputRDY = '1' and cnt = 0) then
				cnt := cnt+1;
			end if;
			if(data_outputRDY = '0' and (cnt = 1 or cnt = 2)) then
				data_inputRDYb <='1';
				cnt := cnt+1;
			end if;
			if(cnt = 3) then
				data_inputRDYb <='0';
				cnt :=0;
			end if;
		end if; 
   end process;
end architecture Behavioral;