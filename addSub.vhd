-- Quartus II VHDL Template
-- Signed Adder/Subtractor

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_signed.all;

entity addSub is
	generic(
		DATA_WIDTH : natural := 8
	);

	port(
		a		: in std_logic_vector ((DATA_WIDTH-1) downto 0);
		b		: in std_logic_vector ((DATA_WIDTH-1) downto 0);
		add_sub : in std_logic;
		result	: out std_logic_vector ((DATA_WIDTH-1) downto 0)
	);
end entity;

architecture rtl of addSub is
begin

	process(a,b,add_sub)
	begin
		-- Add if "add_sub" is 1, else subtract
		if (add_sub = '1') then
			result <= a + b;
		else
			result <= a - b;
		end if;
	end process;

end rtl;
