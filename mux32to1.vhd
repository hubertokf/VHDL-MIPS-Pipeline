Library IEEE;
Use ieee.std_logic_1164.all;
use work.array32.all; 
 
Entity mux32to1 is
port (
	input: reg_array;
	sel: in std_logic_vector(4 downto 0);
	output : out std_logic_vector(31 downto 0)
);
end mux32to1;

architecture rtl of mux32to1 is
begin
	with sel select
		output <=	
			input(0) when "00000",
			input(1) when "00001",
			input(2) when "00010",
			input(3) when "00011",
			input(4) when "00100",
			input(5) when "00101",
			input(6) when "00110",
			input(7) when "00111",
			input(8) when "01000",
			input(9) when "01001",
			input(10) when "01010",
			input(11) when "01011",
			input(12) when "01100",
			input(13) when "01101",
			input(14) when "01110",
			input(15) when "01111",
			input(16) when "10000",
			input(17) when "10001",
			input(18) when "10010",
			input(19) when "10011",
			input(20) when "10100",
			input(21) when "10101",
			input(22) when "10110",
			input(23) when "10111",
			input(24) when "11000",
			input(25) when "11001",
			input(26) when "11010",
			input(27) when "11011",
			input(28) when "11100",
			input(29) when "11101",
			input(30) when "11110",
			input(31) when "11111",
			"00000000000000000000000000000000" when others;
		
end rtl;	 