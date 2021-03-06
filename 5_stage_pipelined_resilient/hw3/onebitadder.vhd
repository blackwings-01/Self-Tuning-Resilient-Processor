LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY onebitadder IS
PORT ( input1, input2 : IN STD_LOGIC;
   carryout, sum : OuT STD_LOGIC);
END onebitadder;

ARCHITECTURE structure OF onebitadder IS

BEGIN
sum <= input1 xor input2;
carryout <= input1 and input2;
END structure;
