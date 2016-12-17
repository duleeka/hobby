
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity and_3_gate is
    Port ( X1 : in  STD_LOGIC;
           X2 : in  STD_LOGIC;
           X3 : in  STD_LOGIC;
           Y : out  STD_LOGIC);
end and_3_gate;

architecture DataFlow of and_3_gate is

begin
	Y <= X1 and X2 and X3;
end DataFlow;

