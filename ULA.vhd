Library IEEE;
Use ieee.std_logic_1164.all;
Use ieee.std_logic_unsigned.all;
Use ieee.std_logic_arith.all;

Entity ULA is
port (
	in0, in1: in std_logic_vector(31 downto 0);
	oper: in std_logic_vector(3 downto 0);
	zero, over: out std_logic;
	output : out std_logic_vector(31 downto 0)
);
end ULA;

architecture rtl of ULA is
begin
	with oper select
		output <=
			(in0 and in1) 	when "0000",
			(in0 or in1) 	when "0001",
			(in0 + in1)		when "0010",
			(in0 * in1) 	when "0011",
			(in0 / in1) 	when "0100",
			(in0 nor in1)	when "0101",
			(in0-in1) 		when "0110",
			(in0 <= '1') 	when "0111",
			(in0 xor in1)	when "1000",
								when "1001",
								when "1010",
								when "1011",
								when "1100",
								when "1101",
								when "1110",
								when "1111",
			in0 				when others;
			
end rtl;	 