----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:20:00 01/17/2017 
-- Design Name: 
-- Module Name:    DFF - Behavioral 
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

entity DFF is
    Port ( D : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           SET : in  STD_LOGIC;
           RESET : in  STD_LOGIC;
           Q : out  STD_LOGIC);
end DFF;

architecture Behavioral of DFF is

begin
	process (D, CLK, SET, RESET)
	begin
		if (RESET = '1') then
			Q <= '0';
		elsif (SET = '1') then
			Q <= '1';
		elsif (CLK'event and CLK = '1') then
			Q <= D;
		end if;
	end process;	
end Behavioral;

