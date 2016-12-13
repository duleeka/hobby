----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:16:09 11/19/2016 
-- Design Name: 
-- Module Name:    shifter_8bit - Behavioral 
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

--Function Table
-- Control Inputs  Function
-- C(1) C(0)
--  0    0         Pass data in unchanged.
--  0    1         Shift left with 0 in the right most bit.
--  1    0         Shift right with 0 in the left most bit.
--  1    1         Rotate right all bits.

entity shifter_8bit is
	Port (A : in  std_logic_vector (7 downto 0);
	      C : in  std_logic_vector (1 downto 0);
			Y : out std_logic_vector (7 downto 0));
end shifter_8bit;

architecture Behavioral of shifter_8bit is

begin
		process (A, C)
		begin
			case C is
				when "00" =>
					Y <= A;
				when "01" =>
					Y <= A(6 downto 0)& '0';
				when "10" =>
					Y <= '0' & A (7 downto 1);
				when others =>
					Y <= A(0) & A (7 downto 1);
			end case;			
		end process;
end Behavioral;

