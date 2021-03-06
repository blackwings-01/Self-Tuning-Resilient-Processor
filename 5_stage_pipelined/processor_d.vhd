LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY processor_d IS
        PORT (	clock	: IN STD_LOGIC;
			keyboard_in	: IN STD_LOGIC_VECTOR(3 downto 0);
--			lcd_data	: OUT STD_LOGIC_VECTOR(31 downto 0);
			led_14: out std_logic_vector(14 downto 1);
--			debug: out std_logic_vector(31 downto 0);
--			instr_FD: out std_logic_vector(31 downto 0);
--			instr_DX: out std_logic_vector(31 downto 0);
--			instr_XM: out std_logic_vector(31 downto 0);
--			instr_MW: out std_logic_vector(31 downto 0);
--			dmem_out_d: out std_logic_vector(31 downto 0);
--			alu_a: out std_logic_vector(31 downto 0);
--			alu_b: out std_logic_vector(31 downto 0);
--			rf_in: out std_logic_vector(31 downto 0);
			pc_out_d: out std_logic_vector(31 downto 0);
			b1: out std_logic;
			b4: out std_logic;
			b2: out std_logic;
			b3: out std_logic
			
--			b2: out std_logic_vector(31 downto 0);
--			b3: out std_logic_vector(31 downto 0)
			);
END processor_d;

ARCHITECTURE Structure OF processor_d IS
	begin
		led_14 <= "11001011011010";
		b1<= '1';
		b2<= '1';
		b3<= '1';
		b4<= '1';
	end;
	