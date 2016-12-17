--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:25:12 12/17/2016
-- Design Name:   
-- Module Name:   F:/git-duleekag/hobby/tutorials/vhdl/vhdl-programming-workshop-part3/mux4to1_tb.vhd
-- Project Name:  vhdl-programming-workshop-part3
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: mux4to1
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
 
ENTITY mux4to1_tb IS
END mux4to1_tb;
 
ARCHITECTURE behavior OF mux4to1_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mux4to1
    PORT(
         X : IN  std_logic_vector(3 downto 0);
         C : IN  std_logic_vector(1 downto 0);
         Y : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal X : std_logic_vector(3 downto 0) := (others => '0');
   signal C : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal Y : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant wait_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mux4to1 PORT MAP (
          X => X,
          C => C,
          Y => Y
        );


   -- Stimulus process
   stim_proc: process
   begin		
		X(0) <= NOT X(0) after wait_period;
		X(1) <= NOT X(1) after wait_period * 2;
		X(2) <= NOT X(2) after wait_period * 4;
		X(3) <= NOT X(3) after wait_period * 8;
		C(0) <= NOT C(0) after wait_period * 2;
		C(1) <= NOT C(1) after wait_period * 4;
		wait for wait_period;
   end process;

END;
