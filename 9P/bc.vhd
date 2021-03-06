LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY bc IS
PORT (Reset, clk, c, menor : IN STD_LOGIC;
d, Ctotal, Rtotal : OUT STD_LOGIC);
END bc;

ARCHITECTURE estrutura OF bc IS
	TYPE tipo_estado IS (INICIO, ESPERA, ACUM, LIBERA);
	SIGNAL estado: tipo_estado;
BEGIN
	-- Logica de proximo estado (e registrador de estado)
	PROCESS (clk, Reset)
	BEGIN
		-- completar
	END PROCESS;
	
	-- Logica de saida
	PROCESS (estado)
	BEGIN
		CASE estado IS
			-- completar
		END CASE;
	END PROCESS;
END estrutura;