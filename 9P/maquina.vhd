LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY maquina IS
PORT (Reset, clk, c : IN STD_LOGIC;
s, a : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
d : OUT STD_LOGIC);
END maquina;

ARCHITECTURE estrutura OF maquina IS

	COMPONENT bo IS
	-- completar
	END COMPONENT;

	COMPONENT bc IS
	-- completar
	END COMPONENT;

	SIGNAL -- completar

BEGIN
	-- completar
END estrutura;