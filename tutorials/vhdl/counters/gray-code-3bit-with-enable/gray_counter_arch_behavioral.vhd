----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:27:12 01/17/2017 
-- Design Name: 
-- Module Name:    gray_counter - Behavioral 
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

architecture Behavioral of gray_counter is
	signal COUNT : STD_LOGIC_VECTOR(2 downto 0);
begin

	process (RESET, CLK, CE)
	begin
		if (RESET = '0') then
			COUNT <= "001";
		elsif (CLK'EVENT and CLK = '1') then
			if (CE = '1') then
				COUNT <= COUNT + 1;
			else
				COUNT <= COUNT;
			end if;
		end if;
		
	
	end process;
	
	process (COUNT)
	begin
		if (COUNT = "111") then
			CT <= '1';
		else 
			CT <= '0';
		end if;
	end process;

	Q(2) <= COUNT(2);
	Q(1) <= (COUNT(2) and (not COUNT(1))) or ((not COUNT(2)) and COUNT(1));
	Q(0) <= ((not COUNT(1)) and COUNT(0)) or (COUNT(1) and (not COUNT(0)));
end Behavioral;

