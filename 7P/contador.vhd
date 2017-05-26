LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY contador IS
PORT (clk_in :  IN STD_LOGIC;
	  SW : IN UNSIGNED(16 downto 0);
      in_port_to_the_button_pio : IN STD_LOGIC_VECTOR(3 downto 0);
      HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7 : OUT STD_LOGIC_VECTOR(6 downto 0));
END contador;

ARCHITECTURE comportamento OF contador IS

	SIGNAL saidaReg : UNSIGNED (3 downto 0);
	SIGNAL saidaB2D0, saidaB2D1, saidaB2H : STD_LOGIC_VECTOR (6 downto 0);
	
	constant ZERO : std_logic_vector(6 downto 0) := "1000000";
	constant UM   : std_logic_vector(6 downto 0) := "1111001";
	
	COMPONENT reg4bitscont IS
	GENERIC (N : INTEGER := 4 );
	PORT ( clk, resetn, carga, incr : IN   STD_LOGIC;
		   D :   IN      UNSIGNED (N-1 DOWNTO 0);
		   Q :   OUT     UNSIGNED (N-1 DOWNTO 0));
	END COMPONENT;
	
	COMPONENT binary2dec IS
	PORT ( entrada  :   IN  UNSIGNED (3 DOWNTO 0);
           saidaUnidades, saidaDezenas  :   OUT STD_LOGIC_VECTOR (6 DOWNTO 0));
	END COMPONENT;
	
	COMPONENT binary2hex IS
	PORT ( entrada  :   IN  UNSIGNED (3 DOWNTO 0);
           saida    :   OUT STD_LOGIC_VECTOR (6 DOWNTO 0));
	END COMPONENT;

BEGIN

	REG : reg4bitscont PORT MAP (clk_in, in_port_to_the_button_pio(0), 
		in_port_to_the_button_pio(1), in_port_to_the_button_pio(2), SW(3 DOWNTO 0), saidaReg);
		
	B2D : binary2dec PORT MAP(saidaReg, saidaB2D0, saidaB2D1);
	
	B2H : binary2hex PORT MAP(saidaReg, saidaB2H);

--
----definindo o valor a ser exibido pelo displays de 7 segmentos baseado nas saídas do somador
----obs: HEX é ativo baixo 
HEX0 <= UM WHEN (saidaReg(0)='1') 
	ELSE ZERO;

HEX1 <= UM WHEN (saidaReg(1)='1') 
	ELSE ZERO;
	
HEX2 <= UM WHEN (saidaReg(2)='1') 
	ELSE ZERO;
	
HEX3 <= UM WHEN (saidaReg(3)='1') 
	ELSE ZERO;
	
HEX4 <= saidaB2D0;

--fixando em '0' o valor a ser exibido pelos 3 últimos displays de 7 segmentos
HEX5 <= saidaB2D1;
HEX6 <= (OTHERS => '1');
HEX7 <= saidaB2H;

END comportamento;
