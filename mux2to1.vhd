library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux2to1 is
	generic(
		DATA_WIDTH : natural := 32
	);
	Port (
		SEL : in  STD_LOGIC;
		A, B   : in  STD_LOGIC_VECTOR((DATA_WIDTH-1) downto 0);
		X   : out STD_LOGIC_VECTOR((DATA_WIDTH-1) downto 0)
	);
end mux2to1;

architecture behavioral of mux2to1 is
begin
    X <= A when (SEL = '0') else B;
end behavioral;