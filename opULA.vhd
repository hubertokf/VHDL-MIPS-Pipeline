LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

ENTITY opULA IS
	PORT (
		ULAop :in std_logic_vector(1 downto 0);
		funct :in std_logic_vector(5 downto 0);
		oper :out std_logic_vector(3 downto 0)
	);
END opULA;

ARCHITECTURE rtl OF opULA IS	 
BEGIN
	process(ULAop,funct)
	begin
		CASE ULAop IS
			WHEN "00" => 
				oper <= "0010";
			WHEN "01" => 
				oper <= "0110";
			WHEN "10" => 
				CASE funct IS
					WHEN "100000" => --add
						oper <= "0010";
					WHEN "100001" => --addu  VERIFICAR OPERAÇÃO *
						oper <= "0010";
					WHEN "100100" => --and
						oper <= "0000";
					WHEN "011010" => --div VERIFICAR OPERAÇÃO *
						oper <= "0100";
					WHEN "011011" => --divu VERIFICAR OPERAÇÃO *
						oper <= "0100";
					WHEN "001000" => --jr VERIFICAR OPERAÇÃO
						oper <= "0000";
					WHEN "010000" => --mfhi VERIFICAR OPERAÇÃO
						oper <= "0000";
					WHEN "010010" => --mfho VERIFICAR OPERAÇÃO
						oper <= "0000";
					WHEN "011000" => --mult VERIFICAR OPERAÇÃO *
						oper <= "0011";
					WHEN "011001" => --multu VERIFICAR OPERAÇÃO *
						oper <= "0011";
					WHEN "100111" => --nor VERIFICAR OPERAÇÃO *
						oper <= "0101";
					WHEN "100101" => --or VERIFICAR OPERAÇÃO *
						oper <= "0001";
					WHEN "000000" => --sll VERIFICAR OPERAÇÃO **
						oper <= "1001";
					WHEN "101010" => --slt VERIFICAR OPERAÇÃO
						oper <= "1010";
					WHEN "101011" => --sltu VERIFICAR OPERAÇÃO
						oper <= "0000";
					WHEN "000011" => --sra VERIFICAR OPERAÇÃO
						oper <= "0000";
					WHEN "000010" => --srl VERIFICAR OPERAÇÃO
						oper <= "0000";
					WHEN "100010" => --sub
						oper <= "0110";
					WHEN "100011" => --subu VERIFICAR OPERAÇÃO *
						oper <= "0110";
					WHEN "100110" => --xor VERIFICAR OPERAÇÃO *
						oper <= "1000";
					WHEN OTHERS => 
						oper <= "0010";
				END CASE;
			WHEN OTHERS => 
				oper <= "0010";
		END CASE;
   end process;
END rtl;
