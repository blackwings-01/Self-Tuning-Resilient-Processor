Library ieee;
Use ieee.std_logic_1164.all;

Entity decoder_6 is
    port(bin: In std_logic_vector(5 Downto 0);
         output:   out std_logic_vector(40 downto 1)
        );
End decoder_6;

Architecture Structure of decoder_6 is
Begin
    output(1) <= not bin(5) and not bin(4) and not bin(3) and not bin(2) and not bin(1) and     bin(0);
    output(2) <= not bin(5) and not bin(4) and not bin(3) and not bin(2) and     bin(1) and not bin(0);
    output(3) <= not bin(5) and not bin(4) and not bin(3) and not bin(2) and     bin(1) and     bin(0);
    output(4) <= not bin(5) and not bin(4) and not bin(3) and     bin(2) and not bin(1) and not bin(0);
    output(5) <= not bin(5) and not bin(4) and not bin(3) and     bin(2) and not bin(1) and     bin(0);
    output(6) <= not bin(5) and not bin(4) and not bin(3) and     bin(2) and     bin(1) and not bin(0);
    output(7) <= not bin(5) and not bin(4) and not bin(3) and     bin(2) and     bin(1) and     bin(0);
    output(8) <= not bin(5) and not bin(4) and     bin(3) and not bin(2) and not bin(1) and not bin(0);
    output(9) <= not bin(5) and not bin(4) and     bin(3) and not bin(2) and not bin(1) and     bin(0);
    output(10)<= not bin(5) and not bin(4) and     bin(3) and not bin(2) and     bin(1) and not bin(0);
    output(11)<= not bin(5) and not bin(4) and     bin(3) and not bin(2) and     bin(1) and     bin(0);
    output(12)<= not bin(5) and not bin(4) and     bin(3) and     bin(2) and not bin(1) and not bin(0);
    output(13)<= not bin(5) and not bin(4) and     bin(3) and     bin(2) and not bin(1) and     bin(0);
    output(14)<= not bin(5) and not bin(4) and     bin(3) and     bin(2) and     bin(1) and not bin(0);
    output(15)<= not bin(5) and not bin(4) and     bin(3) and     bin(2) and     bin(1) and     bin(0);
    output(16)<= not bin(5) and     bin(4) and not bin(3) and not bin(2) and not bin(1) and not bin(0);
    output(17)<= not bin(5) and     bin(4) and not bin(3) and not bin(2) and not bin(1) and     bin(0);
    output(18)<= not bin(5) and     bin(4) and not bin(3) and not bin(2) and     bin(1) and not bin(0);
    output(19)<= not bin(5) and     bin(4) and not bin(3) and not bin(2) and     bin(1) and     bin(0);
    output(20)<= not bin(5) and     bin(4) and not bin(3) and     bin(2) and not bin(1) and not bin(0);
    output(21)<= not bin(5) and     bin(4) and not bin(3) and     bin(2) and not bin(1) and     bin(0);
    output(22)<= not bin(5) and     bin(4) and not bin(3) and     bin(2) and     bin(1) and not bin(0);
    output(23)<= not bin(5) and     bin(4) and not bin(3) and     bin(2) and     bin(1) and     bin(0);
    output(24)<= not bin(5) and     bin(4) and     bin(3) and not bin(2) and not bin(1) and not bin(0);
    output(25)<= not bin(5) and     bin(4) and     bin(3) and not bin(2) and not bin(1) and     bin(0);
    output(26)<= not bin(5) and     bin(4) and     bin(3) and not bin(2) and     bin(1) and not bin(0);
    output(27)<= not bin(5) and     bin(4) and     bin(3) and not bin(2) and     bin(1) and     bin(0);
    output(28)<= not bin(5) and     bin(4) and     bin(3) and     bin(2) and not bin(1) and not bin(0);
    output(29)<= not bin(5) and     bin(4) and     bin(3) and     bin(2) and not bin(1) and     bin(0);
    output(30)<= not bin(5) and     bin(4) and     bin(3) and     bin(2) and     bin(1) and not bin(0);
    output(31)<= not bin(5) and     bin(4) and     bin(3) and     bin(2) and     bin(1) and     bin(0);
    output(32)<=     bin(5) and not bin(4) and not bin(3) and not bin(2) and not bin(1) and not bin(0);
    output(33)<=     bin(5) and not bin(4) and not bin(3) and not bin(2) and not bin(1) and     bin(0);
    output(34)<=     bin(5) and not bin(4) and not bin(3) and not bin(2) and     bin(1) and not bin(0);
    output(35)<=     bin(5) and not bin(4) and not bin(3) and not bin(2) and     bin(1) and     bin(0);
    output(36)<=     bin(5) and not bin(4) and not bin(3) and     bin(2) and not bin(1) and not bin(0);
    output(37)<=     bin(5) and not bin(4) and not bin(3) and     bin(2) and not bin(1) and     bin(0);
    output(38)<=     bin(5) and not bin(4) and not bin(3) and     bin(2) and     bin(1) and not bin(0);
    output(39)<=     bin(5) and not bin(4) and not bin(3) and     bin(2) and     bin(1) and     bin(0);
    output(40)<=     bin(5) and not bin(4) and     bin(3) and not bin(2) and not bin(1) and not bin(0);
End Structure;