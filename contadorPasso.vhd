library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity contadorPasso is
   Port ( A0, passo : in STD_LOGIC_VECTOR(3 downto 0);
          updw : in STD_LOGIC;
			 clr : in STD_LOGIC;
			 limite : in STD_LOGIC;
			 load : in STD_LOGIC;
			 ck : in STD_LOGIC;
          Cout : out STD_LOGIC;
			 Q0 : out STD_LOGIC_VECTOR(3 downto 0));
end contadorPasso;

architecture ckt of contadorPasso is
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
	R1: registrador_4_bits port map(ck,clr,notLimit,saidaMux1,saidaRegis);
	Q0 <= saidaRegis;
	S1 : FullAdder4Bit port map(saidaRegis, saidaMux2, '0', saidaSomador1, saidaCout1);
	notPasso <= not(passo);
	M2: mux_4_bits port map(notPasso, passo, updw, saidaMux2);
	S2 : FullAdder4Bit port map(saidaSomador1, saidaMux4, '0', saidaSomador2, saidaCout2);
	notSaidaCout1 <= not(saidaCout1);
	M3: MUX1 port map(notSaidaCout1, saidaCout1, updw, saidaMux3);
	saidaCout <= (saidaMux3 or (saidaSomador1(3) and (saidaSomador1(2) or saidaSomador1(1))));
	Cout <= saidaCout;
	seis <= "0110";
	menosSeis <= "1010";
	zero <= "0000";
	M4: mux_4_bits port map(zero, saidaMux5, saidaCout, saidaMux4);
	M5: mux_4_bits port map(menosSeis, seis, updw, saidaMux5);

end ckt;





