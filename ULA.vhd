Library IEEE;
Use ieee.std_logic_1164.all;
Use ieee.std_logic_unsigned.all;
Use ieee.std_logic_arith.all;
Use ieee.numeric_std.all;

Entity ULA is
port (
	in0, in1: in std_logic_vector(31 downto 0);
	oper: in std_logic_vector(3 downto 0);
	zero, over: out std_logic;
	output : out std_logic_vector(31 downto 0)
);
end ULA;

architecture rtl of ULA is
	signal sig_output: std_logic_vector(31 downto 0);
begin
	process(oper, in0, in1)
	begin
		case oper is
			when "0000" =>
				sig_output <= in0 and in1;
			when "0001" =>
				sig_output <= in0 or in1;
			when "0010" =>
				sig_output <= in0 + in1;
			--when "0011" =>
				--sig_output <= in0 * in1;
			--when "0100" =>
				--sig_output <= in0 / in1;
			when "0101" =>
				sig_output <= in0 nor in1;
			when "0110" =>
				sig_output <= in0 - in1;
			when "0111" => -- verificar
				sig_output <= (0 => '1', others => '0');
			when "1000" =>
				sig_output <= in0 xor in1;
			--when "1001" =>
				--sig_output <= in0 sll in1;
			WHEN OTHERS =>
				sig_output <= in0;
		end case;
	end process;
	
	zero <= '1' when sig_output = "00000000000000000000000000000000"
		else '0';
	
	output <= sig_output;
end rtl;	 