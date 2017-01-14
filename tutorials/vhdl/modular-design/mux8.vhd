----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:41:29 01/14/2017 
-- Design Name: 
-- Module Name:    mux8 - Behavioral 
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

entity mux8 is
    Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);
           S : in  STD_LOGIC;
           Z : out  STD_LOGIC_VECTOR (7 downto 0));
end mux8;

architecture Behavioral of mux8 is
	component mux2to1 is
		 Port ( A : in  STD_LOGIC;
				  B : in  STD_LOGIC;
				  S : in  STD_LOGIC;
				  Z : out  STD_LOGIC);
	end component;
begin
	-- positional mapping.
	M0 : mux2to1 port map(A(0), B(0), S, Z(0));
	-- nominal mapping.
	M1 : mux2to1 port map(A => A(1), B => B(1), S => S, Z => Z(1));
	M2 : mux2to1 port map(A => A(2), B => B(2), S => S, Z => Z(2));
	M3 : mux2to1 port map(A => A(3), B => B(3), S => S, Z => Z(3));
	M4 : mux2to1 port map(A => A(4), B => B(4), S => S, Z => Z(4));
	M5 : mux2to1 port map(A => A(5), B => B(5), S => S, Z => Z(5));
	M6 : mux2to1 port map(A => A(6), B => B(6), S => S, Z => Z(6));
	M7 : mux2to1 port map(A => A(7), B => B(7), S => S, Z => Z(7));	
end Behavioral;

