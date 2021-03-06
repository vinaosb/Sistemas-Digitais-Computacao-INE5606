library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity somador4bits is
generic (N :integer:=4);
	port(
       A,B: in std_logic_vector(N-1 downto 0);
       F: out std_logic_vector(N-1 downto 0);
		 C: out std_logic
		);
end entity;

architecture Adder4Bits of somador4bits is
signal c1: std_logic_vector(N-1 downto 0);

component somadorCompleto is
	port(
       A,B,Cin: in std_logic;
       F,Cout: out std_logic
		);
end component;

begin

	SC0: somadorCompleto port map(A(0),B(0),'0',F(0),c1(0));
	SC1: somadorCompleto port map(A(1),B(1),c1(0),F(1),c1(1));
	SC2: somadorCompleto port map(A(2),B(2),c1(1),F(2),c1(2));
	SC3: somadorCompleto port map(A(3),B(3),c1(2),F(3),c1(3));

	C <= c1(3);
end architecture;