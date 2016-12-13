--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:27:06 11/19/2016
-- Design Name:   
-- Module Name:   E:/Google Drive/my-projects/ESOFT/Digital System Applications/2016/xilinx/beginners-guide-to-vhdl/shifter_8bit_tb.vhd
-- Project Name:  beginners-guide-to-vhdl
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: tri_state_buffer_arch1
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY shifter_8bit_tb IS
END shifter_8bit_tb;
 
ARCHITECTURE behavior OF shifter_8bit_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT shifter_8bit
		Port (A : in  std_logic_vector (7 downto 0);
				C : in  std_logic_vector (1 downto 0);
				Y : out std_logic_vector (7 downto 0));
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector (7 downto 0);
   signal C : std_logic_vector (1 downto 0);
   signal Y : std_logic_vector (7 downto 0);

BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: shifter_8bit PORT MAP (
          A => A,
          C => C,
          Y => Y
        );
		  
   -- Stimulus process
   stim_proc: process
   begin		
		A <= "00110011";
		
		C <= "00";
		wait for 20ns;
		assert Y = A;
		
		C <= "01";
		wait for 20ns;
		assert Y = "01100110";
		
		C <= "10";
		wait for 20ns;
		assert Y = "00011001";
		
		C <= "11";
		wait for 20ns;
		assert Y = "10011001";
				
      wait;
   end process;

END;
