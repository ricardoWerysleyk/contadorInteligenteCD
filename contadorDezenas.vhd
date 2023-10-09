library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity contadorDezenas is
   Port ( A1, passo : in STD_LOGIC_VECTOR(3 downto 0);
          updw, cin, clr, load, ck, limite : in STD_LOGIC;
          Cout : out STD_LOGIC;
			 Q1 : out STD_LOGIC_VECTOR(3 downto 0));
end contadorDezenas;

architecture ckt of contadorDezenas is
   signal saidaMux1, saidaMux2, saidaMux3, saidaMux4, saidaMux5, saidaMux6, saidaMux7, saidaMux8, saidaMux9, saidaMux10, saidaMux11 : STD_LOGIC;
   signal notLimite, J1, J2, J3, J4, K1, K2, K3, K4, sQ1, sQ2, sQ3, sQ4, E1, E2, E3, E4 : STD_LOGIC;
	SIGnal entrada1Mux1, entrada1Mux2, entrada0Mux3, entrada0Mux4, entrada1Mux5, entrada0Mux6, saidaCout : STD_LOGIC;
	signal entrada0Mux7, entrada1Mux8, entrada0Mux9, entrada0Mux10, entrada1Mux10, entrada1Mux11 : std_LOGIC;
	signal saidaSomador1: std_logic_vector(3 downto 0);
	
	component MUX1 is
		 Port (
			  I0, I1 : in STD_LOGIC;
			  S : in STD_LOGIC;
			  O : out STD_LOGIC
		 );
	end component;
	
	component ffjk is
		port (ck, clr, set, j, k : in  std_logic;
									  q : out std_logic);
	end component;

begin
	saidaCout <= (cin and ( ( ( sQ1 and sQ4 ) and updw ) or ( (not(updw)) and ( not( sQ1 or sQ2 or sQ3 or sQ4 ) ) ) ) );
	Cout <= saidaCout;
	entrada1Mux1 <= ( ((not(updw)) and ( not( sQ1 or sQ2 or sQ3 or sQ4 ) )) xor (sQ1) );
	
   M1: MUX1 port map(cin, entrada1Mux1, saidaCout, saidaMux1);
	entrada1Mux2 <= A1(0) XOR sQ1;
	M2: MUX1 port map(saidaMux1, entrada1Mux2, load, saidaMux2);
	
	J1 <= saidaMux2;
	K1 <= saidaMux2;
	notLimite <= not(limite);
	JK1: ffjk port map(ck, clr, notLimite, J1, K1, sQ1);
	
	entrada0Mux3 <= not(sQ1);
	M3: MUX1 port map(entrada0Mux3, sQ1, updw, saidaMux3);
	entrada0Mux4 <= saidaMux3 and saidaMux2;
	M4: MUX1 port map(entrada0Mux4, '0', saidaCout, saidaMux4);
	
	entrada1Mux5 <= A1(1) xor sQ2;
	M5: MUX1 port map(saidaMux4, entrada1Mux5, load, saidaMux5);
	
	J2 <= saidaMux5;
	K2 <= saidaMux5;
	JK2: ffjk port map(ck, clr, notLimite, J2, K2, sQ2);
	
	entrada0Mux6 <= not(sQ2);
	M6: MUX1 port map(entrada0Mux6, sQ2, updw, saidaMux6);
	
	entrada0Mux7 <= saidaMux6 and  saidaMux5;
	M7: MUX1 port map(entrada0Mux7, '0', saidaCout, saidaMux7);
	
	entrada1Mux8 <= A1(2) xor sQ3;
	M8: MUX1 port map(saidaMux7, entrada1Mux8, load, saidaMux8);
	
	J3 <= saidaMux8;
	K3 <= saidaMux8;
	JK3: ffjk port map(ck, clr, notLimite, J3, K3, sQ3);
	
	entrada0Mux9 <= not(sQ3);
	M9: MUX1 port map(entrada0Mux9, sQ3, updw, saidaMux9);
	
	entrada0Mux10 <= saidaMux9 and saidaMux8;
	entrada1Mux10 <= ( ((not(updw)) and ( not( sQ1 or sQ2 or sQ3 or sQ4 ) )) xor (sQ4) );
	M10: MUX1 port map(entrada0Mux10, entrada1Mux10, saidaCout, saidaMux10);
	
	entrada1Mux11 <= A1(3) xor sQ3;	
	M11: MUX1 port map(saidaMux10, entrada1Mux11, load, saidaMux11);
	
	Q1(0) <= sQ1;
	Q1(1) <= sQ2;
	Q1(2) <= sQ3;
	Q1(3) <= sQ4;
	
end ckt;





