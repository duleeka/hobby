--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:46:46 01/17/2017
-- Design Name:   
-- Module Name:   ./gray-code-3bit-with-enable/gray_counter_tb.vhd
-- Project Name:  gray-code-counter-3bit
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: gray_counter
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
 
ENTITY gray_counter_tb IS
END gray_counter_tb;
 
ARCHITECTURE behavior OF gray_counter_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT gray_counter
    PORT(
         RESET : IN  std_logic;
         CLK : IN  std_logic;
         CE : IN  std_logic;
         Q : OUT  std_logic_vector(2 downto 0);
         CT : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal RESET : std_logic := '0';
   signal CLK : std_logic := '0';
   signal CE : std_logic := '0';

 	--Outputs
   signal Q : std_logic_vector(2 downto 0);
   signal CT : std_logic;

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 	for uut: gray_counter use entity work.gray_counter(DataFlow);
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: gray_counter PORT MAP (
          RESET => RESET,
          CLK => CLK,
          CE => CE,
          Q => Q,
          CT => CT
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
      -- hold reset state for 100 ns.
		RESET <= '0';
      wait for CLK_period * 5;	
		assert Q = "001" and CT = '0' report "Invalid reset state" severity error;
		
		RESET <= '1';		
		CE <= '0';
		wait for CLK_period;
		assert Q = "001" and CT = '0' report "Counter increments while CE is not set" severity error;

		wait for CLK_period;
		assert Q = "001" and CT = '0' report "Counter increments while CE is not set" severity error;

		CE <= '1';
		wait for CLK_period;
		assert Q = "011" and CT = '0' report "Invalid counter output" severity error;

		wait for CLK_period;
		assert Q = "010" and CT = '0' report "Invalid counter output" severity error;

		wait for CLK_period;
		assert Q = "110" and CT = '0' report "Invalid counter output" severity error;

		wait for CLK_period;
		assert Q = "111" and CT = '0' report "Invalid counter output" severity error;

		wait for CLK_period;
		assert Q = "101" and CT = '0' report "Invalid counter output" severity error;

		wait for CLK_period;
		assert Q = "100" and CT = '1' report "Invalid counter output" severity error;

		wait for CLK_period;
		assert Q = "000" and CT = '0' report "Invalid counter output" severity error;

		wait for CLK_period;
		assert Q = "001" and CT = '0' report "Invalid counter output" severity error;

		wait for CLK_period;
		assert Q = "011" and CT = '0' report "Invalid counter output" severity error;
		
		-- When CE is '0', the counter should hold current value.
		CE <= '0';
		wait for CLK_period;
		assert Q = "011" and CT = '0' report "Invalid counter output" severity error;

		wait for CLK_period;
		assert Q = "011" and CT = '0' report "Invalid counter output" severity error;

		wait for CLK_period;
		assert Q = "011" and CT = '0' report "Invalid counter output" severity error;
		
		-- When CE is '1', the counter should resume counting.
		CE <= '1';
		wait for CLK_period;
		assert Q = "010" and CT = '0' report "Invalid counter output" severity error;

		wait for CLK_period;
		assert Q = "110" and CT = '0' report "Invalid counter output" severity error;

		wait for CLK_period;
		assert Q = "111" and CT = '0' report "Invalid counter output" severity error;

		-- Asserting reset should change counter value to "001"
		RESET <= '0';
		wait for CLK_period / 100;
		assert Q = "001" and CT = '0' report "Counter not at reset value" severity error;

		wait for CLK_period;
		assert Q = "001" and CT = '0' report "Counter not at reset value" severity error;

		wait for CLK_period;
		assert Q = "001" and CT = '0' report "Counter not at reset value" severity error;

		-- Resume counting.
		RESET <= '1';
		CE <= '1';
		wait for CLK_period;
		assert Q = "011" and CT = '0' report "Invalid counter output" severity error;

		wait for CLK_period;
		assert Q = "010" and CT = '0' report "Invalid counter output" severity error;

		wait for CLK_period;
		assert Q = "110" and CT = '0' report "Invalid counter output" severity error;

		wait for CLK_period;
		assert Q = "111" and CT = '0' report "Invalid counter output" severity error;

		
      wait;
   end process;

END;
