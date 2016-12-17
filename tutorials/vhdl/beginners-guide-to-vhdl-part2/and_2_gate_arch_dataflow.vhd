library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity and_2_gate is
    Port ( X1 : in  STD_LOGIC;
           X2 : in  STD_LOGIC;
           Y : out  STD_LOGIC);
end and_2_gate;

architecture DataFlow of and_2_gate is

begin
	Y <= X1 and X2;
end DataFlow;

