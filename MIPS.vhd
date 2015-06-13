library ieee;
use ieee.numeric_std.all;
use IEEE.STD_LOGIC_1164.ALL;

entity MIPS is
    Port (
		clk, rst: in std_logic;
		outf: out std_logic_vector(31 downto 0)
	 );
end MIPS;

architecture rtl of MIPS is
	signal sig_in_PC, sig_out_PC : std_logic_vector(9 downto 0);

	component reg
		generic(
			DATA_WIDTH : natural := 8
		);
		port(
			clk, rst, en : in std_logic;  
			D : in  std_logic_vector ((DATA_WIDTH-1) downto 0);  
			Q : out std_logic_vector ((DATA_WIDTH-1) downto 0)
		); 
	END component ;
	
	component memInst
		PORT(
			address		: IN STD_LOGIC_VECTOR (9 DOWNTO 0);
			clock		: IN STD_LOGIC  := '1';
			data		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
			wren		: IN STD_LOGIC ;
			q		: OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
		);
	end component;
	
	component addSub
		generic(
			DATA_WIDTH : natural := 8
		);

		port(
			a		: in std_logic_vector ((DATA_WIDTH-1) downto 0);
			b		: in std_logic_vector ((DATA_WIDTH-1) downto 0);
			add_sub : in std_logic;
			result	: out std_logic_vector ((DATA_WIDTH-1) downto 0)
		);
	end component;
	
	component mux2to1
		port (
			SEL : in  STD_LOGIC;
			A, B   : in  STD_LOGIC_VECTOR (31 downto 0);
			X   : out STD_LOGIC_VECTOR (31 downto 0)
		);
	end component;
	
	component PC
		generic(
			DATA_WIDTH : natural := 5
		);
		port(
			clk, rst: in std_logic;  
			D : in  std_logic_vector ((DATA_WIDTH-1) downto 0);  
			Q : out std_logic_vector ((DATA_WIDTH-1) downto 0)
		);  
	end component;
	
	component regbank
		port (
			A1, A2, A3: in std_logic_vector(4 downto 0);
			clk, rst, we3: in std_logic;
			wd3: in std_logic_vector(31 downto 0);
			out1, out2 : out std_logic_vector(31 downto 0)
		);
	end component;
	
	component signalExtensor
		Port (
			in16: in std_logic_vector(15 downto 0);
			out32: out std_logic_vector(31 downto 0)
		);
	end component;
	
	component controller
		PORT (
			opcode : IN std_logic_vector(4 downto 0);
			ulaOp : out std_logic_vector(1 downto 0);
			RegDst, ulaFonte, escMem, lerMem, DvC, memParaReg, fontePC : out std_logic
		);
	END component;
	
	component flipflop
		generic(
			DATA_WIDTH : natural := 32
		);
		port(
			clk, rst : in std_logic;  
			D : in  std_logic_vector ((DATA_WIDTH-1) downto 0);  
			Q : out std_logic_vector ((DATA_WIDTH-1) downto 0)
		);  
	end component;
	
	component ULA
		port (
			in0, in1: in std_logic_vector(31 downto 0);
			oper: in std_logic_vector(3 downto 0);
			zero, over: out std_logic;
			output : out std_logic_vector(31 downto 0)
		);
	end component;
	
	component opULA
		PORT (
			ULAop :in std_logic_vector(1 downto 0);
			funct :in std_logic_vector(5 downto 0);
			oper :out std_logic_vector(3 downto 0)
		);
	END component;
begin
	
	-- PRIMEIRO ESTÁGIO --
	
	PC1: PC GENERIC MAP (DATA_WIDTH => 10) PORT MAP (
		clk => clk,
		rst => rst,
		D => sig_in_PC,
		Q => sig_out_PC
	);
	
	mux_IN_PC: mux2to1 PORT MAP (
		sel => sig_FontePC,
		A => sig_OUT_PCP4_1,
		B => sig_OUT_jump,
		X => sig_in_PC
	);
	
	PCP4: addSub GENERIC MAP (DATA_WIDTH => 10) PORT MAP (
		a => sig_out_PC,
		b => "0000000100",
		add_sub => '1',
		result => sig_OUT_PCP4_1
	);
	
	memI: memInst PORT MAP (
		address	 => sig_out_PC,
		clock	 => clk,
		wren => '0',
		q	 => sig_OUT_memI_1
	);
	
	in_PIPE1 <= sig_OUT_PCP4_1 & sig_OUT_memI_1;
	
	PIPE1: flipflop GENERIC MAP (DATA_WIDTH => 42) PORT MAP (
		clk => clk,
		rst => rst,
		D => in_PIPE1,
		Q => out_PIPE1
	);
	
	-- SEGUNDO ESTÁGIO --
	
	sig_OUT_PCP4_2 <= out_PIPE1(9 downto 0);
	sig_inst <= out_PIPE1(41 downto 10);
    
end rtl;