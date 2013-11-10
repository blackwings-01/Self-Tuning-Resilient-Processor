library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
 
entity razor_check is
   port
   ( clock, not_equal : in std_logic;
      error : out std_logic
   );
end entity razor_check;
 
architecture Behavioral of razor_check is
begin
   process (clock) is
   begin
      if rising_edge(clock) then  
		 error <= not_equal;
      end if;
   end process;
end architecture Behavioral;