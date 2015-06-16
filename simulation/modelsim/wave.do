onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -group Geradores -label rst /mips_vhd_tst/rst
add wave -noupdate -group Geradores -label clk /mips_vhd_tst/clk
add wave -noupdate -divider {Estágio 1}
add wave -noupdate -group PC1 -label sig_in_PC /mips_vhd_tst/i1/sig_in_PC
add wave -noupdate -group PC1 -label sig_out_PC /mips_vhd_tst/i1/sig_out_PC
add wave -noupdate -group PCP4/addsub -label sig_out_PC /mips_vhd_tst/i1/sig_out_PC
add wave -noupdate -group PCP4/addsub -label sig_OUT_PCP4_1 /mips_vhd_tst/i1/sig_OUT_PCP4_1
add wave -noupdate -group mux_IN_PC -label sig_fontePC /mips_vhd_tst/i1/sig_fontePC
add wave -noupdate -group mux_IN_PC -label sig_OUT_PCP4_1 /mips_vhd_tst/i1/sig_OUT_PCP4_1
add wave -noupdate -group mux_IN_PC -label sig_OUT_jump_1 /mips_vhd_tst/i1/sig_OUT_jump_1
add wave -noupdate -group mux_IN_PC -label sig_in_PC /mips_vhd_tst/i1/sig_in_PC
add wave -noupdate -group memInst -label sig_out_PC /mips_vhd_tst/i1/sig_out_PC
add wave -noupdate -group memInst -label sig_OUT_memI_1 /mips_vhd_tst/i1/sig_OUT_memI_1
add wave -noupdate -group {IN PIPE 1} -label sig_OUT_PCP4_1 /mips_vhd_tst/i1/sig_OUT_PCP4_1
add wave -noupdate -group {IN PIPE 1} -label sig_OUT_memI_1 /mips_vhd_tst/i1/sig_OUT_memI_1
add wave -noupdate -group {PIPE 1} -label in_PIPE1 /mips_vhd_tst/i1/in_PIPE1
add wave -noupdate -group {PIPE 1} -label out_PIPE1 /mips_vhd_tst/i1/out_PIPE1
add wave -noupdate -divider {Estágio 2}
add wave -noupdate -group {OUT PIPE 1} -label sig_OUT_PCP4_2 /mips_vhd_tst/i1/sig_OUT_PCP4_2
add wave -noupdate -group {OUT PIPE 1} -label sig_inst /mips_vhd_tst/i1/sig_inst
add wave -noupdate -group {OUT PIPE 1} -label sig_opcode /mips_vhd_tst/i1/sig_opcode
add wave -noupdate -group {OUT PIPE 1} -label sig_ReadReg1 /mips_vhd_tst/i1/sig_ReadReg1
add wave -noupdate -group {OUT PIPE 1} -label sig_ReadReg2 /mips_vhd_tst/i1/sig_ReadReg2
add wave -noupdate -group {OUT PIPE 1} -label sig_imediate /mips_vhd_tst/i1/sig_imediate
add wave -noupdate -group {OUT PIPE 1} -label sig_regDest /mips_vhd_tst/i1/sig_regDest
add wave -noupdate -group controle -label sig_opcode /mips_vhd_tst/i1/sig_opcode
add wave -noupdate -group controle -label sig_ulaOp /mips_vhd_tst/i1/sig_ulaOp
add wave -noupdate -group controle -label sig_RegDST /mips_vhd_tst/i1/sig_RegDST
add wave -noupdate -group controle -label sig_ulaFonte /mips_vhd_tst/i1/sig_ulaFonte
add wave -noupdate -group controle -label sig_escMem /mips_vhd_tst/i1/sig_escMem
add wave -noupdate -group controle -label sig_lerMem /mips_vhd_tst/i1/sig_lerMem
add wave -noupdate -group controle -label sig_DvC /mips_vhd_tst/i1/sig_DvC
add wave -noupdate -group controle -label sig_memParaReg /mips_vhd_tst/i1/sig_memParaReg
add wave -noupdate -group controle -label sig_escReg /mips_vhd_tst/i1/sig_escReg
add wave -noupdate -group {Banco Registradores} -label sig_ReadReg1 /mips_vhd_tst/i1/sig_ReadReg1
add wave -noupdate -group {Banco Registradores} -label sig_ReadReg2 /mips_vhd_tst/i1/sig_ReadReg2
add wave -noupdate -group {Banco Registradores} -label sig_escReg_2 /mips_vhd_tst/i1/sig_escReg_2
add wave -noupdate -group {Banco Registradores} -label sig_escReg_3 /mips_vhd_tst/i1/sig_escReg_3
add wave -noupdate -group {Banco Registradores} -label sig_regData /mips_vhd_tst/i1/sig_regData
add wave -noupdate -group {Banco Registradores} -label sig_dadoLido1 /mips_vhd_tst/i1/sig_dadoLido1
add wave -noupdate -group {Banco Registradores} -label sig_dadoLido2 /mips_vhd_tst/i1/sig_dadoLido2
add wave -noupdate -group {Extensor de sinal} -label sig_imediate /mips_vhd_tst/i1/sig_imediate
add wave -noupdate -group {Extensor de sinal} -label sig_imediate_ext /mips_vhd_tst/i1/sig_imediate_ext
add wave -noupdate -group {IN PIPE 2} -label sig_ulaOp /mips_vhd_tst/i1/sig_ulaOp
add wave -noupdate -group {IN PIPE 2} -label sig_RegDST /mips_vhd_tst/i1/sig_RegDST
add wave -noupdate -group {IN PIPE 2} -label sig_ulaFonte /mips_vhd_tst/i1/sig_ulaFonte
add wave -noupdate -group {IN PIPE 2} -label sig_escMem /mips_vhd_tst/i1/sig_escMem
add wave -noupdate -group {IN PIPE 2} -label sig_lerMem /mips_vhd_tst/i1/sig_lerMem
add wave -noupdate -group {IN PIPE 2} -label sig_DvC /mips_vhd_tst/i1/sig_DvC
add wave -noupdate -group {IN PIPE 2} -label sig_memParaReg /mips_vhd_tst/i1/sig_memParaReg
add wave -noupdate -group {IN PIPE 2} -label sig_escReg /mips_vhd_tst/i1/sig_escReg
add wave -noupdate -group {IN PIPE 2} -label sig_OUT_PCP4_2 /mips_vhd_tst/i1/sig_OUT_PCP4_2
add wave -noupdate -group {IN PIPE 2} -label sig_dadoLido1 /mips_vhd_tst/i1/sig_dadoLido1
add wave -noupdate -group {IN PIPE 2} -label sig_dadoLido2 /mips_vhd_tst/i1/sig_dadoLido2
add wave -noupdate -group {IN PIPE 2} -label sig_imediate_ext /mips_vhd_tst/i1/sig_imediate_ext
add wave -noupdate -group {IN PIPE 2} -label sig_ReadReg2 /mips_vhd_tst/i1/sig_ReadReg2
add wave -noupdate -group {IN PIPE 2} -label sig_regDest /mips_vhd_tst/i1/sig_regDest
add wave -noupdate -group {PIPE 2} -label in_PIPE2 /mips_vhd_tst/i1/in_PIPE2
add wave -noupdate -group {PIPE 2} -label out_pipe2 /mips_vhd_tst/i1/out_pipe2
add wave -noupdate -divider {Estágio 3}
add wave -noupdate -group {OUT PIPE 2} -label sig_ulaOp_1 /mips_vhd_tst/i1/sig_ulaOp_1
add wave -noupdate -group {OUT PIPE 2} -label sig_RegDST_1 /mips_vhd_tst/i1/sig_RegDST_1
add wave -noupdate -group {OUT PIPE 2} -label sig_ulaFonte_1 /mips_vhd_tst/i1/sig_ulaFonte_1
add wave -noupdate -group {OUT PIPE 2} -label sig_escMem_1 /mips_vhd_tst/i1/sig_escMem_1
add wave -noupdate -group {OUT PIPE 2} -label sig_lerMem_1 /mips_vhd_tst/i1/sig_lerMem_1
add wave -noupdate -group {OUT PIPE 2} -label sig_DvC_1 /mips_vhd_tst/i1/sig_DvC_1
add wave -noupdate -group {OUT PIPE 2} -label sig_memParaReg_1 /mips_vhd_tst/i1/sig_memParaReg_1
add wave -noupdate -group {OUT PIPE 2} -label sig_escReg_1 /mips_vhd_tst/i1/sig_escReg_1
add wave -noupdate -group {OUT PIPE 2} -label sig_OUT_PCP4_3 /mips_vhd_tst/i1/sig_OUT_PCP4_3
add wave -noupdate -group {OUT PIPE 2} -label sig_dadoLido1_1 /mips_vhd_tst/i1/sig_dadoLido1_1
add wave -noupdate -group {OUT PIPE 2} -label sig_dadoLido2_1 /mips_vhd_tst/i1/sig_dadoLido2_1
add wave -noupdate -group {OUT PIPE 2} -label sig_imediate_ext_1 /mips_vhd_tst/i1/sig_imediate_ext_1
add wave -noupdate -group {OUT PIPE 2} -label sig_function /mips_vhd_tst/i1/sig_function
add wave -noupdate -group {OUT PIPE 2} -label sig_ReadReg2_1 /mips_vhd_tst/i1/sig_ReadReg2_1
add wave -noupdate -group {OUT PIPE 2} -label sig_regDest_1 /mips_vhd_tst/i1/sig_regDest_1
add wave -noupdate -group {OUT PIPE 2} -label sig_somInPC /mips_vhd_tst/i1/sig_somInPC
add wave -noupdate -group inPC/addsub -label sig_OUT_PCP4_3 /mips_vhd_tst/i1/sig_OUT_PCP4_3
add wave -noupdate -group inPC/addsub -label sig_somInPC /mips_vhd_tst/i1/sig_somInPC
add wave -noupdate -group inPC/addsub -label sig_OUT_jump /mips_vhd_tst/i1/sig_OUT_jump
add wave -noupdate -group mux_IN_ULA_2 -label sig_ulaFonte_1 /mips_vhd_tst/i1/sig_ulaFonte_1
add wave -noupdate -group mux_IN_ULA_2 -label sig_dadoLido2_1 /mips_vhd_tst/i1/sig_dadoLido2_1
add wave -noupdate -group mux_IN_ULA_2 -label sig_imediate_ext_1 /mips_vhd_tst/i1/sig_imediate_ext_1
add wave -noupdate -group mux_IN_ULA_2 -label sig_IN2_ULA /mips_vhd_tst/i1/sig_IN2_ULA
add wave -noupdate -group opULA -label sig_ulaOp_1 /mips_vhd_tst/i1/sig_ulaOp_1
add wave -noupdate -group opULA -label sig_function /mips_vhd_tst/i1/sig_function
add wave -noupdate -group opULA -label sig_operULA /mips_vhd_tst/i1/sig_operULA
add wave -noupdate -group ULA -label sig_dadoLido1_1 /mips_vhd_tst/i1/sig_dadoLido1_1
add wave -noupdate -group ULA -label sig_IN2_ULA /mips_vhd_tst/i1/sig_IN2_ULA
add wave -noupdate -group ULA -label sig_operULA /mips_vhd_tst/i1/sig_operULA
add wave -noupdate -group ULA -label sig_ULA_zero /mips_vhd_tst/i1/sig_ULA_zero
add wave -noupdate -group ULA -label sig_ULA_over /mips_vhd_tst/i1/sig_ULA_over
add wave -noupdate -group ULA -label sig_ULA_result /mips_vhd_tst/i1/sig_ULA_result
add wave -noupdate -group muxEscReg -label sig_RegDST_1 /mips_vhd_tst/i1/sig_RegDST_1
add wave -noupdate -group muxEscReg -label sig_ReadReg2_1 /mips_vhd_tst/i1/sig_ReadReg2_1
add wave -noupdate -group muxEscReg -label sig_regDest_1 /mips_vhd_tst/i1/sig_regDest_1
add wave -noupdate -group muxEscReg -label sig_RegEsc_0 /mips_vhd_tst/i1/sig_RegEsc_0
add wave -noupdate -group {IN PIPE 3} -label sig_escMem_1 /mips_vhd_tst/i1/sig_escMem_1
add wave -noupdate -group {IN PIPE 3} -label sig_lerMem_1 /mips_vhd_tst/i1/sig_lerMem_1
add wave -noupdate -group {IN PIPE 3} -label sig_DvC_1 /mips_vhd_tst/i1/sig_DvC_1
add wave -noupdate -group {IN PIPE 3} -label sig_memParaReg_1 /mips_vhd_tst/i1/sig_memParaReg_1
add wave -noupdate -group {IN PIPE 3} -label sig_escReg_1 /mips_vhd_tst/i1/sig_escReg_1
add wave -noupdate -group {IN PIPE 3} -label sig_OUT_jump /mips_vhd_tst/i1/sig_OUT_jump
add wave -noupdate -group {IN PIPE 3} -label sig_ULA_zero /mips_vhd_tst/i1/sig_ULA_zero
add wave -noupdate -group {IN PIPE 3} -label sig_ULA_result /mips_vhd_tst/i1/sig_ULA_result
add wave -noupdate -group {IN PIPE 3} -label sig_dadoLido2_1 /mips_vhd_tst/i1/sig_dadoLido2_1
add wave -noupdate -group {IN PIPE 3} -label sig_RegEsc_0 /mips_vhd_tst/i1/sig_RegEsc_0
add wave -noupdate -group {PIPE 3} -label in_PIPE3 /mips_vhd_tst/i1/in_PIPE3
add wave -noupdate -group {PIPE 3} -label out_PIPE3 /mips_vhd_tst/i1/out_PIPE3
add wave -noupdate -divider {Estágio 4}
add wave -noupdate -group {OUT PIPE 3} -label sig_escMem_2 /mips_vhd_tst/i1/sig_escMem_2
add wave -noupdate -group {OUT PIPE 3} -label sig_lerMem_2 /mips_vhd_tst/i1/sig_lerMem_2
add wave -noupdate -group {OUT PIPE 3} -label sig_DvC_2 /mips_vhd_tst/i1/sig_DvC_2
add wave -noupdate -group {OUT PIPE 3} -label sig_memParaReg_2 /mips_vhd_tst/i1/sig_memParaReg_2
add wave -noupdate -group {OUT PIPE 3} -label sig_escReg_2 /mips_vhd_tst/i1/sig_escReg_2
add wave -noupdate -group {OUT PIPE 3} -label sig_OUT_jump_1 /mips_vhd_tst/i1/sig_OUT_jump_1
add wave -noupdate -group {OUT PIPE 3} -label sig_ULA_zero_1 /mips_vhd_tst/i1/sig_ULA_zero_1
add wave -noupdate -group {OUT PIPE 3} -label sig_ULA_result_1 /mips_vhd_tst/i1/sig_ULA_result_1
add wave -noupdate -group {OUT PIPE 3} -label sig_dadoLido2_2 /mips_vhd_tst/i1/sig_dadoLido2_2
add wave -noupdate -group {OUT PIPE 3} -label sig_RegEsc_1 /mips_vhd_tst/i1/sig_RegEsc_1
add wave -noupdate -group {OUT PIPE 3} -label sig_fontePC /mips_vhd_tst/i1/sig_fontePC
add wave -noupdate -group fontePC -label sig_DvC_2 /mips_vhd_tst/i1/sig_DvC_2
add wave -noupdate -group fontePC -label sig_ULA_zero_1 /mips_vhd_tst/i1/sig_ULA_zero_1
add wave -noupdate -group fontePC -label sig_fontePC /mips_vhd_tst/i1/sig_fontePC
add wave -noupdate -group memData -label sig_ULA_result_1 /mips_vhd_tst/i1/sig_ULA_result_1
add wave -noupdate -group memData -label sig_dadoLido2_2 /mips_vhd_tst/i1/sig_dadoLido2_2
add wave -noupdate -group memData -label sig_escMem_2 /mips_vhd_tst/i1/sig_escMem_2
add wave -noupdate -group memData -label sig_OUT_memD /mips_vhd_tst/i1/sig_OUT_memD
add wave -noupdate -group {IN PIPE 4} -label sig_memParaReg_2 /mips_vhd_tst/i1/sig_memParaReg_2
add wave -noupdate -group {IN PIPE 4} -label sig_escReg_2 /mips_vhd_tst/i1/sig_escReg_2
add wave -noupdate -group {IN PIPE 4} -label sig_OUT_memD /mips_vhd_tst/i1/sig_OUT_memD
add wave -noupdate -group {IN PIPE 4} -label sig_ULA_result_1 /mips_vhd_tst/i1/sig_ULA_result_1
add wave -noupdate -group {IN PIPE 4} -label sig_RegEsc_1 /mips_vhd_tst/i1/sig_RegEsc_1
add wave -noupdate -group {PIPE 4} -label in_PIPE4 /mips_vhd_tst/i1/in_PIPE4
add wave -noupdate -group {PIPE 4} -label out_PIPE4 /mips_vhd_tst/i1/out_PIPE4
add wave -noupdate -divider {Estágio 5}
add wave -noupdate -group {OUT PIPE 4} -label sig_memParaReg_3 /mips_vhd_tst/i1/sig_memParaReg_3
add wave -noupdate -group {OUT PIPE 4} -label sig_escReg_3 /mips_vhd_tst/i1/sig_escReg_3
add wave -noupdate -group {OUT PIPE 4} -label sig_OUT_memD_1 /mips_vhd_tst/i1/sig_OUT_memD_1
add wave -noupdate -group {OUT PIPE 4} -label sig_ULA_result_2 /mips_vhd_tst/i1/sig_ULA_result_2
add wave -noupdate -group {OUT PIPE 4} -label sig_RegEsc_2 /mips_vhd_tst/i1/sig_RegEsc_2
add wave -noupdate -group muxEscReg2 -label sig_memParaReg_3 /mips_vhd_tst/i1/sig_memParaReg_3
add wave -noupdate -group muxEscReg2 -label sig_OUT_memD_1 /mips_vhd_tst/i1/sig_OUT_memD_1
add wave -noupdate -group muxEscReg2 -label sig_ULA_result_2 /mips_vhd_tst/i1/sig_ULA_result_2
add wave -noupdate -group muxEscReg2 /mips_vhd_tst/i1/sig_regData
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {6694 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 172
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {36271 ps}
