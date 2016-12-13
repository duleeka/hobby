----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:52:23 11/19/2016 
-- Design Name: 
-- Module Name:    mux_4to1_arch1 - Behavioral 
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

entity mux_4to1_arch1 is
	Port (A, B, C, D : in  std_logic;
	      SEL        : in  std_logic_vector (1 downto 0);
			Z          : out std_logic);
end mux_4to1_arch1;

architecture Behavioral of mux_4to1_arch1 is
	
begin
	Z <= A when (SEL = "00") else
	     B when (SEL = "01") else
		  C when (SEL = "10") else
		  D when (SEL = "11") else
		  '0';

end Behavioral;

