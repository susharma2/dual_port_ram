# This file needs to be run on QuestaSim; if another tool is available, then update the script given below.

 
vlib work
vlog -sv define_file.sv dual_port_ram.sv port_a_intf.sv port_b_intf.sv pkg_a.sv pkg_b.sv pkg.sv tb_top.sv

#vsim -vopt -c work.tb_top -do "coverage save -onexit my_coverage.ucdb;" -logfile mylog.txt
vsim -voptargs=+acc -c work.tb_top

add wave -divider "Port_A"
add wave sim:/tb_top/aintf/clk_a
add wave sim:/tb_top/aintf/rst_a
add wave sim:/tb_top/aintf/master_a/*
add wave -divider "Port_B"
add wave sim:/tb_top/bintf/clk_b
add wave sim:/tb_top/bintf/rst_b
add wave sim:/tb_top/bintf/master_b/*

run -all;