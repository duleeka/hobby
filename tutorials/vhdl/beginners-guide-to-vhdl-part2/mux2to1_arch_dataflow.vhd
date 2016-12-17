library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

architecture DataFlow of mux2to1 is

begin
	Z <= ((not C) and A) or (C and B);
end DataFlow;
