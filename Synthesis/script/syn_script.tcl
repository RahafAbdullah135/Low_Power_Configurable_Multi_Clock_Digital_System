
########################### Define Top Module ############################
                                                   
set top_module SYS_TOP

########################### Formality Setup file ############################

set_svf SYS_TOP.svf

##################### Define Working Library Directory ######################
                                                   
define_design_lib work -path ./work

################## Design Compiler Library Files #setup ######################

lappend search_path /home/IC/Projects/std_cells
lappend search_path /home/IC/Projects/rtl
lappend search_path /home/IC/Projects/rtl/UART/UART_RX
lappend search_path /home/IC/Projects/rtl/UART/UART_TX
lappend search_path /home/IC/Projects/rtl/ASYNC_FIFO

set SSLIB "scmetro_tsmc_cl013g_rvt_ss_1p08v_125c.db"
set TTLIB "scmetro_tsmc_cl013g_rvt_tt_1p2v_25c.db"
set FFLIB "scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c.db"

## Standard Cell libraries 
set target_library [list $SSLIB $TTLIB $FFLIB]

## Standard Cell & Hard Macros libraries 
set link_library [list * $SSLIB $TTLIB $FFLIB]  

#echo "###############################################"
#echo "############# Reading RTL Files  ##############"
#echo "###############################################"

set file_format verilog

analyze -format $file_format [glob /home/IC/Projects/rtl/*.v]
analyze -format $file_format [glob /home/IC/Projects/rtl/UART/UART_TX/*.v]
analyze -format $file_format [glob /home/IC/Projects/rtl/UART/UART_RX/*.v]
analyze -format $file_format [glob /home/IC/Projects/rtl/ASYNC_FIFO/*.v]

elaborate -lib work SYS_TOP

#read_file -format $file_format SYS_CTRL.v
#read_file -format $file_format RST_SYNC.v
#read_file -format $file_format Reg_File.v
#read_file -format $file_format PULSE_GEN.v
#read_file -format $file_format DATA_SYNC.v
#read_file -format $file_format CLK_GATE.v
#read_file -format $file_format CLK_DIV_MUX.v
#read_file -format $file_format Clk_Div.v
#read_file -format $file_format ALU.v
#read_file -format $file_format counter.v
#read_file -format $file_format data_sampling.v
#read_file -format $file_format deserializer.v
#read_file -format $file_format fsm.v
#read_file -format $file_format parity_check.v
#read_file -format $file_format stop_check.v
#read_file -format $file_format start_check.v
#read_file -format $file_format UART_RX.v
#read_file -format $file_format FSM.v
#read_file -format $file_format MUX.v
#read_file -format $file_format parity_Calc.v
#read_file -format $file_format UART_TX.v
#read_file -format $file_format DF_SYNC.v
#read_file -format $file_format FIFO.v
#read_file -format $file_format FIFO_MEM_CNTRL.v
#read_file -format $file_format FIFO_RD.v
#read_file -format $file_format FIFO_WR.v
#read_file -format $file_format SYS_TOP.v

###################### Defining toplevel ###################################

current_design $top_module

#################### Liniking All The Design Parts #########################
puts "###############################################"
puts "######## Liniking All The Design Parts ########"
puts "###############################################"

link 

#################### Liniking All The Design Parts #########################
puts "###############################################"
puts "######## checking design consistency ##########"
puts "###############################################"

check_design >> check_design.rpt

############################### Path groups ################################
puts "###############################################"
puts "################ Path groups ##################"
puts "###############################################"

group_path -name INREG -from [all_inputs]
group_path -name REGOUT -to [all_outputs]
group_path -name INOUT -from [all_inputs] -to [all_outputs]

#################### Define Design Constraints #########################
puts "###############################################"
puts "############ Design Constraints #### ##########"
puts "###############################################"

source -echo ./cons.tcl

###################### Mapping and optimization ########################
puts "###############################################"
puts "########## Mapping & Optimization #############"
puts "###############################################"

compile -map_effort high

##################### Close Formality Setup file ###########################

set_svf -off

#############################################################################
# Write out Design after initial compile
#############################################################################

write_file -format verilog -hierarchy -output SYS_TOP.v
write_file -format ddc -hierarchy -output SYS_TOP.ddc

write_sdf SYS_TOP.sdf
write_sdc SYS_TOP.sdc

################# reporting #######################

report_power -hierarchy > power.rpt
report_area -hierarchy > area.rpt
report_timing -max_paths 100 -delay_type max > setup.rpt
report_timing -max_paths 100 -delay_type min > hold.rpt
report_clock -attributes > clocks.rpt
report_constraint -all_violators > constrain.rpt

############################################################################
# DFT Preparation Section
############################################################################

set flops_per_chain 100

set num_flops [sizeof_collection [all_registers -edge_triggered]]

set num_chains [expr $num_flops / $flops_per_chain + 1 ]

################# starting graphical user interface #######################

#gui_start
