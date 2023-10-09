library ieee;
use ieee.std_logic_1164.all;

entity mux_4_bits is
	port (E0, E1: in std_logic_vector(3 downto 0);
					set: in  std_logic;
					s: out std_logic_vector(3 downto 0));
end mux_4_bits;

architecture logica of mux_4_bits is

begin
   begin
      s <= (E0 and not(set)) or (E1 and set)
end logica;
