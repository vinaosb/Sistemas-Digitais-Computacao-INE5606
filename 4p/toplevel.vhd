LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY toplevel IS
PORT (SW : IN STD_LOGIC_VECTOR(16 downto 0);      HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7 : OUT STD_LOGIC_VECTOR(6 downto 0));
END toplevel;

ARCHITECTURE comportamento OF toplevel IS

	SIGNAL s3, s2, s1, s0, c4: STD_LOGIC;
	
	constant ZERO : std_logic_vector(6 downto 0) := "1000000";
	constant UM   : std_logic_vector(6 downto 0) := "1111001";

	--instancia��o do componente somador4bits
	COMPONENT somador4bits IS
	PORT (c0, a3, a2, a1, a0, b3, b2, b1, b0 : IN STD_LOGIC;
	s3, s2, s1, s0, c4 : OUT STD_LOGIC);
	END COMPONENT;

BEGIN

--mapeamento das 9 entradas do somador para os switches e das 5 sa�das do somador para os 
--displays de 7 segmentos
SC0: somador4bits PORT MAP (SW(8), SW(3), SW(2), SW(1), SW(0), 
							       SW(7), SW(6), SW(5), SW(4),
							s3, s2, s1, s0, c4);

--definindo o valor a ser exibido pelo displays de 7 segmentos baseado nas sa�das do somador
--obs: HEX � ativo baixo 
HEX0 <= UM WHEN (s0='1') 
	ELSE ZERO;

HEX1 <= UM WHEN (s1='1') 
	ELSE ZERO;
	
HEX2 <= UM WHEN (s2='1') 
	ELSE ZERO;
	
HEX3 <= UM WHEN (s3='1') 
	ELSE ZERO;
	
HEX4 <= UM WHEN (c4='1') 
	ELSE ZERO;

--fixando em '0' o valor a ser exibido pelos 3 �ltimos displays de 7 segmentos
HEX5 <= (OTHERS => '1');
HEX6 <= (OTHERS => '1');
HEX7 <= (OTHERS => '1');

END comportamento;
