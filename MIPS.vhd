library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MIPS is
    Port (
		clk, rst, en : in std_logic;  
		D : in  std_logic_vector ((32) downto 0);  
		Q : out std_logic_vector ((32) downto 0)
	 );
end MIPS;

architecture rtl of MIPS is
begin
    
end rtl;