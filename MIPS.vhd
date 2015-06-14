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
		sel => sig_fontePC,
		A => sig_OUT_PCP4_1,
		B => sig_OUT_jump,
		X => sig_in_PC
	);
	
	PCP4: addSub GENERIC MAP (DATA_WIDTH => 10) PORT MAP (
		a => sig_out_PC,
		b => "0000000100", -- 4
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
	sig_opcode <= sig_inst(31 downto 26);
	sig_ReadReg1 <= sig_inst(25 downto 21);
	sig_ReadReg2 <= sig_inst(20 downto 16);
	sig_imediate <= sig_inst(15 downto 0);
	sig_regDest <= sig_inst(15 downto 11);

	controle: controller PORT MAP (
		opcode => sig_opcode,
		ulaOp => sig_ulaOp,
		RegDST => sig_RegDST,
		ulaFonte => sig_ulaFonte,
		escMem => sig_escMem,
		lerMem => sig_lerMem,
		DvC => sig_DvC,
		memParaReg => sig_memParaReg,
		fontePC => sig_fontePC
	);
    
	registradores: regbank PORT MAP (
		A1 => sig_ReadReg1,
		A2 => sig_ReadReg2,
		A3 => sig_RegEsc,
		clk => clk,
		rst => rst,
		we3 => sig_escReg,
		wd3 => sig_regData,
		out1 => sig_dadoLido1,
		out2 => sig_dadoLido2
	);

	ExtSinal: signalExtensor PORT MAP (
		in16 => sig_imediate,
		out32 => sig_imediate_ext,
	);

	in_PIPE1 <= sig_ulaOp & sig_RegDST & sig_ulaFonte & sig_escMem & sig_lerMem & sig_DvC & sig_memParaReg & sig_fontePC & sig_dadoLido1 & sig_dadoLido2 & sig_imediate_ext & sig_ReadReg2 & sig_regDest;

	PIPE2: flipflop GENERIC MAP (DATA_WIDTH => 125) PORT MAP (
		clk => clk,
		rst => rst,
		D => in_PIPE2,
		Q => out_PIPE2
	);

	-- TERCEIRO ESTÁGIO --

	sig_ulaOp_1 <= out_PIPE2(125 downto 124);
	sig_RegDST_1 <= out_PIPE2(123);
	sig_ulaFonte_1 <= out_PIPE2(122);
	sig_escMem_1 <= out_PIPE2(121);
	sig_lerMem_1 <= out_PIPE2(120);
	sig_DvC_1 <= out_PIPE2(119);
	sig_memParaReg_1 <= out_PIPE2(118);
	sig_fontePC_1 <= out_PIPE2(117);
	sig_OUT_PCP4_3 <= out_PIPE2(116 downto 107);
	sig_dadoLido1_1 <= out_PIPE2(106 downto 75);
	sig_dadoLido2_1 <= out_PIPE2(74 downto 43);
	sig_imediate_ext_1 <= out_PIPE2(42 downto 11);
	sig_function <= sig_imediate_ext_1(6 downto 0);
	sig_ReadReg2_1 <= out_PIPE2(10 downto 5);
	sig_regDest_1 <= out_PIPE2(4 downto 0);

	sig_somInPC <= sig_imediate_ext_1(31 downto 2) & "00";
	sig_OUT_PCP4_3_32 <= "000000000000" & sig_OUT_PCP4_3;

	inPC: addSub GENERIC MAP (DATA_WIDTH => 10) PORT MAP (
		a => sig_OUT_PCP4_3_32,
		b => sig_somInPC, 
		add_sub => '1',
		result => sig_OUT_jump
	);

	mux_IN_PC: mux2to1 PORT MAP (
		sel => sig_ulaFonte_1,
		A => sig_dadoLido2_1,
		B => sig_imediate_ext_1,
		X => sig_IN2_ULA
	);

	operaULA: opULA PORT MAP (
		ULAop => sig_ulaOp_1,
		funct => sig_function,
		oper => sig_operULA
	);

	ULA1: ULA PORT MAP (
		in0 => sig_dadoLido1_1,
		in1 => sig_IN2_ULA,
		oper => sig_operULA,
		zero => sig_ULA_zero,
		over => sig_ULA_over,
		output => sig_ULA_result
	);

	muxEscReg: mux2to1 PORT MAP (
		sel => sig_RegDST_1,
		A => sig_dadoLido2_1,
		B => sig_imediate_ext_1,
		X => sig_RegEsc_0
	);


end rtl;