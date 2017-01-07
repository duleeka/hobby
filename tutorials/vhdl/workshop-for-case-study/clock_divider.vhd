----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:08:06 01/07/2017 
-- Design Name: 
-- Module Name:    clock_divider - Behavioral 
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

Entity CLKDIV is
Port(
	MCLOCK: in STD_LOGIC;
	CLK200: out STD_LOGIC;
	CLK3: out STD_LOGIC);
End CLKDIV;

Architecture Behavioral of CLKDIV is
	Signal Q: STD_LOGIC_VECTOR(23 downto 0):= X"000000";
Begin
	Process (MCLOCK)
	Begin
		if MCLOCK'event and MCLOCK = '1' then
			Q <= Q + 1;
		end if;
	End Process;
	
	-- 200 Hz Clock Output
	CLK200 <= Q(17); 
	
	-- 3 Hz Clock Output
	CLK3 <= Q(23); 
End Behavioral;

