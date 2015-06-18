Library IEEE;
Use ieee.std_logic_1164.all;
Use ieee.std_logic_unsigned.all;
Use ieee.std_logic_arith.all;
Use work.array32.all; 

Entity regBank is
port (
	A1, A2, A3: in std_logic_vector(4 downto 0);
	clk, rst, we3: in std_logic;
	wd3: in std_logic_vector(31 downto 0);
	out1, out2 : out std_logic_vector(31 downto 0)
);
end regBank;

architecture rtl of regBank is
	signal OregImux: reg_array;
	signal Odec, Ien: std_logic_vector(31 downto 0);
	
	COMPONENT reg
		generic(
			DATA_WIDTH : natural := 8
		);
		port(
			clk, rst, en : in std_logic;  
			D : in  std_logic_vector ((DATA_WIDTH-1) downto 0);  
			Q : out std_logic_vector ((DATA_WIDTH-1) downto 0)
		); 
	END COMPONENT ;
	
	COMPONENT mux32to1
		port(
			input: reg_array;
			sel: in std_logic_vector(4 downto 0);
			output : out std_logic_vector(31 downto 0)
		);
	END COMPONENT ;
	
	COMPONENT dec5to1
		port(
			input: in std_logic_vector(4 downto 0);
			output : out std_logic_vector(31 downto 0)
		);
	END COMPONENT ;
	
begin
	G1: FOR i IN 0 TO 31 GENERATE
		Ien(i) <= Odec(i) and we3;
	end generate;
	
	G2: FOR i IN 0 TO 31 GENERATE
		regb: reg GENERIC MAP (DATA_WIDTH => 32) PORT MAP (
			clk => clk,
			rst => rst,
			en => Ien(i),
			D => wd3,
			Q => OregImux(i)
		);
	end generate;
	
	outData1: mux32to1 PORT MAP (
		input => OregImux,
		sel => A1,
		output => out1
	);
	
	outData2: mux32to1 PORT MAP (
		input => OregImux,
		sel => A2,
		output => out2
	);
	
	decWrite: dec5to1 PORT MAP (
		input => A3,
		output => Odec
	);

end rtl;	 