LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

ENTITY opULA IS
	PORT (
		ULAop :in std_logic_vector(1 downto 0);
		funct :in std_logic_vector(5 downto 0);
		oper :out std_logic_vector(2 downto 0)
	);
END opULA;

ARCHITECTURE rtl OF opULA IS	 
BEGIN
	process
	begin
		CASE ULAop IS
			WHEN "00" => 
				oper <= "010";
			WHEN "01" => 
				oper <= "110";
			WHEN "10" => 
				CASE ULAop IS
					WHEN "100000" => --add
						oper <= "010";
					WHEN "100010" => --sub
						oper <= "110";
					WHEN "100100" => --and
						oper <= "000";
					WHEN "100101" => --or
						oper <= "001";
					WHEN "101010" => --slt
						oper <= "111";
					WHEN OTHERS => 
						oper <= "010";
				END CASE;
			WHEN OTHERS => 
				oper <= "010";
		END CASE;
   end process;
END rtl;
