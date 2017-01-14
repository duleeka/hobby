----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:53:59 01/14/2017 
-- Design Name: 
-- Module Name:    nand2 - Behavioral 
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

entity nand2_gate is
    Port ( X1 : in  STD_LOGIC;
           X2 : in  STD_LOGIC;
           Y : out  STD_LOGIC);
end nand2_gate;

architecture Behavioral of nand2_gate is

begin
	Y <= not (X1 and X2);
end Behavioral;

