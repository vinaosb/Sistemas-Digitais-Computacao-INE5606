LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY bc IS
PORT (Reset, clk, inicio : IN STD_LOGIC;
      Az, Bz : IN STD_LOGIC;
      pronto : OUT STD_LOGIC;
      ini, CA, dec, CP: OUT STD_LOGIC );
END bc;

-- Sinais de comando
-- ini = RstP = mA = CB  => ini=1 somente em S1
-- CA=1 em S1 e em S4
-- dec = op = m1 = m2  => dec=1 somente em S4 (estado no qual ocorre A <= A - 1 )
-- CP=1 somente em S3 (estado no qual ocorre P <= P + B )


ARCHITECTURE estrutura OF bc IS
	TYPE state_type IS (S0, S1, S2, S3, S4, S5 );
	SIGNAL state, nextstate: state_type;
BEGIN

	-- Logica de proximo estado (e registrador de estado)
	PROCESS (clk, Reset)
	BEGIN
		state <= nextstate;
		if(Reset = '1') THEN
			nextstate <= S0 ;
			state <= S0;
		ELSIF (clk'EVENT AND clk = '1') THEN
			CASE state IS
				WHEN S0 =>
					if (inicio = '1') then
						nextstate <= S1;
					else
						nextstate <= S0;
					end if;

				WHEN S1 =>
					nextstate <= S2;

				WHEN S2 =>
					if ((Az and Bz) = '0') then
						nextstate <= S3;
					else
						nextstate <= S5;
					end if;

				WHEN S3 =>
					nextstate <= S4;

				WHEN S4 =>
					nextstate <= S2;

				WHEN S5 =>
					nextstate <= S0;

			END CASE;
		END IF;
	END PROCESS;
	
	-- Logica de saida
	PROCESS (state)
	BEGIN
		CASE state IS
			WHEN S0 =>
				ini <= '0';
				CA <= '0';
				dec <= '0';
				CP <= '0';
				pronto <= '0';
				
			WHEN S1 =>
				ini <= '1';
				CP <= '0';
				CA <= '1';
				dec <= '0';
				pronto <= '0';
				
			WHEN S2 =>
				ini <= '0';
				CP <= '0';
				CA <= '0';
				dec <= '0';
				pronto <= '0';
				
			WHEN S3 =>
				ini <= '0';
				CP <= '1';
				CA <= '0';
				dec <= '0';
				pronto <= '0';
				
			WHEN S4 =>
				ini <= '0';
				CP <= '0';
				CA <= '1';
				dec <= '1';
				pronto <= '0';
				
			WHEN S5 =>
				ini <= '0';
				CP <= '0';
				CA <= '0';
				dec <= '0';
				pronto <= '1';
				
		END CASE;
	END PROCESS;
END estrutura;