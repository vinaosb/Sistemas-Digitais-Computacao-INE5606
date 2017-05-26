LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY binary2dec IS
PORT ( entrada  :   IN  UNSIGNED (3 DOWNTO 0);
       saidaUnidades, saidaDezenas  :   OUT STD_LOGIC_VECTOR (6 DOWNTO 0));
END binary2dec;

ARCHITECTURE comportamento OF binary2dec IS
	
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


BEGIN
    
    saidaUnidades <= ZERO   WHEN (entrada = "0000" or entrada = "1010") ELSE -- ZERO
					 UM     WHEN (entrada = "0001" or entrada = "1011") ELSE -- UM
					 DOIS   WHEN (entrada = "0010" or entrada = "1100") ELSE -- DOIS
					 TRES   WHEN (entrada = "0011" or entrada = "1101") ELSE -- TRES
					 QUATRO WHEN (entrada = "0100" or entrada = "1110") ELSE -- QUATRO
					 CINCO  WHEN (entrada = "0101" or entrada = "1111") ELSE -- CINCO
					 SEIS   WHEN (entrada = "0110")                     ELSE -- SEIS
					 SETE   WHEN (entrada = "0111")                     ELSE -- SETE
					 OITO   WHEN (entrada = "1000")                     ELSE -- OITO
					 NOVE;   												 -- NOVE
    
    saidaDezenas <= UM WHEN (entrada > "1001") ELSE -- UM
				    ZERO;
    
END comportamento; 