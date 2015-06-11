library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MIPS is
    Port (
		ULAop :in std_logic_vector(1 downto 0);
		funct :in std_logic_vector(5 downto 0);
		oper :out std_logic_vector(2 downto 0)
	 );
end MIPS;

architecture rtl of MIPS is
begin
    
end rtl;