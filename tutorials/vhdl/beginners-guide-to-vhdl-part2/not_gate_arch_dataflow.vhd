library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity not_gate is
    Port ( X : in  STD_LOGIC;
           Y : out  STD_LOGIC);
end not_gate;

architecture DataFlow of not_gate is
begin
	Y <= not X;
end DataFlow;

