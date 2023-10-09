library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity comparadorMaxMin is
   Port ( A0, A1, A2, Q0, Q1, Q2 : in STD_LOGIC_VECTOR(3 downto 0);
          updw: in STD_LOGIC;
			 limite: out STD_LOGIC;)
end comparadorMaxMin;

architecture ckt of comparadorMaxMin is

signal AeqB1, AeqB2, AeqB3, AmqB1, AmqB2, AmqB3, entradaMux0, entradaMux1: STD_LOGIC;

component comparador4bits is
   Port ( A, B : in STD_LOGIC_VECTOR(3 downto 0);
          AeqB, AmqB : out STD_LOGIC;)
end component;

component MUX1 is
    Port (
        I0, I1 : in STD_LOGIC;
        S : in STD_LOGIC;
        O : out STD_LOGIC
    );
end component;

begin
	comp1: comparador4bits port map(A0,Q0,AeqB1,AmqB1);
	comp2: comparador4bits port map(A1,Q1,AeqB2,AmqB2);
	comp3: comparador4bits port map(A2,Q2,AeqB3,AmqB3);
	m1: MUX1 port map(entradaMux0, entradaMux1, updw, limite);
	entradaMux0 <= (AeqB1 and AeqB2 and AeqB3) or not(entradaMux1);
	entradaMux1 <= (AeqB1 and AeqB2 and AeqB3) or (AmqB1 or (AeqB1 and AmqB2) or ( AeqB1 and AeqB2 or AmqB3))
	end ckt;)

