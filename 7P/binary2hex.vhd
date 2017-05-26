LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY binary2hex IS
PORT ( entrada  :   IN  UNSIGNED (3 DOWNTO 0);
       saida    :   OUT STD_LOGIC_VECTOR (6 DOWNTO 0));
END binary2hex;

ARCHITECTURE comportamento OF binary2hex IS

	constant ZERO     : std_logic_vector(6 downto 0) := "1000000";
	constant UM       : std_logic_vector(6 downto 0) := "1111001";
	constant DOIS     : std_logic_vector(6 downto 0) := "0100100";
	constant TRES     : std_logic_vector(6 downto 0) := "0110000";
	constant QUATRO   : std_logic_vector(6 downto 0) := "0011001";
	constant CINCO    : std_logic_vector(6 downto 0) := "0010010";
	constant SEIS     : std_logic_vector(6 downto 0) := "0000010";
	constant SETE     : std_logic_vector(6 downto 0) := "1111000";
	constant OITO     : std_logic_vector(6 downto 0) := "0000000";
	constant NOVE     : std_logic_vector(6 downto 0) := "0010000";
	constant A        : std_logic_vector(6 downto 0) := "0001000";
	constant B        : std_logic_vector(6 downto 0) := "0000011";
	constant C        : std_logic_vector(6 downto 0) := "1000110";
	constant D        : std_logic_vector(6 downto 0) := "0100001";
	constant E        : std_logic_vector(6 downto 0) := "0000110";
	constant F        : std_logic_vector(6 downto 0) := "0001110";

BEGIN
    
            saida <= ZERO   WHEN (entrada = "0000") ELSE -- ZERO
					 UM     WHEN (entrada = "0001") ELSE -- UM
					 DOIS   WHEN (entrada = "0010") ELSE -- DOIS
					 TRES   WHEN (entrada = "0011") ELSE -- TRES
					 QUATRO WHEN (entrada = "0100") ELSE -- QUATRO
					 CINCO  WHEN (entrada = "0101") ELSE -- CINCO
					 SEIS   WHEN (entrada = "0110") ELSE -- SEIS
					 SETE   WHEN (entrada = "0111") ELSE -- SETE
					 OITO   WHEN (entrada = "1000") ELSE -- OITO
					 NOVE   WHEN (entrada = "1001") ELSE -- NOVE
					 A      WHEN (entrada = "1010") ELSE -- A
					 B 		WHEN (entrada = "1011") ELSE -- B
					 C 		WHEN (entrada = "1100") ELSE -- C
					 D 		WHEN (entrada = "1101") ELSE -- D
					 E 		WHEN (entrada = "1110") ELSE -- E
					 F;									 -- F
					 
    

END comportamento; 