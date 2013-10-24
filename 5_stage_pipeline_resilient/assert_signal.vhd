LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY assert_signal IS
    PORT (	clock: in std_logic;
			preset_val: in std_logic;
			enable: in std_logic;
			assert_on: in std_logic;
			reset: in std_logic;
			output: out std_logic
			);
END entity assert_signal;

ARCHITECTURE Behavioral OF assert_signal IS
begin
   process (enable, clock, preset_val, assert_on) is
	variable set : integer := 0;
	begin
		if (rising_edge(enable)) then
			set := 1;
		end if;
		if (enable = '1' and falling_edge(clock)) then
			output <= assert_on;
		end if;
		if (set = 0) then
			output <= preset_val;
		end if;
		if (reset = '1') then
			set := 0;
		end if;
	end process;
end architecture Behavioral;