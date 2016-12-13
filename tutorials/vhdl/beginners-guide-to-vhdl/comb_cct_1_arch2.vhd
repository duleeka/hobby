----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:16:19 11/19/2016 
-- Design Name: 
-- Module Name:    comb_cct_1_arch2 - Behavioral 
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

-- This architecture implements the behavior illustrated in following truth table.
--     Inputs        Outputs
-- A      B      C      Z
-- 0      0      0      0
-- 0      0      1      0
-- 0      1      0      0
-- 0      1      1      1
-- 1      0      0      0
-- 1      0      1      1
-- 1      1      0      1
-- 1      1      1      1


architecture circuit2 of comb_cct_1 is

begin
	Z <= '1' when (A = '1' and B = '1') else
	     '1' when (A = '1' and C = '1') else
		  '1' when (B = '1' and C = '1') else
		  '0';

end circuit2;

