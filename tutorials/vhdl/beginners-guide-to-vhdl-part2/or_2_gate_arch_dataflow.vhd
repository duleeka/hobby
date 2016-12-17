library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity or_2_gate is
    Port ( X1 : in  STD_LOGIC;
           X2 : in  STD_LOGIC;
           Y : out  STD_LOGIC);
end or_2_gate;

architecture DataFlow of or_2_gate is

begin
	Y <= X1 or X2;
end DataFlow;

