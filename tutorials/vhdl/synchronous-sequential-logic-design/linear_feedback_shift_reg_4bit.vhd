library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity linear_feedback_shift_reg_4bit is
    Port ( CLOCK : in  STD_LOGIC;
           LOAD : in  STD_LOGIC;
           D : buffer  STD_LOGIC_VECTOR (4 downto 1));
end linear_feedback_shift_reg_4bit;

architecture Behavioral of linear_feedback_shift_reg_4bit is
	constant seed: std_logic_vector (4 downto 1):= "1111";  -- Set the initial value here.
begin
	process (CLOCK, LOAD)
		variable feedback: std_logic;
	begin
		if (LOAD = '1') then
			D <= seed;
		elsif (CLOCK'event and CLOCK = '1') then
			feedback := D(2) xor D(1);                        -- Set the feedback logic here.
			D <= D(3 downto 1) & feedback;		
		end if;
	end process;
end Behavioral;
