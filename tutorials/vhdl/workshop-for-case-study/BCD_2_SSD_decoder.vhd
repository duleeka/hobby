----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:14:56 01/07/2017 
-- Design Name: 
-- Module Name:    BCD_2_SSD_decoder - Behavioral 
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

entity BCD2SSD is
	port(
	Digit: in STD_LOGIC_VECTOR(3 downto 0);
	Sseg: out STD_LOGIC_VECTOR(6 downto 0);
	Digit_Select: out STD_LOGIC_VECTOR(3 downto 0));
end BCD2SSD;

architecture Behavioral of BCD2SSD is
begin
	-- Enabling the Most Sign. Digit
	Digit_Select <= "0111"; 

	process (Digit)
	begin		
		case Digit is
			when X"0" => Sseg <= "0000001"; --0
			when X"1" => Sseg <= "1001111"; --1
			when X"2" => Sseg <= "0010010"; --2
			when X"3" => Sseg <= "0000110"; --3
			when X"4" => Sseg <= "1001100"; --4
			when X"5" => Sseg <= "0100100"; --5
			when X"6" => Sseg <= "0100000"; --6
			when X"7" => Sseg <= "0001101"; --7
			when X"8" => Sseg <= "0000000"; --8
			when X"9" => Sseg <= "0000100"; --9
			when X"A" => Sseg <= "0001000"; --A
			when X"B" => Sseg <= "1100000"; --b
			when X"C" => Sseg <= "0110001"; --C
			when X"D" => Sseg <= "1000010"; --d
			when X"E" => Sseg <= "0110000"; --E
			when others => Sseg <= "0111000"; --F
		end case;
	end Process;
end Behavioral;

