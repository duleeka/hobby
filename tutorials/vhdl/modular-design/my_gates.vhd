--
--	Package File Template
--
--	Purpose: This package defines supplemental types, subtypes, 
--		 constants, and functions 
--
--   To use any of the example code shown below, uncomment the lines and modify as necessary
--

library IEEE;
use IEEE.STD_LOGIC_1164.all;

package my_gates is

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
	
end my_gates;

package body my_gates is
 
end my_gates;
