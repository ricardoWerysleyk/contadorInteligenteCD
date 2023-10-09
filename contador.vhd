library ieee;
use ieee.std_logic_1164.all;


entity contador is

	port(	ck, clr, set, load, step, max_min: in std_logic;
			A2, A1, A0: in std_logic_vector(3 downto 0);
			Q2, Q1, Q0: out std_logic_vector(3 downto 0));

end contador;



architecture logica of contador is
	component memoria_max_min is

		port(	ck, clr, set, load, max_min: in std_logic;
				A2, A1, A0: in std_logic_vector(3 downto 0);
				Q2, Q1, Q0: out std_logic_vector(3 downto 0));

	end component;
	
	component memoria_passo is

		port(	ck, clr, set, load, step: in std_logic;
				A0: in std_logic_vector(3 downto 0);
				Q0: out std_logic_vector(3 downto 0));

	end component;
	
	signal saida_max_min_2, saida_max_min_1, saida_max_min_0: std_logic_vector(3 downto 0);
	signal saida_memoria_passo_0: std_logic_vector(3 downto 0);
	
	begin
		U1: memoria_max_min port map(ck, clr, set, load, max_min, A2, A1, A0, saida_max_min_2, saida_max_min_1, saida_max_min_0);
		U0: memoria_passo port map(ck, clr, set, load, step, A0, saida_memoria_passo_0);
	
end logica;