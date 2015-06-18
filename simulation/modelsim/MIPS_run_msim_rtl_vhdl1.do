transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {../../dec5p1.vhd}
vcom -93 -work work {../../array32.vhd}
vcom -93 -work work {../../reg.vhd}
vcom -93 -work work {../../addSub.vhd}
vcom -93 -work work {../../mux2to1.vhd}
vcom -93 -work work {../../PC.vhd}
vcom -93 -work work {../../signalExtensor.vhd}
vcom -93 -work work {../../controller.vhd}
vcom -93 -work work {../../flipflop.vhd}
vcom -93 -work work {../../ULA.vhd}
vcom -93 -work work {../../opULA.vhd}
vcom -93 -work work {../../MIPS.vhd}
vcom -93 -work work {../../memInst.vhd}
vcom -93 -work work {../../memData.vhd}
vcom -93 -work work {../../mux32to1.vhd}
vcom -93 -work work {../../regBank.vhd}

vcom -93 -work work {MIPS.vht}

vsim +altera -do MIPS_run_msim_rtl_vhdl.do -l msim_transcript -gui work.mips_vhd_tst 

do wave.do

run 1000ns

wave zoom full