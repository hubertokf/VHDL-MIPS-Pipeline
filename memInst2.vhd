library ieee;  
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity memInst2 is 
	generic (
		wlength: integer := 32;
		words  : integer := 10
	);
	Port(
		data: IN std_logic_vector(wlength-1 downto 0);
		address: IN std_logic_vector(words-1 downto 0);
		clock, wren: IN std_logic;
		q: OUT std_logic_vector(wlength-1 downto 0)
	);
end memInst2;

 ARCHITECTURE rlt OF memInst2 is 
	type memory_type is array (2**words-1 downto 0) of std_logic_vector(wlength -1 downto 0);	
	signal memory: memory_type;
	
begin
	gen_init_mem: for i in 11 to 1023 generate
      memory(i) <= "00000000000000000000000000000000";
   end generate gen_init_mem;

	memory(0) <= "00100000000000100000000000000011";
	memory(1) <= "00100000000000110000000000000100";
	memory(2) <= "00100000000001000000000000000101";
	memory(3) <= "00100000011000110000000000000100";
	memory(4) <= "00100000000001100000000000000111";
	memory(5) <= "10101100000000100000000000000100";
	memory(6) <= "10001100000001110000000000000100";
	
	memory(7) <= "00000000000001111000100000100000";
	memory(8) <= "00000000000001111001000000100000";
	memory(9) <= "00000000000001111001100000100000";
	memory(10) <= "00010000000000000000000000000010";
	
	process (clock, memory, address, wren)
	begin
--		if clock'event and clock ='1' then
--			if wren = '1' then
--				memory(to_integer(unsigned(address))) <= data;
--			end if;
--		end if;
		
		q <= memory(to_integer(unsigned(address))) after 1ns;
	end process;
	
end rlt;