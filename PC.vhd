library ieee;  
use ieee.std_logic_1164.all;  
 
entity PC is
	generic(
		DATA_WIDTH : natural := 5
	);
	port(
		clk, rst: in std_logic;  
		D : in  std_logic_vector ((DATA_WIDTH-1) downto 0);  
		Q : out std_logic_vector ((DATA_WIDTH-1) downto 0)
	);  
end PC;

architecture rtl of PC is
	signal Temp: std_logic_vector((DATA_WIDTH-1) downto 0);
begin  
	process (clk, rst)
	begin  
		if (rst='1') then  
			Temp <= (others	=> '0');  
		elsif (clk'event and clk='0')then  -- ver a borda! 
			Temp <= D;
		end if;  
	end process;
	
	Q <= Temp;
end rtl;