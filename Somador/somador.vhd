library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity somador is
generic (N :integer:=128);
	port(
       A,B: in std_logic_vector(N-1 downto 0);
       F: out std_logic_vector(N-1 downto 0);
		 C: out std_logic
		);
end entity;

architecture Adder of somador is
signal c1: std_logic_vector(N-1 downto 0);

component somadorCompleto is
	port(
       A,B,Cin: in std_logic;
       F,Cout: out std_logic
		);
end component;

begin

	SC0: somadorCompleto port map (A(0),B(0),'0',F(0),c1(0));
	GENSC: for i in 1 to N-1 generate
		SCX: somadorCompleto port map(A(i),B(i),c1(i-1),F(i),c1(i));
	end generate GENSC;
	C <= c1(N-1);
end architecture;