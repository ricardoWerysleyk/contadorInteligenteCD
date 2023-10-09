library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity comparador4bits is
   Port ( A, B : in STD_LOGIC_VECTOR(3 downto 0);
          AeqB, AmeqB, AmaqB : out STD_LOGIC;)
end comparador4bits;

architecture ckt of comparador4bits is

begin
	AeqB <= (A(0) XNOR B(0)) and (A(1) XNOR B(1)) and (A(2) XNOR B(2)) and (A(3) XNOR B(3));
	AmaqB <= (A(3) and not(B(3))) or ((A(3) XNOR B(3)) and not(B(2) and A(2))) or ((A(3) XNOR B(3)) and (A(2) XNOR B(2)) and not(B(1) and A(1))) or ((A(3) XNOR B(3)) and (A(2) XNOR B(2)) and (A(1) XNOR B(1)) and not(B(0) and A(0)));
	AmeqB <= not( AeqB or AmaqB );
end ckt;

