--------------------------------------------------------------------------------
-- 
-- VHDL Test Bench Created by ISE for module: bcd_to_sevenseg
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

ENTITY bcd_to_sevenseg_tb IS
END bcd_to_sevenseg_tb;
 
ARCHITECTURE behavior OF bcd_to_sevenseg_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT bcd_to_sevenseg
    PORT(
         I : IN  std_logic_vector(3 downto 0);
         Segs : OUT  std_logic_vector(1 to 7)
        );
    END COMPONENT;
    

   --Inputs
   signal I : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal Segs : std_logic_vector(1 to 7);

   constant clk_period : time := 10 ns;
 
 	--Set the architecture name here to select the implementation to test.
	for uut: bcd_to_sevenseg use entity work.bcd_to_sevenseg(Structural);
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: bcd_to_sevenseg PORT MAP (
          I => I,
          Segs => Segs
        );

  
 

   -- Stimulus process
   stim_proc: process
   begin		
		I <= "0000";
		wait for clk_period;
		assert Segs = "1111110" report "Error at 0000";

		I <= "0001";
		wait for clk_period;
		assert Segs = "0110000" report "Error at 0001";
		
		I <= "0010";
		wait for clk_period;
		assert Segs = "1101101" report "Error at 0010";

		I <= "0011";
		wait for clk_period;
		assert Segs = "1111001" report "Error at 0011";

		I <= "0100";
		wait for clk_period;
		assert Segs = "0110011" report "Error at 0100";

		I <= "0101";
		wait for clk_period;
		assert Segs = "1011011" report "Error at 0101";

		I <= "0110";
		wait for clk_period;
		assert Segs = "1011111" report "Error at 0110";

		I <= "0111";
		wait for clk_period;
		assert Segs = "1110000" report "Error at 0111";

		I <= "1000";
		wait for clk_period;
		assert Segs = "1111111" report "Error at 1000";		
		
		I <= "1001";
		wait for clk_period;
		assert Segs = "1110011" report "Error at 1000";		

--		I <= "1010";
--		wait for clk_period;
--		assert Segs = "0000000" report "Error at 1010";	
		
      wait;
   end process;

END;
