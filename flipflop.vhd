library ieee;  
use ieee.std_logic_1164.all;  
 
entity flipflop is
	generic(
		DATA_WIDTH : natural := 32
	);
	port(
		clk, rst : in std_logic;  
		D : in  std_logic_vector ((DATA_WIDTH-1) downto 0);  
		Q : out std_logic_vector ((DATA_WIDTH-1) downto 0)
	);  
end flipflop;

architecture rtl of flipflop is
	signal Temp: std_logic_vector((DATA_WIDTH-1) downto 0);
begin  
	process (clk, rst)
	begin  
		if (rst='1') then  
			Temp <= (others	=> '0');  
		elsif (rising_edge(clk))then  
			Temp <= D; 
		end if;  
	end process;
	
	Q <= Temp;
end rtl;

