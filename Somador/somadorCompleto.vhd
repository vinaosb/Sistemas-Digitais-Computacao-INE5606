library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity somadorCompleto is
	port(
       A,B,Cin: in std_logic;
       F,Cout: out std_logic
		);
end entity;

architecture Adder of somadorCompleto is
begin
        F <= (A xor B) xor Cin;
		  Cout <= (A and B) or (Cin and (A xor B));
end architecture;