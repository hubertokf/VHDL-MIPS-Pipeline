library ieee;
use ieee.numeric_std.all;
use IEEE.STD_LOGIC_1164.ALL;

entity MIPS is
    Port (
		clk, rst: in std_logic
	 );
end MIPS;

architecture rtl of MIPS is
	signal sig_OUT_PCP4_2, sig_OUT_jump, sig_OUT_memI_1, sig_inst, sig_regData, sig_dadoLido1, sig_dadoLido2,
	sig_imediate_ext, sig_dadoLido1_1,sig_dadoLido2_1, sig_imediate_ext_1, sig_somInPC,
	sig_IN2_ULA, sig_ULA_result, sig_OUT_PCP4_3, sig_in_PC, sig_out_PC,
	sig_OUT_jump_1, sig_ULA_result_1, sig_dadoLido2_2, sig_OUT_memD, 
	sig_OUT_memD_1, sig_ULA_result_2, sig_OUT_PCP4_1: std_logic_vector(31 downto 0);
	signal in_PIPE1, out_PIPE1: std_logic_vector(63 downto 0);
	signal sig_opcode, sig_function : std_logic_vector(5 downto 0);
	signal sig_ReadReg1, sig_ReadReg2, sig_regDest, sig_RegEsc, sig_ReadReg2_1, sig_regDest_1,
	sig_RegEsc_1, sig_RegEsc_0, sig_RegEsc_2 : std_logic_vector (4 downto 0);
	signal sig_imediate: std_logic_vector(15 downto 0);
	signal sig_ulaOp, sig_ulaOp_1: std_logic_vector(1 downto 0);
	signal sig_ulaFonte, sig_ulaFonte_1, sig_escMem, sig_escMem_1, sig_lerMem, 
	sig_lerMem_1, sig_DvC, sig_DvC_1, sig_memParaReg, sig_memParaReg_1, sig_fontePC, we3, 
	sig_escReg_1, sig_ULA_zero, sig_ULA_over, sig_RegDST, sig_escMem_2, sig_lerMem_2,
	sig_DvC_2, sig_memParaReg_2, sig_escReg_2, sig_ULA_zero_1, sig_memParaReg_3, sig_escReg_3, sig_escReg, sig_RegDST_1 : STD_LOGIC;
	signal in_PIPE2, out_pipe2: std_logic_vector( 146 downto 0);
	signal sig_operULA: std_logic_vector(3 downto 0);
	signal in_PIPE3,  out_PIPE3: std_logic_vector (106 downto 0);
	signal in_PIPE4, out_PIPE4: std_logic_vector(70 downto 0);

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
			address	: IN STD_LOGIC_VECTOR (9 DOWNTO 0);
			clock		: IN STD_LOGIC  := '1';
			data		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
			wren		: IN STD_LOGIC ;
			q		   : OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
		);
	end component;
	
	component memData
		PORT(
			address	: IN STD_LOGIC_VECTOR (9 DOWNTO 0);
			clock		: IN STD_LOGIC  := '1';
			data		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
			wren		: IN STD_LOGIC ;
			q		   : OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
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
		generic(
			DATA_WIDTH : natural := 32
		);
		port (
			SEL : in  STD_LOGIC;
			A, B   : in  STD_LOGIC_VECTOR((DATA_WIDTH-1) downto 0);
			X   : out STD_LOGIC_VECTOR((DATA_WIDTH-1) downto 0)
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
			opcode : IN std_logic_vector(5 downto 0);
			ulaOp : out std_logic_vector(1 downto 0);
			RegDst, ulaFonte, escMem, lerMem, DvC, memParaReg, escReg : out std_logic
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
	
	PC1: PC GENERIC MAP (DATA_WIDTH => 32) PORT MAP (
		clk => clk,
		rst => rst,
		D => sig_in_PC,
		Q => sig_out_PC
	);
	
	mux_IN_PC: mux2to1 GENERIC MAP (DATA_WIDTH => 32) PORT MAP (
		sel => sig_fontePC,
		A => sig_OUT_PCP4_1,
		B => sig_OUT_jump_1,
		X => sig_in_PC
	);
	
	PCP4: addSub GENERIC MAP (DATA_WIDTH => 32) PORT MAP (
		a => sig_out_PC,
		b => "00000000000000000000000000000100", -- 4
		add_sub => '1',
		result => sig_OUT_PCP4_1
	);
	
	memI: memInst PORT MAP (
		address	 => sig_out_PC(11 downto 2),
		clock	 => clk,
		data => (others => '0'),
		wren => '0',
		q	 => sig_OUT_memI_1
	);
	
	in_PIPE1 <= sig_OUT_PCP4_1 & sig_OUT_memI_1;
	
	PIPE1: flipflop GENERIC MAP (DATA_WIDTH => 64) PORT MAP (
		clk => clk,
		rst => rst,
		D => in_PIPE1,
		Q => out_PIPE1
	);
	
	-- SEGUNDO ESTÁGIO --
	
	sig_OUT_PCP4_2 <= out_PIPE1(63 downto 32);
	sig_inst <= out_PIPE1(31 downto 0);
	
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
		escReg => sig_escReg
	);
    
	registradores: regbank PORT MAP (
		A1 => sig_ReadReg1,
		A2 => sig_ReadReg2,
		A3 => sig_RegEsc_2,
		clk => clk,
		rst => rst,
		we3 => sig_escReg_3,
		wd3 => sig_regData,
		out1 => sig_dadoLido1,
		out2 => sig_dadoLido2
	);

	ExtSinal: signalExtensor PORT MAP (
		in16 => sig_imediate,
		out32 => sig_imediate_ext
	);

	in_PIPE2 <= sig_ulaOp & sig_RegDST & sig_ulaFonte & sig_escMem & sig_lerMem & sig_DvC & sig_memParaReg & sig_escReg & sig_OUT_PCP4_2 & sig_dadoLido1 & sig_dadoLido2 & sig_imediate_ext & sig_ReadReg2 & sig_regDest;

	PIPE2: flipflop GENERIC MAP (DATA_WIDTH => 147) PORT MAP (
		clk => clk,
		rst => rst,
		D => in_PIPE2,
		Q => out_PIPE2
	);

	-- TERCEIRO ESTÁGIO --

	sig_ulaOp_1 <= out_PIPE2(146 downto 145);
	sig_RegDST_1 <= out_PIPE2(144);
	sig_ulaFonte_1 <= out_PIPE2(143);
	sig_escMem_1 <= out_PIPE2(142);
	sig_lerMem_1 <= out_PIPE2(141);
	sig_DvC_1 <= out_PIPE2(140);
	sig_memParaReg_1 <= out_PIPE2(139);
	sig_escReg_1 <= out_PIPE2(138);
	sig_OUT_PCP4_3 <= out_PIPE2(137 downto 106);
	sig_dadoLido1_1 <= out_PIPE2(105 downto 74);
	sig_dadoLido2_1 <= out_PIPE2(73 downto 42);
	sig_imediate_ext_1 <= out_PIPE2(41 downto 10);
	sig_function <= sig_imediate_ext_1(5 downto 0);
	sig_ReadReg2_1 <= out_PIPE2(9 downto 5);
	sig_regDest_1 <= out_PIPE2(4 downto 0);

	sig_somInPC <= sig_imediate_ext_1(31 downto 2) & "00";

	inPC: addSub GENERIC MAP (DATA_WIDTH => 32) PORT MAP (
		a => sig_OUT_PCP4_3,
		b => sig_somInPC,       --b de 10 recebe de 32 --  
		add_sub => '1',
		result => sig_OUT_jump
	);

	mux_IN_ULA_2: mux2to1 GENERIC MAP (DATA_WIDTH => 32) PORT MAP (
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

	muxEscReg: mux2to1 GENERIC MAP (DATA_WIDTH => 5) PORT MAP (
		sel => sig_RegDST_1,
		A => sig_ReadReg2_1,
		B => sig_regDest_1,
		X => sig_RegEsc_0
	);

	in_PIPE3 <= sig_escMem_1 & sig_lerMem_1 & sig_DvC_1 & sig_memParaReg_1 & sig_escReg_1 & sig_OUT_jump & sig_ULA_zero & sig_ULA_result & sig_dadoLido2_1 & sig_RegEsc_0;

	PIPE3: flipflop GENERIC MAP (DATA_WIDTH => 107) PORT MAP (
		clk => clk,
		rst => rst,
		D => in_PIPE3,
		Q => out_PIPE3
	);

	-- QUARTO ESTÁGIO --

	sig_escMem_2 <= out_PIPE3(106);
	sig_lerMem_2 <= out_PIPE3(105);
	sig_DvC_2 <= out_PIPE3(104);
	sig_memParaReg_2 <= out_PIPE3(103);
	sig_escReg_2 <= out_PIPE3(102);
	sig_OUT_jump_1 <= out_PIPE3(101 downto 70);
	sig_ULA_zero_1 <= out_PIPE3(69);
	sig_ULA_result_1 <= out_PIPE3(68 downto 37);
	sig_dadoLido2_2 <= out_PIPE3(36 downto 5);
	sig_RegEsc_1 <= out_PIPE3(4 downto 0);

	sig_fontePC <= sig_DvC_2 and sig_ULA_zero_1;

	memD: memData PORT MAP (
		address	 => sig_ULA_result_1(9 downto 0),
		clock	 => clk,
		data => sig_dadoLido2_2,
		wren => sig_escMem_2,
		q	 => sig_OUT_memD
	);

	in_PIPE4 <= sig_memParaReg_2 & sig_escReg_2 & sig_OUT_memD & sig_ULA_result_1 & sig_RegEsc_1;

	PIPE4: flipflop GENERIC MAP (DATA_WIDTH => 71) PORT MAP (
		clk => clk,
		rst => rst,
		D => in_PIPE4,
		Q => out_PIPE4
	);

	-- QUINTO ESTÁGIO --

	sig_memParaReg_3 <= out_PIPE4(70);
	sig_escReg_3 <= out_PIPE4(69);
	sig_OUT_memD_1 <= out_PIPE4(68 downto 37);
	sig_ULA_result_2 <= out_PIPE4(36 downto 5);
	sig_RegEsc_2 <= out_PIPE4(4 downto 0);

	muxEscReg2: mux2to1 GENERIC MAP (DATA_WIDTH => 32) PORT MAP (
		sel => sig_memParaReg_3,
		A => sig_OUT_memD_1,
		B => sig_ULA_result_2,
		X => sig_regData
	);

end rtl;