library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity xnor_2_gate is
    Port ( X1 : in  STD_LOGIC;
           X2 : in  STD_LOGIC;
           Y : out  STD_LOGIC);
end xnor_2_gate;

architecture DataFlow of xnor_2_gate is

begin
	Y <= not (X1 xor X2);
end DataFlow;

