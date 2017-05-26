LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY multiplicador IS
PORT (Reset, clk, inicio : IN STD_LOGIC;
      A, B : IN STD_LOGIC_VECTOR(3 downto 0);
      pronto : OUT STD_LOGIC;
      saida: OUT STD_LOGIC_VECTOR (3 downto 0) );
END multiplicador;

architecture mult of multiplicador is
component bo IS
PORT (clk : IN STD_LOGIC;
      ini, CP, CA, dec : IN STD_LOGIC;
      entA, entB : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      Az, Bz : OUT STD_LOGIC;
      saida, conteudoA, conteudoB : OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
END component;

component bc IS
PORT (Reset, clk, inicio : IN STD_LOGIC;
      Az, Bz : IN STD_LOGIC;
      pronto : OUT STD_LOGIC;
      ini, CA, dec, CP: OUT STD_LOGIC );
END component;

signal CP,CA,dec,Az,Bz,ini : std_LOGIC;
signal contA,contB : std_LOGIC_VECTOR (3 downto 0);

begin

	bo1: bo PORT MAP (clk, ini, CP, CA, dec, A, B, Az, Bz, saida, contA, contB);
	bc1: bc PORT MAP (Reset, clk, inicio, Az, Bz, pronto, ini, CA, dec, CP);

end architecture;