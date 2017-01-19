----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:38:13 01/17/2017 
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
Use IEEE.STD_LOGIC_UNSIGNED.all;

entity gray_counter is
    Port ( RESET : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           CE : in  STD_LOGIC;							-- Counter enable.
           Q : out  STD_LOGIC_VECTOR (2 downto 0); -- Counter output.
           CT : out  STD_LOGIC);							-- Counter terminate.
end gray_counter;

architecture DataFlow of gray_counter is
	component DFF is
		 Port ( D : in  STD_LOGIC;
				  CLK : in  STD_LOGIC;
				  SET : in  STD_LOGIC;
				  RESET : in  STD_LOGIC;
				  Q : out  STD_LOGIC);
	end component;
	
	signal D0, D1, D2 : STD_LOGIC; -- Flip flop inputs.
	signal Q0, Q1, Q2 : STD_LOGIC; -- Flip flop outputs.
	signal INV_RESET : STD_LOGIC;  -- RESET is an active low signal.
	
	signal INV_CE : STD_LOGIC;
	signal INV_Q2, INV_Q1, INV_Q0 : STD_LOGIC;
	
	signal COUNT : STD_LOGIC_VECTOR(2 downto 0);	
	
begin
	INV_RESET <= not RESET;
	
	DFF0 : DFF port map(D => D0, CLK => CLK, SET => INV_RESET, RESET => '0', Q => Q0);
	DFF1 : DFF port map(D => D1, CLK => CLK, SET => '0', RESET => INV_RESET, Q => Q1);	
	DFF2 : DFF port map(D => D2, CLK => CLK, SET => '0', RESET => INV_RESET, Q => Q2);		
	
	CT <= Q2 and (not Q1) and (not Q0);
	
	Q(2) <= Q2;
	Q(1) <= Q1;
	Q(0) <= Q0;
	
	INV_CE <= not CE;
	INV_Q2 <= not Q2;
	INV_Q1 <= not Q1;
	INV_Q0 <= not Q0;

	-- Assign flip flop inputs here. D0 is the least significant bit.
	D0 <= '0';
	D1 <= '0';
	D2 <= '0';
end DataFlow;

