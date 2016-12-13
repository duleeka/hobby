----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:19:43 11/12/2016 
-- Design Name: 
-- Module Name:    comb_cct_1 - Behavioral 
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

entity comb_cct_1 is
    Port ( A : in  std_logic;
           B : in  std_logic;
           C : in  std_logic;
           Z : out  std_logic);
end comb_cct_1;

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

architecture circuit1 of comb_cct_1 is
	signal w1,w2,w3 : std_logic;
begin
	w1 <= A and B;
	w2 <= B and C;
	w3 <= A and C;
	Z <= w1 or w2 or w3;
	
end circuit1;

