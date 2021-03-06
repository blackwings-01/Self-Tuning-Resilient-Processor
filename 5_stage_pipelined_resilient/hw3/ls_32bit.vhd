LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY ls_32bit IS
PORT ( data_operandA  : IN STD_LOGIC_VECTOR(31 downto 0);
    ctrl_shiftamt : IN STD_LOGIC_VECTOR(4 downto 0);
    data_result    : OUT STD_LOGIC_VECTOR(31 downto 0));
END ls_32bit;

ARCHITECTURE structure OF ls_32bit IS
component ls_1bit
PORT ( data_operandA  : IN STD_LOGIC_VECTOR(31 downto 0);
    enable : IN STD_LOGIC;
    data_result    : OUT STD_LOGIC_VECTOR(31 downto 0));
END component;
component ls_2bit
PORT ( data_operandA  : IN STD_LOGIC_VECTOR(31 downto 0);
    enable : IN STD_LOGIC;
    data_result    : OUT STD_LOGIC_VECTOR(31 downto 0));
END component;
component ls_4bit
PORT ( data_operandA  : IN STD_LOGIC_VECTOR(31 downto 0);
    enable : IN STD_LOGIC;
    data_result    : OUT STD_LOGIC_VECTOR(31 downto 0));
END component;
component ls_8bit
PORT ( data_operandA  : IN STD_LOGIC_VECTOR(31 downto 0);
    enable : IN STD_LOGIC;
    data_result    : OUT STD_LOGIC_VECTOR(31 downto 0));
END component;
component ls_16bit
PORT ( data_operandA  : IN STD_LOGIC_VECTOR(31 downto 0);
    enable : IN STD_LOGIC;
    data_result    : OUT STD_LOGIC_VECTOR(31 downto 0));
END component;

signal buff1: STD_LOGIC_VECTOR(31 downto 0);
signal buff2: STD_LOGIC_VECTOR(31 downto 0);
signal buff3: STD_LOGIC_VECTOR(31 downto 0);
signal buff4: STD_LOGIC_VECTOR(31 downto 0);

BEGIN
ls16: ls_16bit port map (data_operandA, ctrl_shiftamt(4),buff1);
ls8: ls_8bit port map (buff1, ctrl_shiftamt(3),buff2);
ls4: ls_4bit port map (buff2, ctrl_shiftamt(2),buff3);
ls2: ls_2bit port map (buff3, ctrl_shiftamt(1),buff4);
ls1: ls_1bit port map (buff4, ctrl_shiftamt(0),data_result);

END structure;