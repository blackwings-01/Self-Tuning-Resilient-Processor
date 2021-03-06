LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY decoder IS
PORT ( 
   address : IN STD_LOGIC_VECTOR(1 downto 0);
   enable: IN STD_LOGIC;
   output : OUT STD_LOGIC_VECTOR(3 downto 0));
END decoder;

ARCHITECTURE structure OF decoder IS
BEGIN
output(3) <= address(0) and address(1) and enable;
output(2) <= address(0) and (not address(1)) and enable;
output(1) <= (not address(0)) and (address(1)) and enable;
output(0) <= (not address(0)) and (not address(1)) and enable;
END structure;

