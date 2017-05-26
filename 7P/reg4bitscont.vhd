LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY reg4bitscont IS
GENERIC (N : INTEGER := 4 );
PORT ( clk, resetn, carga, incr : IN   STD_LOGIC;
       D :   IN      UNSIGNED (N-1 DOWNTO 0);
       Q :   OUT     UNSIGNED (N-1 DOWNTO 0));
END reg4bitscont;

ARCHITECTURE comportamento OF reg4bitscont IS
	
	SIGNAL reg, contador  : UNSIGNED (N-1 downto 0);
    
BEGIN
    
    
    PROCESS (clk, resetn)
    BEGIN
          IF (resetn = '0') THEN
               reg <=  (OTHERS => '0' );
          ELSIF (clk'EVENT AND clk = '1') THEN	   
			   reg <= contador;
          END IF;
    END PROCESS;
    
    PROCESS (resetn, incr, carga)
    BEGIN
		IF (resetn = '0') THEN
            contador <=  (OTHERS => '0' );
        ELSIF (carga = '0') THEN
			contador <= D;
		ELSIF (incr'EVENT AND incr = '0') THEN
			contador <= contador + 1;
		ELSE
			contador <= contador;  
		END IF;  
    END PROCESS;
    
    Q  <= reg;
    
END comportamento; 