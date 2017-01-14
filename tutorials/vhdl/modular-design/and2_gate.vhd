----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:56:55 01/14/2017 
-- Design Name: 
-- Module Name:    and2 - Behavioral 
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

entity and2_gate is
    Port ( X1 : in  STD_LOGIC;
           X2 : in  STD_LOGIC;
           Y : out  STD_LOGIC);
end and2_gate;

architecture Behavioral of and2_gate is

begin
	Y <= X1 and X2;
end Behavioral;

