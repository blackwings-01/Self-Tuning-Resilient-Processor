LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY input_ctrl IS
    PORT (	clock: in std_logic;
			keyboard_in	: IN STD_LOGIC_VECTOR(3 downto 0);
			clearup: in std_logic;
			cleardown: in std_logic;
			clearleft: in std_logic;
			clearright: in std_logic;
			goup: out std_logic;
			godown: out std_logic;
			goleft: out std_logic;
			goright: out std_logic
			);
END input_ctrl;

ARCHITECTURE behavioral OF input_ctrl IS
	
begin
	process (clock,clearup, cleardown, clearleft, clearright, keyboard_in) is
	variable check: integer := 0;
	begin
	if falling_edge(clearup) then
		goup <= '0';
	end if;
	if falling_edge(cleardown) then
		godown <= '0';
	end if;
	if falling_edge(clearleft) then
		goleft <= '0';
	end if;
	if falling_edge(clearright) then
		goright <= '0';
	end if;	
	if (keyboard_in(3) = '1' and keyboard_in(2) = '1' and keyboard_in(1) = '1' and keyboard_in(0) = '1' and rising_edge(clock)) then
		check :=0;
	end if;
	if (keyboard_in(3) = '0'and check = 0 ) then
		goup <= '1';
		check := 1;
	end if;
	if (keyboard_in(2) = '0' and check = 0) then 
		godown <= '1';
		check :=1;
	end if;
	if (keyboard_in(1) = '0'and check = 0) then 
		goleft <= '1';
		check :=1;
	end if;
	if (keyboard_in(0) = '0'and check = 0) then 
		goright <= '1';
		check :=1;
	end if;
	end process;

end behavioral;