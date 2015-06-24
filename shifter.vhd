library ieee;  
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
 
entity shifter is
	port(
		in_vec : in  std_logic_vector (31 downto 0);
		number : in std_logic_vector(4 downto 0);
		dir : in std_logic;
		out_vec : out std_logic_vector (31 downto 0)
	);  
end shifter;

architecture rtl of shifter is
begin
	process (in_vec, number, dir)
	begin	
		case number is
			when "00001" =>
				if dir = '1' then
					out_vec <= in_vec(30 downto 0) & '0';
				else
					out_vec <= '1' & in_vec(31 downto 1);
				end if;
			when "00010" =>
				if dir = '1' then
					out_vec <= in_vec(29 downto 0) & "00";
				else
					out_vec <= "11" & in_vec(31 downto 2);
				end if;
			when "00011" =>
				if dir = '1' then
					out_vec <= in_vec(28 downto 0) & "000";
				else
					out_vec <= "111" & in_vec(31 downto 3);
				end if;
			when "00100" =>
				if dir = '1' then
					out_vec <= in_vec(27 downto 0) & "0000";
				else
					out_vec <= "1111" & in_vec(31 downto 4);
				end if;
			when "00101" =>
				if dir = '1' then
					out_vec <= in_vec(26 downto 0) & "00000";
				else
					out_vec <= "11111" & in_vec(31 downto 5);
				end if;
			when "00110" =>
				if dir = '1' then
					out_vec <= in_vec(25 downto 0) & "000000";
				else
					out_vec <= "111111" & in_vec(31 downto 6);
				end if;
			when "00111" =>
				if dir = '1' then
					out_vec <= in_vec(24 downto 0) & "0000000";
				else
					out_vec <= "1111111" & in_vec(31 downto 7);
				end if;
			when "01000" =>
				if dir = '1' then
					out_vec <= in_vec(23 downto 0) & "00000000";
				else
					out_vec <= "11111111" & in_vec(31 downto 8);
				end if;
			when "01001" =>
				if dir = '1' then
					out_vec <= in_vec(22 downto 0) & "000000000";
				else
					out_vec <= "111111111" & in_vec(31 downto 9);
				end if;
			when "01010" =>
				if dir = '1' then
					out_vec <= in_vec(21 downto 0) & "0000000000";
				else
					out_vec <= "1111111111" & in_vec(31 downto 10);
				end if;
			when "01011" =>
				if dir = '1' then
					out_vec <= in_vec(20 downto 0) & "00000000000";
				else
					out_vec <= "11111111111" & in_vec(31 downto 11);
				end if;
			when "01100" =>
				if dir = '1' then
					out_vec <= in_vec(19 downto 0) & "000000000000";
				else
					out_vec <= "111111111111" & in_vec(31 downto 12);
				end if;
			when "01101" =>
				if dir = '1' then
					out_vec <= in_vec(18 downto 0) & "0000000000000";
				else
					out_vec <= "1111111111111" & in_vec(31 downto 13);
				end if;
			when "01110" =>
				if dir = '1' then
					out_vec <= in_vec(17 downto 0) & "00000000000000";
				else
					out_vec <= "11111111111111" & in_vec(31 downto 14);
				end if;
			when "01111" =>
				if dir = '1' then
					out_vec <= in_vec(16 downto 0) & "000000000000000";
				else
					out_vec <= "111111111111111" & in_vec(31 downto 15);
				end if;
			when "10000" =>
				if dir = '1' then
					out_vec <= in_vec(15 downto 0) & "0000000000000000";
				else
					out_vec <= "1111111111111111" & in_vec(31 downto 16);
				end if;
			when "10001" =>
				if dir = '1' then
					out_vec <= in_vec(14 downto 0) & "00000000000000000";
				else
					out_vec <= "11111111111111111" & in_vec(31 downto 17);
				end if;
			when "10010" =>
				if dir = '1' then
					out_vec <= in_vec(13 downto 0) & "000000000000000000";
				else
					out_vec <= "111111111111111111" & in_vec(31 downto 18);
				end if;
			when "10011" =>
				if dir = '1' then
					out_vec <= in_vec(12 downto 0) & "0000000000000000000";
				else
					out_vec <= "1111111111111111111" & in_vec(31 downto 19);
				end if;
			when "10100" =>
				if dir = '1' then
					out_vec <= in_vec(11 downto 0) & "00000000000000000000";
				else
					out_vec <= "11111111111111111111" & in_vec(31 downto 20);
				end if;
			when "10101" =>
				if dir = '1' then
					out_vec <= in_vec(10 downto 0) & "000000000000000000000";
				else
					out_vec <= "111111111111111111111" & in_vec(31 downto 21);
				end if;
			when "10110" =>
				if dir = '1' then
					out_vec <= in_vec(9 downto 0) & "0000000000000000000000";
				else
					out_vec <= "1111111111111111111111" & in_vec(31 downto 22);
				end if;
			when "10111" =>
				if dir = '1' then
					out_vec <= in_vec(8 downto 0) & "00000000000000000000000";
				else
					out_vec <= "11111111111111111111111" & in_vec(31 downto 23);
				end if;
			when "11000" =>
				if dir = '1' then
					out_vec <= in_vec(7 downto 0) & "000000000000000000000000";
				else
					out_vec <= "111111111111111111111111" & in_vec(31 downto 24);
				end if;
			when "11001" =>
				if dir = '1' then
					out_vec <= in_vec(6 downto 0) & "0000000000000000000000000";
				else
					out_vec <= "1111111111111111111111111" & in_vec(31 downto 25);
				end if;
			when "11010" =>
				if dir = '1' then
					out_vec <= in_vec(5 downto 0) & "00000000000000000000000000";
				else
					out_vec <= "11111111111111111111111111" & in_vec(31 downto 26);
				end if;
			when "11011" =>
				if dir = '1' then
					out_vec <= in_vec(4 downto 0) & "000000000000000000000000000";
				else
					out_vec <= "111111111111111111111111111" & in_vec(31 downto 27);
				end if;
			when "11100" =>
				if dir = '1' then
					out_vec <= in_vec(3 downto 0) & "0000000000000000000000000000";
				else
					out_vec <= "1111111111111111111111111111" & in_vec(31 downto 28);
				end if;
			when "11101" =>
				if dir = '1' then
					out_vec <= in_vec(2 downto 0) & "00000000000000000000000000000";
				else
					out_vec <= "11111111111111111111111111111" & in_vec(31 downto 29);
				end if;
			when "11110" =>
				if dir = '1' then
					out_vec <= in_vec(1 downto 0) & "000000000000000000000000000000";
				else
					out_vec <= "111111111111111111111111111111" & in_vec(31 downto 30);
				end if;
			when "11111" =>
				if dir = '1' then
					out_vec <= in_vec(0 downto 0) & "0000000000000000000000000000000";
				else
					out_vec <= "1111111111111111111111111111111" & in_vec(31 downto 31);
				end if;
			when others =>
				if dir = '1' then
					out_vec <= in_vec(0 downto 0) & "0000000000000000000000000000000";
				else
					out_vec <= "1111111111111111111111111111111" & in_vec(31 downto 31);
				end if;		
		end case;
		
	end process;
	
end rtl;