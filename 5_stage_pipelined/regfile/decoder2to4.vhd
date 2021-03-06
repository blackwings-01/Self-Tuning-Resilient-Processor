LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY decoder2to4 IS
PORT ( 
   address : IN STD_LOGIC_VECTOR(0 to 1);
   enable: IN STD_LOGIC;
   output : OUT STD_LOGIC_VECTOR(0 to 3));
END decoder2to4;

ARCHITECTURE structure OF decoder2to4 IS
BEGIN

output(3) <=  address(1) and address(0) and enable;
output(2) <=  address(1) and (not address(0)) and enable;
output(1) <= (not address(1)) and (address(0)) and enable;
output(0) <= (not address(1)) and (not address(0)) and enable;
END structure;

