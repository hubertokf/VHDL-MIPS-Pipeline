library ieee;  
use ieee.std_logic_1164.all; 

entity memInst is 
	generic (wlength: integer := 32;
			 words  : integer :=10);
	Port(
		DataIn: IN std_logic_vector(wlength -1 downto 0);
		Addr_in: IN std_logic_vector(words -1 downto 0);
		Addr_out: IN std_logic_vector(words -1 downto );
		clock, WE: IN std_logic;
		DataOut: OUT std_logic_vector(wlength -1 downto 0));
end memInst;

 ARCHITECTURE rlt OF memInst is

 COMPONENT reg 
	 generic(DATA_WIDTH := INTEGER);
	 	port(
	 		clk, rst, en: std_logic;
	 		D: IN std_logic_vector(lenght -1 downto 0);
	 		Q: OUT std_logic_vector(lenght -1 downto 0));
 END COMPONENT;

 type memory_type is array (2**words -1 downto 0) of std_logic_vector(wlength -1 downto 0);
 signal memory: memory_type;
 signal sw:  std_logic := '0';
 signal Data: std_logic_vector(wlength -1 downto 0);

 	begin
		sw<='1';
		reg_In1: reg generic map(lenght => wlength)
				 Port Map( D=> DataIn,
				 		   clk => clock,
				 		   WE => sw,
				 		   Q => Data
				 		   );
	process (clock, Addr_out, WE)
	begin
		if clock'event and clock ='1' then
			if WE ='1' then
				memory(conv_integer(Addr_in(words -1 downto 0))) <= Data(wlenght -1 downto 0);
			end if;
		DataOut <= memory(conv_integer(Addr_out(words -1 downto 0))) after 1ns;
		end if;
	end process;
end rlt;