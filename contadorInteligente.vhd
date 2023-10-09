library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity contadorInteligente is
   Port ( A0, A1, A2 : in STD_LOGIC_VECTOR(3 downto 0);
          updw, step,clr,maxMin,load,clk : in STD_LOGIC;
			 Q0, Q1, Q2 : out STD_LOGIC_VECTOR(3 downto 0));
end contadorInteligente;

architecture ckt of contadorInteligente is
   signal notLimit, saidaCout1, saidaCout2, notSaidaCout1, saidaMux3, saidaCout : STD_LOGIC;
   signal saidaSomador1, saidaSomador2, saidaMux1, saidaMux2, saidaMux4, saidaMux5, saidaRegis : std_logic_vector(3 downto 0);
	signal notPasso, seis, menosSeis, zero : std_LOGIC_VECTOR(3 downto 0);
   
   component FullAdder4Bit is
      Port ( A, B : in STD_LOGIC_VECTOR(3 downto 0);
          Cin : in STD_LOGIC;
          Sum : out STD_LOGIC_VECTOR(3 downto 0);
          Cout : out STD_LOGIC);
   end component;
	
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
	
	component MUX1 is
		 Port (
			  I0, I1 : in STD_LOGIC;
			  S : in STD_LOGIC;
			  O : out STD_LOGIC
		 );
	end component;

begin
	notLimit <= not(limite);
   M1: mux_4_bits port map(A0, saidaSomador2,load,saidaMux1);

end ckt;

