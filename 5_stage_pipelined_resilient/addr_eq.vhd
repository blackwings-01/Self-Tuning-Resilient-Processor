LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY addr_eq IS
    PORT (	addr1, addr2 : in STD_LOGIC_VECTOR(4 downto 0);
			equal: out std_logic);
END addr_eq;

ARCHITECTURE Structure OF addr_eq IS
begin
equal <= (addr1(0) xnor addr2(0)) and
		(addr1(1) xnor addr2(1)) and
		(addr1(2) xnor addr2(2)) and
		(addr1(3) xnor addr2(3)) and
		(addr1(4) xnor addr2(4));
end structure;
