library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity or_4_gate is
    Port ( X1 : in  STD_LOGIC;
           X2 : in  STD_LOGIC;
           X3 : in  STD_LOGIC;
           X4 : in  STD_LOGIC;
           Y : out  STD_LOGIC);
end or_4_gate;

architecture DataFlow of or_4_gate is

begin
	Y <= X1 or X2 or X3 or X4;
end DataFlow;

