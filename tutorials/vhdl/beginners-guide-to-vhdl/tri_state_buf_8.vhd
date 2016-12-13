----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:03:51 11/19/2016 
-- Design Name: 
-- Module Name:    tri_state_buf_8 - Behavioral 
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

entity tri_state_buf_8 is
    Port ( E : in  STD_LOGIC;
           D : in  STD_LOGIC_VECTOR (7 downto 0);
           Y : out  STD_LOGIC_VECTOR (7 downto 0));
end tri_state_buf_8;

architecture Behavioral of tri_state_buf_8 is

begin
	process (E, D)
	begin
		if (E = '1') then
			Y <= D;
		else
			Y <= (others => 'Z');
		end if;
	end process;
end Behavioral;

