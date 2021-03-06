LIBRARY ieee ;
USE ieee.std_logic_1164.all ;

ENTITY decoder5to32 IS
PORT (w : IN  STD_LOGIC_VECTOR(0 TO 4) ;
En  : IN  STD_LOGIC ;
y : OUT  STD_LOGIC_VECTOR(0 TO 31) ) ;
END decoder5to32;
ARCHITECTURE Structure OF decoder5to32 IS

COMPONENT decoder3to8
PORT ( 
   address : IN STD_LOGIC_VECTOR(0 to 2);
   enable: IN STD_LOGIC;
   output : OUT STD_LOGIC_VECTOR(0 to 7));
END COMPONENT ;

COMPONENT decoder2to4
PORT ( 
   address : IN STD_LOGIC_VECTOR(0 to 1);
   enable: IN STD_LOGIC;
   output : OUT STD_LOGIC_VECTOR(0 to 3));
END COMPONENT ;

SIGNAL m : STD_LOGIC_VECTOR(0 TO 3) ;

BEGIN
Dec_left: decoder2to4 PORT MAP ( w(3 to 4), En, m ) ;
G1: FOR i IN 0 TO 3 GENERATE
	Dec_ri: decoder3to8 PORT MAP ( w(0 to 2), m(i), y(8*i TO 8*i+7) );
END GENERATE ;

END Structure ;