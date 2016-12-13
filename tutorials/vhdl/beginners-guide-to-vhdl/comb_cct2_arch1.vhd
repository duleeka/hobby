----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:43:01 11/19/2016 
-- Design Name: 
-- Module Name:    comb_cct2_arch1 - Behavioral 
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

entity comb_cct2 is
	Port (A, B, C : in  std_logic;
	      Z       : out std_logic);
end comb_cct2;

-- This architecture implements the behavior illustrated as Z = AC' + BC.

architecture circuit1 of comb_cct2 is
	signal w1, w2, w3 : std_logic;
begin
	w1 <= not C;
	w2 <= A and w1;
	w3 <= B and C;
	Z  <= w1 or w3;
end circuit1;

