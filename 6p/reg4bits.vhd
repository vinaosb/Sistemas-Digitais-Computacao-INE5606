LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY reg4bits IS
GENERIC (N : INTEGER := 4 );
PORT ( Resetn, clk : IN   STD_LOGIC;
       D :   IN      STD_LOGIC_VECTOR (N-1 DOWNTO 0);
       Q :   OUT     STD_LOGIC_VECTOR (N-1 DOWNTO 0));
END reg4bits;

ARCHITECTURE comportamento OF reg4bits IS
BEGIN
    PROCESS (clk, Resetn )
    BEGIN
          IF Resetn = '0' THEN
               Q <=  (OTHERS => '0' );
          ELSIF clk'EVENT AND clk = '1' THEN
			   Q  <= D;
          END IF;
    END PROCESS;
END comportamento; 