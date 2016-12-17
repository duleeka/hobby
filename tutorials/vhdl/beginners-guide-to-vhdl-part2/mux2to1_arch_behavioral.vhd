library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

architecture Behavioral of mux2to1 is

begin
	Z <= A when C = '0' else B;
end Behavioral;
