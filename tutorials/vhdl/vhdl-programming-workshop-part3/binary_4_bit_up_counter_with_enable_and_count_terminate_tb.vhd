--------------------------------------------------------------------------------

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
 
ENTITY binary_4_bit_up_counter_with_enable_and_count_terminate_tb IS
END binary_4_bit_up_counter_with_enable_and_count_terminate_tb;
 
ARCHITECTURE behavior OF binary_4_bit_up_counter_with_enable_and_count_terminate_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT binary_4_bit_up_counter_with_enable_and_count_terminate
    PORT(
         RESET : IN  std_logic;
         CLK : IN  std_logic;
         E : IN  std_logic;
         CT : OUT  std_logic;
         Q : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal RESET : std_logic := '0';
   signal CLK : std_logic := '0';
   signal E : std_logic := '0';

 	--Outputs
   signal CT : std_logic;
   signal Q : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: binary_4_bit_up_counter_with_enable_and_count_terminate PORT MAP (
          RESET => RESET,
          CLK => CLK,
          E => E,
          CT => CT,
          Q => Q
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
      RESET <= '1';
      wait for CLK_period * 2;	
		RESET <= '0';

		E <= '1';
		wait for CLK_period*50;
		E <= '0';
		wait for CLK_period*2;
		E <= '1';
		wait for CLK_period*40;
      wait;
   end process;

END;
