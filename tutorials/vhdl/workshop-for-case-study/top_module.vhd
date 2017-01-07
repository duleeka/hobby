----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:27:11 01/07/2017 
-- Design Name: 
-- Module Name:    top_module - Behavioral 
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

entity top_module is
    Port ( MCLK : in  STD_LOGIC;
           Clear : in  STD_LOGIC;
           CLK200Hz : out  STD_LOGIC;
           Digit_Select : out  STD_LOGIC_VECTOR (3 downto 0);
           SSD : out  STD_LOGIC_VECTOR (6 downto 0));
end top_module;

architecture Behavioral of top_module is
component CLKDIV is
Port(
	MCLOCK: in STD_LOGIC;
	CLK200: out STD_LOGIC;
	CLK3: out STD_LOGIC);
end component;

component BCDCNT is
	Port(
	CLK: in STD_LOGIC;
	CLR: in STD_LOGIC;
	Digit: out STD_LOGIC_VECTOR(3 downto 0)
	);
end component;

component BCD2SSD is
	port(
	Digit: in STD_LOGIC_VECTOR(3 downto 0);
	Sseg: out STD_LOGIC_VECTOR(6 downto 0);
	Digit_Select: out STD_LOGIC_VECTOR(3 downto 0));
end component;

signal Clock3Hz: STD_LOGIC;
signal Digit: STD_LOGIC_VECTOR(3 downto 0);

begin

	B1: CLKDIV Port map (
		MCLOCK => MCLK,
		CLK200 => CLK200Hz,
		CLK3 => Clock3Hz
	);

	B2: BCDCNT Port map (
		CLK => Clock3Hz,
		CLR => Clear,
		Digit => Digit
	);

	B3: BCD2SSD Port map (
		Digit => Digit,
		Sseg => SSD,
		Digit_Select => Digit_Select
	);

end Behavioral;

