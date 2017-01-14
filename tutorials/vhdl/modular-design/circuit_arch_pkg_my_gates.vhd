----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:14:43 01/14/2017 
-- Design Name: 
-- Module Name:    circuit_arch_pkg_my_gates - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use Work.my_gates.ALL;

architecture arch_pkg_my_gates of Circuit is
	signal Y1, Y2, Y3, INV_B : STD_LOGIC;
begin

	G1: inverter port map(X => B, Y => INV_B);
	G2: nand2_gate port map(X1 => A, X2 => INV_B, Y => Y1);
	G3: nand2_gate port map(X1 => B, X2 => C, Y => Y2);
	G4: and2_gate port map(X1 => C, X2 => D, Y => Y3);
	G5: and3_gate port map(X1 => Y1, X2 => Y2, X3 => Y3, Y => Y);
	
end arch_pkg_my_gates;

