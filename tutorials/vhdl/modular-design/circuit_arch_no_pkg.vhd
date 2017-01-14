----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:00:44 01/14/2017 
-- Design Name: 
-- Module Name:    circuit_arch_no_pkg - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Circuit is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           C : in  STD_LOGIC;
           D : in  STD_LOGIC;
           Y : out  STD_LOGIC);
end Circuit;

architecture arch_no_pkg of Circuit is
	
	component and2_gate is
		 Port ( X1 : in  STD_LOGIC;
				  X2 : in  STD_LOGIC;
				  Y : out  STD_LOGIC);
	end component;
	
	component and3_gate is
    Port ( X1 : in  STD_LOGIC;
           X2 : in  STD_LOGIC;
           X3 : in  STD_LOGIC;
           Y : out  STD_LOGIC);
	end component;

	component inverter is
		 Port ( X : in  STD_LOGIC;
				  Y : out  STD_LOGIC);
	end component;
	
	component nand2_gate is
		 Port ( X1 : in  STD_LOGIC;
				  X2 : in  STD_LOGIC;
				  Y : out  STD_LOGIC);
	end component;
	
	signal Y1, Y2, Y3, INV_B : STD_LOGIC;
begin
	G1: inverter port map(X => B, Y => INV_B);
	G2: nand2_gate port map(X1 => A, X2 => INV_B, Y => Y1);
	G3: nand2_gate port map(X1 => B, X2 => C, Y => Y2);
	G4: and2_gate port map(X1 => C, X2 => D, Y => Y3);
	G5: and3_gate port map(X1 => Y1, X2 => Y2, X3 => Y3, Y => Y);
end arch_no_pkg;
