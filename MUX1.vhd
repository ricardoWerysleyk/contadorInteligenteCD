library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX1 is
    Port (
        I0, I1 : in STD_LOGIC;
        S : in STD_LOGIC;
        O : out STD_LOGIC
    );
end MUX1;

architecture Main of MUX1 is
begin
    O <= ((I0 and not(S)) or (I1 and S));
end Main;