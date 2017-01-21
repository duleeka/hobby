----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:04:47 01/21/2017 
-- Design Name: 
-- Module Name:    bi_directional_shift_reg_n_bit - Behavioral 
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

entity bi_directional_shift_reg_n_bit is
	 generic (n : natural := 8);
    Port ( CLOCK : in  STD_LOGIC;
           RIN : in  STD_LOGIC;                           -- Right in.
           LIN : in  STD_LOGIC;                           -- Left in.
           DIR : in  STD_LOGIC;	                         -- Shift direction.
			  LOAD : in STD_LOGIC;		                      -- Load external input.
           DATA : in  STD_LOGIC_VECTOR (0 to n - 1);      -- External input.
           Q : out  STD_LOGIC_VECTOR (0 to n - 1));       -- Output.
end bi_directional_shift_reg_n_bit;

architecture Behavioral of bi_directional_shift_reg_n_bit is
	signal reg : std_logic_vector(0 to n - 1);
begin
	Q <= REG;

	process (CLOCK)
	begin
		if (CLOCK'event and CLOCK = '1') then
			if (LOAD = '1') then
				REG <= DATA;
			else
				if (DIR = '0') then -- Shift right
					REG <= RIN & REG(0 to (n - 2));
				else                -- Shift left
					REG <= REG(1 to (n - 1)) & LIN;
				end if;
			end if;
		end if;
	end process;

end Behavioral;

