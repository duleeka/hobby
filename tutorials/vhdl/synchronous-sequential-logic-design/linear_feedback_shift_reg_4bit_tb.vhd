--------------------------------------------------------------------------------
-- VHDL Test Bench Created by ISE for module: linear_feedback_shift_reg_4bit
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
 
ENTITY linear_feedback_shift_reg_4bit_tb IS
END linear_feedback_shift_reg_4bit_tb;
 
ARCHITECTURE behavior OF linear_feedback_shift_reg_4bit_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT linear_feedback_shift_reg_4bit
    PORT(
         CLOCK : IN  std_logic;
         LOAD : IN  std_logic;
         D : buffer  std_logic_vector(4 downto 1)
        );
    END COMPONENT;
    

   --Inputs
   signal CLOCK : std_logic := '0';
   signal LOAD : std_logic := '0';

 	--Outputs
   signal D : std_logic_vector(4 downto 1);

   -- Clock period definitions
   constant CLOCK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: linear_feedback_shift_reg_4bit PORT MAP (
          CLOCK => CLOCK,
          LOAD => LOAD,
          D => D
        );

   -- Clock process definitions
   CLOCK_process :process
   begin
		CLOCK <= '0';
		wait for CLOCK_period/2;
		CLOCK <= '1';
		wait for CLOCK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
		wait for CLOCK_period;
		
		LOAD <= '1';
		wait for CLOCK_period;
		LOAD <= '0';
      wait;
   end process;

END;
