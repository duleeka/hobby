----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:03:56 11/19/2016 
-- Design Name: 
-- Module Name:    tri_state_buffer_arch1 - Behavioral 
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

entity tri_state_buffer is
	Port (E: in  std_logic;
	      D: in  std_logic;
			Y: out std_logic);
end tri_state_buffer;

architecture Behavioral of tri_state_buffer is

begin
	process (E, D)
	begin
		if (E = '1') then
			Y <= D;
		else
			Y <= 'Z';
		end if;
	end process;

end Behavioral;

