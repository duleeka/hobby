--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   08:08:07 11/19/2016
-- Design Name:   
-- Module Name:   comb_cct_1_tb.vhd
-- Project Name:  beginners-guide-to-vhdl
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: comb_cct_1
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
 
ENTITY comb_cct_1_tb IS
END comb_cct_1_tb;

-- This architecture verifies the behavior of an entity to adhere to behavior illustrated
-- in following truth table.
--     Inputs        Outputs
-- A      B      C      Z
-- 0      0      0      0
-- 0      0      1      0
-- 0      1      0      0
-- 0      1      1      1
-- 1      0      0      0
-- 1      0      1      1
-- 1      1      0      1
-- 1      1      1      1 
 
ARCHITECTURE behavior OF comb_cct_1_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT comb_cct_1
    PORT(
         A : IN  std_logic;
         B : IN  std_logic;
         C : IN  std_logic;
         Z : OUT  std_logic
        );
    END COMPONENT;

   --Inputs
   signal abc : std_logic_vector (2 downto 0);

 	--Outputs
   signal Z : std_logic;
 
	--Set the architecture name here to select the implementation to test.
	for uut: comb_cct_1 use entity work.comb_cct_1(circuit2);
		
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: comb_cct_1 PORT MAP (
          A => abc(2),
          B => abc(1),
          C => abc(0),
          Z => Z
        );

   -- Stimulus process
   stim_proc: process
   begin		
		abc <= "000";
		wait for 20ns;
		assert Z = '0' report "Error, expected Z = 0 for abc = '000'" severity error;

		abc <= "001";
		wait for 20ns;
		assert Z = '0' report "Error, expected Z = 0 for abc = '001'" severity error;

		abc <= "010";
		wait for 20ns;
		assert Z = '0' report "Error, expected Z = 0 for abc = '010'" severity error;

		abc <= "011";
		wait for 20ns;
		assert Z = '1' report "Error, expected Z = 0 for abc = '011'" severity error;

		abc <= "100";
		wait for 20ns;
		assert Z = '0' report "Error, expected Z = 0 for abc = '100'" severity error;

		abc <= "101";
		wait for 20ns;
		assert Z = '1' report "Error, expected Z = 0 for abc = '101'" severity error;

		abc <= "110";
		wait for 20ns;
		assert Z = '1' report "Error, expected Z = 0 for abc = '110'" severity error;

		abc <= "111";
		wait for 20ns;
		assert Z = '1' report "Error, expected Z = 0 for abc = '111'" severity error;
	
      wait;
   end process;

END;
