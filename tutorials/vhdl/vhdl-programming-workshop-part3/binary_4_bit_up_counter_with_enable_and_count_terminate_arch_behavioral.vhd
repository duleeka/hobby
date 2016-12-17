----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:40:49 12/17/2016 
-- Design Name: 
-- Module Name:    binary_4_bit_up_counter_with_enable_and_count_terminate - Behavioral 
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
use ieee.std_logic_unsigned.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity binary_4_bit_up_counter_with_enable_and_count_terminate is
    Port ( RESET : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           E : in  STD_LOGIC;
           CT : out  STD_LOGIC;
           Q : out  STD_LOGIC_VECTOR (3 downto 0));
end binary_4_bit_up_counter_with_enable_and_count_terminate;

architecture Behavioral of binary_4_bit_up_counter_with_enable_and_count_terminate is
	Signal COUNT: STD_LOGIC_VECTOR (3 downto 0) := "0000";
begin

    Process (CLK, RESET, E, COUNT)
    Begin
		 if (RESET = '1') then 
			  COUNT <= "0000";	
		 elsif (CLK'EVENT AND CLK = '1') Then
			  if (E = '0') Then
					COUNT <= COUNT;
			  else
					COUNT <= COUNT + 1;
			  end if;
			  
	  
		 end if;
		
		 if (COUNT = "1111") Then
			  CT <= '1';
		 else
			  CT <= '0';
		 end if;		
	end process;

	Q <= COUNT;
end Behavioral;

