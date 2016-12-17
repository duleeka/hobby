library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


architecture Behavioral of bcd_to_sevenseg  is

begin
	process(I)
	begin
		case I is	
			when "0000" => Segs <= "1111110";
			when "0001" => Segs <= "0110000";
			when "0010" => Segs <= "1101101";
			when "0011" => Segs <= "1111001";
			when "0100" => Segs <= "0110011";
			when "0101" => Segs <= "1011011";
			when "0110" => Segs <= "1011111";
			when "0111" => Segs <= "1110000";
			when "1000" => Segs <= "1111111";
			when "1001" => Segs <= "1110011";
			when others => Segs <= "0000000";
		end case;
	end process;

end Behavioral;

