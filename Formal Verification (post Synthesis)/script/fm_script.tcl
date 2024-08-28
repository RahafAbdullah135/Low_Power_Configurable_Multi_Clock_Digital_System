###################################################################
########################### Variables #############################
###################################################################

set SSLIB "/home/IC/Projects/std_cells/scmetro_tsmc_cl013g_rvt_ss_1p08v_125c.db"
set TTLIB "/home/IC/Projects/std_cells/scmetro_tsmc_cl013g_rvt_tt_1p2v_25c.db"
set FFLIB "/home/IC/Projects/std_cells/scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c.db"

###################################################################
############################ Guidance #############################
###################################################################

# Synopsys setup variable
set synopsys_auto_setup true

# Formality Setup File
set_svf "/home/IC/Projects/syn/SYS_TOP.svf"

###################################################################
###################### Reference Container ########################
###################################################################

# Read Reference Design Verilog Files
read_verilog -container REF [glob /home/IC/Projects/rtl/*.v]
read_verilog -container REF [glob /home/IC/Projects/rtl/UART/UART_TX/*.v]
read_verilog -container REF [glob /home/IC/Projects/rtl/UART/UART_RX/*.v]
read_verilog -container REF [glob /home/IC/Projects/rtl/ASYNC_FIFO/*.v]

# Read Reference technology libraries
read_db -container REF "/home/IC/Projects/std_cells/scmetro_tsmc_cl013g_rvt_tt_1p2v_25c.db"

# set the top Reference Design 
set_reference_design SYS_TOP
set_top SYS_TOP

###################################################################
#################### Implementation Container #####################
###################################################################

# Read Implementation Design Files
read_verilog -netlist -container IMP "/home/IC/Projects/syn/SYS_TOP.v"

# Read Implementation technology libraries
read_db -container IMP "/home/IC/Projects/std_cells/scmetro_tsmc_cl013g_rvt_tt_1p2v_25c.db"

# set the top Implementation Design
set_implementation_design SYS_TOP
set_top SYS_TOP


###################### Matching Compare points ####################

match

######################### Run Verification ########################

set successful [verify]
if {!$successful} {
diagnose
analyze_points -failing
}

########################### Reporting ############################# 
report_passing_points > "passing_points.rpt"
report_failing_points > "failing_points.rpt"
report_aborted_points > "aborted_points.rpt"
report_unverified_points > "unverified_points.rpt"


start_gui

