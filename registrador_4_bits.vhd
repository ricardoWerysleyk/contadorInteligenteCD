library ieee;
use ieee.std_logic_1164.all;


entity registrador_4_bits is

	port(	ck, clr, set: in std_logic;
			A: in std_logic_vector(3 downto 0);
			Q: out std_logic_vector(3 downto 0));

end registrador_4_bits;


architecture logica of registrador_4_bits is
	component flipflopd is
		port (ck, clr, set, d : in  std_logic;
								  q : out std_logic);
	end component;

	begin		
		U3: flipflopd port map(ck, clr, set, A(3), Q(3));
		U2: flipflopd port map(ck, clr, set, A(2), Q(2));
		U1: flipflopd port map(ck, clr, set, A(1), Q(1));
		U0: flipflopd port map(ck, clr, set, A(0), Q(0));
		
	
end logica;