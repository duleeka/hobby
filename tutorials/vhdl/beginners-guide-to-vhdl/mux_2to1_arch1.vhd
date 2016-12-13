----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:59:29 11/19/2016 
-- Design Name: 
-- Module Name:    mux_2to1 - Behavioral 
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

entity mux_2to1 is
	Port (A : in  std_logic;
	      B : in  std_logic;
			S : in  std_logic;
			F : out std_logic);
end mux_2to1;

architecture circuit1 of mux_2to1 is
begin

	process (A, B, S)
	begin
		if (S = '0') then
			F <= A;
		else
			F <= B;
		end if;
	end process;
end circuit1;


