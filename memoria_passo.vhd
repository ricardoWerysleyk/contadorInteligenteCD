library ieee;
use ieee.std_logic_1164.all;


entity memoria_passo is

	port(	ck, clr, set, load, step: in std_logic;
			A0: in std_logic_vector(3 downto 0);
			Q0: out std_logic_vector(3 downto 0));

end memoria_passo;



architecture logica of memoria_passo is
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
	signal saida_mux0, saida_registrador0: std_logic_vector(3 downto 0);
	signal selection: std_logic;
	
	begin		
	-- Passando as variáveis para os componentes já existentes
		M0: mux_4_bits port map (saida_registrador0, A0, selection, saida_mux0);
		U0: registrador_4_bits port map(ck, clr, set, saida_mux0, saida_registrador0);
		-- lógica da memória, usando o mux para seleção
		selection <= load and step
	 -- passando as saídas do registrador para a saída da entidade.
	 Q0 <= saida_registrador0;
end logica;
