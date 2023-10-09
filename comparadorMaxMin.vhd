library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity comparadorMaxMin is
   Port ( A0, A1, A2, Q0, Q1, Q2 : in STD_LOGIC_VECTOR(3 downto 0);
          updw: in STD_LOGIC;
			 limite: out STD_LOGIC;)
end comparadorMaxMin;

architecture ckt of comparadorMaxMin is

component comparador4bits is
   Port ( A, B : in STD_LOGIC_VECTOR(3 downto 0);
          AeqB, AmeqB, AmaqB : out STD_LOGIC;)
end component;

begin
	comp1: comparador4bits port map();
end ckt;

