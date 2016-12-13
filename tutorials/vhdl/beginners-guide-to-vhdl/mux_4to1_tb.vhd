--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   09:55:39 11/19/2016
-- Design Name:   
-- Module Name:   E:/Google Drive/my-projects/ESOFT/Digital System Applications/2016/xilinx/beginners-guide-to-vhdl/mux_4to1_tb.vhd
-- Project Name:  beginners-guide-to-vhdl
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: mux_4to1_arch1
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
 
ENTITY mux_4to1_tb IS
END mux_4to1_tb;
 
ARCHITECTURE behavior OF mux_4to1_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mux_4to1_arch1
    PORT(
         A : IN  std_logic;
         B : IN  std_logic;
         C : IN  std_logic;
         D : IN  std_logic;
         SEL : IN  std_logic_vector(1 downto 0);
         Z : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic := '0';
   signal B : std_logic := '0';
   signal C : std_logic := '0';
   signal D : std_logic := '0';
   signal SEL : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal Z : std_logic;

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mux_4to1_arch1 PORT MAP (
          A => A,
          B => B,
          C => C,
          D => D,
          SEL => SEL,
          Z => Z
        );

   -- Stimulus process
   stim_proc: process
   begin	
        A <= '0';
        B <= '0';
        C <= '0';
        D <= '0';
		  SEL <= "00";
		  wait for 20ns;
		  assert Z = A;
		  
        A <= '1';
        B <= '0';
        C <= '0';
        D <= '0';
		  SEL <= "00";
		  wait for 20ns;
		  assert Z = A;

        A <= '0';
        B <= '0';
        C <= '0';
        D <= '0';
		  SEL <= "01";
		  wait for 20ns;
		  assert Z = B;

        A <= '0';
        B <= '1';
        C <= '0';
        D <= '0';
		  SEL <= "01";
		  wait for 20ns;
		  assert Z = B;
		  		 
        A <= '0';
        B <= '0';
        C <= '0';
        D <= '0';
		  SEL <= "10";
		  wait for 20ns;
		  assert Z = C;
		  		 
        A <= '0';
        B <= '0';
        C <= '1';
        D <= '0';
		  SEL <= "10";
		  wait for 20ns;
		  assert Z = C;
		  		
        A <= '0';
        B <= '0';
        C <= '0';
        D <= '0';
		  SEL <= "11";
		  wait for 20ns;
		  assert Z = D;
		  	
        A <= '0';
        B <= '0';
        C <= '0';
        D <= '1';
		  SEL <= "11";
		  wait for 20ns;
		  assert Z = D;		  
     wait;
   end process;

END;
