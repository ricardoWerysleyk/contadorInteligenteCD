library ieee;
use ieee.std_logic_1164.all;


entity memoria_max_min is

	port(	ck, clr, set, load, max_min: in std_logic;
			A2, A1, A0: in std_logic_vector(3 downto 0);
			Q2, Q1, Q0: out std_logic_vector(3 downto 0));

end memoria_max_min;



architecture logica of memoria_max_min is
	-- Componentes utilizados na construção da entidade.
	component registrador_4_bits is
		port(	ck, clr, set: in std_logic;
				A: in std_logic_vector(3 downto 0);
				Q: out std_logic_vector(3 downto 0));
	end component;
	
	component mux_4_bits is
		port (E0, E1: in std_logic_vector(3 downto 0);
				set: in  std_logic;
				s: out std_logic_vector(3 downto 0));
	end component;
	-- Variáveis auxiliares
	signal saida_mux2, saida_mux1, saida_mux0: std_logic_vector(3 downto 0);
	signal saida_registrador2, saida_registrador1, saida_registrador0: std_logic_vector(3 downto 0);
	signal selection: std_logic;
	begin		
	-- Passando as variáveis para os componentes já existentes
		M2: mux_4_bits port map (saida_registrador2, A2, selection, saida_mux2);
		M1: mux_4_bits port map (saida_registrador1, A1, selection, saida_mux1);
		M0: mux_4_bits port map (saida_registrador0, A0, selection, saida_mux0);
		U2: registrador_4_bits port map(ck, clr, set, saida_mux2, saida_registrador2);
		U1: registrador_4_bits port map(ck, clr, set, saida_mux1, saida_registrador1);
		U0: registrador_4_bits port map(ck, clr, set, saida_mux0, saida_registrador0);
		-- lógica da memória, usando o mux para seleção
		selection <= load and max_min;
	 -- passando as saídas do registrador para a saída da entidade.
	 Q2 <= saida_registrador2;
	 Q1 <= saida_registrador1;
	 Q0 <= saida_registrador0;
end logica;
