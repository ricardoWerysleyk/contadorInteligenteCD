library ieee;
use ieee.std_logic_1164.all;

entity mux_4_bits is
	port (E0, E1: in std_logic_vector(3 downto 0);
					set: in  std_logic;
					s: out std_logic_vector(3 downto 0));
end mux_4_bits;

architecture logica of mux_4_bits is

begin
   process(E0, E1, set)
   begin
      if    (set = '0')            then s <= E0;
      else s <= E1;   
      end if;   
   end process;   
end logica;