LIBRARY ieee ;
USE ieee.std_logic_1164.all ;

ENTITY arbitro IS
  PORT ( Clock, Reset: IN STD_LOGIC ; 
         r: IN STD_LOGIC_VECTOR (1 TO 3);
         c: OUT STD_LOGIC_VECTOR (1 TO 3) );
END arbitro ;

ARCHITECTURE comportamento OF arbitro IS
  
  TYPE Tipo_estado IS (BD, D1, D2, D3) ;
  SIGNAL y : Tipo_estado ;
  
  
 BEGIN
    PROCESS ( Reset, Clock )
    BEGIN
      IF Reset = '1' THEN
         y <= BD ;
      ELSIF (Clock'EVENT AND Clock = '1') THEN
        CASE y IS
           WHEN BD =>
             IF r(1)= '1' THEN
                   y <= D1 ;
             ELSIF r(2)= '1' THEN
                   y <= D2 ;
               ELSIF r(3)= '1' THEN
                     y <= D3;
               ELSE y <= BD;      
             END IF ;
           WHEN D1 =>
             
		--completar

         END CASE ;
      END IF ;
   END PROCESS ;
   
   WITH y SELECT
     c <= "000" WHEN BD,
          --completar
   
END comportamento ;