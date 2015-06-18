library ieee;
use ieee.numeric_std.all;
use IEEE.STD_LOGIC_1164.ALL;

entity signalExtensor is
    Port (
		in16: in std_logic_vector(15 downto 0);
		out32: out std_logic_vector(31 downto 0)
	 );
end signalExtensor;

architecture rtl of signalExtensor is
begin
    out32 <= std_logic_vector(resize(signed(in16), out32'length));
end rtl;