--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:44:48 01/07/2017
-- Design Name:   
-- Module Name:   F:/git-duleekag/hobby/tutorials/vhdl/workshop-for-case-study/top_module_tb.vhd
-- Project Name:  workshop-for-case-study
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: top_module
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
 
ENTITY top_module_tb IS
END top_module_tb;
 
ARCHITECTURE behavior OF top_module_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT top_module
    PORT(
         MCLK : IN  std_logic;
         Clear : IN  std_logic;
         CLK200Hz : OUT  std_logic;
         Digit_Select : OUT  std_logic_vector(3 downto 0);
         SSD : OUT  std_logic_vector(6 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal MCLK : std_logic := '0';
   signal Clear : std_logic := '0';

 	--Outputs
   signal CLK200Hz : std_logic;
   signal Digit_Select : std_logic_vector(3 downto 0);
   signal SSD : std_logic_vector(6 downto 0);

   -- Clock period definitions
   constant MCLK_period : time := 20 ns;  
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: top_module PORT MAP (
          MCLK => MCLK,
          Clear => Clear,
          CLK200Hz => CLK200Hz,
          Digit_Select => Digit_Select,
          SSD => SSD
        );

   -- Clock process definitions
   MCLK_process :process
   begin
		MCLK <= '0';
		wait for MCLK_period/2;
		MCLK <= '1';
		wait for MCLK_period/2;
   end process;
 
   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		Clear <= '1';
      wait for 100 ns;	
		Clear <= '0';
      wait;
   end process;

END;
