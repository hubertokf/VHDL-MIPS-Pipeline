LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

ENTITY controller IS
	PORT (
		opcode : IN std_logic_vector(4 downto 0);
		ulaOp : out std_logic_vector(1 downto 0);
		RegDst, ulaFonte, escMem, lerMem, DvC, memParaReg, escReg: out std_logic
	);
END controller;

ARCHITECTURE rtl OF controller IS	 
BEGIN
	process
	begin
		CASE opcode IS
			WHEN "000000" => -- R type
				RegDst <= '1';
				ulaFonte <= '0';
				memParaReg <= '0';
				lerMem <= '0';
				escMem <= '0';
				escReg <= '1';
				DvC <= '0';
				ulaOp <= "10";
			WHEN "100011" => -- lw / I type
				RegDst <= '0';
				ulaFonte <= '1';
				memParaReg <= '1';
				lerMem <= '1';
				escMem <= '0';
				escReg <= '1';
				DvC <= '0';
				ulaOp <= "00";
			WHEN "101011" => -- sw / I type
				RegDst <= '-';
				ulaFonte <= '1';
				memParaReg <= '-';
				lerMem <= '0';
				escMem <= '1';
				escReg <= '0';
				DvC <= '0';
				ulaOp <= "00";
			WHEN "000100" => -- beq / I type
				RegDst <= '-';
				ulaFonte <= '0';
				memParaReg <= '-';
				lerMem <= '0';
				escMem <= '0';
				escReg <= '0';
				DvC <= '1';
				ulaOp <= "01";
			WHEN "001000" => -- addi / I type
				RegDst <= '0';
				ulaFonte <= '1';
				memParaReg <= '0';
				lerMem <= '0';
				escMem <= '0';
				escReg <= '1';
				DvC <= '0';
				ulaOp <= "00";
			WHEN "001101" => -- ori / I type
				RegDst <= '0';
				ulaFonte <= '1';
				memParaReg <= '0';
				lerMem <= '0';
				escMem <= '0';
				escReg <= '1';
				DvC <= '0';
				ulaOp <= "00";
			WHEN "000010" => -- j / J type
				RegDst <= '-';
				ulaFonte <= '-';
				memParaReg <= '-';
				lerMem <= '0';
				escMem <= '0';
				escReg <= '0';
				DvC <= '0';
				ulaOp <= "00";
			WHEN OTHERS => 
				RegDst <= '0';
				ulaFonte <= '0';
				memParaReg <= '0';
				lerMem <= '0';
				escMem <= '0';
				escReg <= '0';
				DvC <= '0';
				ulaOp <= "00";
		END CASE;
	end process;
		
END rtl;
