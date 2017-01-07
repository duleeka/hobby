----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:19:49 01/07/2017 
-- Design Name: 
-- Module Name:    BCD_counter - Behavioral 
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
Library IEEE;
Use IEEE.std_logic_1164.all;
Use IEEE.STD_LOGIC_UNSIGNED.all;

entity BCDCNT is
	Port(
	CLK: in STD_LOGIC;
	CLR: in STD_LOGIC;
	Digit: out STD_LOGIC_VECTOR(3 downto 0)
	);
end BCDCNT;

architecture Behavioral of BCDCNT is
	Signal COUNT: STD_LOGIC_VECTOR (3 downto 0) := "0000";
begin
	process (CLK, CLR)
	begin
		if CLR = '1' then
			COUNT <= "0000";
		elsif (CLK'EVENT AND CLK = '1') Then
			if (COUNT = "1010") then
				COUNT <= "0000";
			else
				COUNT <= COUNT + 1;
			end if;
		end if;
	end Process;
	
	Digit <= COUNT;
end Behavioral;

