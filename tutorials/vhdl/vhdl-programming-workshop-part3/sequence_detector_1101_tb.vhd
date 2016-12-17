--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:25:22 12/17/2016
-- Design Name:   
-- Module Name:   F:/git-duleekag/hobby/tutorials/vhdl/vhdl-programming-workshop-part3/sequence_detector_1101_tb.vhd
-- Project Name:  vhdl-programming-workshop-part3
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: sequence_detector_1101
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
 
ENTITY sequence_detector_1101_tb IS
END sequence_detector_1101_tb;
 
ARCHITECTURE behavior OF sequence_detector_1101_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT sequence_detector_1101
    PORT(
         CLK : IN  std_logic;
         X : IN  std_logic;
         CLEAR : IN  std_logic;
         S : OUT  std_logic_vector(1 downto 0);
         Z : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal X : std_logic := '0';
   signal CLEAR : std_logic := '0';

 	--Outputs
   signal S : std_logic_vector(1 downto 0);
   signal Z : std_logic;

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: sequence_detector_1101 PORT MAP (
          CLK => CLK,
          X => X,
          CLEAR => CLEAR,
          S => S,
          Z => Z
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      CLEAR <= '1';
      wait for CLK_period * 5;	
		CLEAR <= '0';
		
	   wait for CLK_period;
		X<='1';
		wait for CLK_period;
		X<='1';
		wait for CLK_period;
		X<='0';
		wait for CLK_period;
		X<='1';
		wait for CLK_period*5;

   end process;

END;
