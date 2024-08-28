
####################################################################################
# Constraints
# ----------------------------------------------------------------------------
#
# 0. Design Compiler variables
#
# 1. Master Clock Definitions
#
# 2. Generated Clock Definitions
#
# 3. Clock Uncertainties
#
# 4. Clock Latencies 
#
# 5. Clock Relationships
#
# 6. #set input/output delay on ports
#
# 7. Driving cells
#
# 8. Output load

####################################################################################
           #########################################################
                  #### Section 0 : DC Variables ####
           #########################################################
#################################################################################### 

# Prevent assign statements in the generated netlist (must be applied before compile command)
set_fix_multiple_port_nets -all -buffer_constants -feedthroughs

####################################################################################
           #########################################################
                  #### Section 1 : Clock Definition ####
           #########################################################
#################################################################################### 
# 1. Master Clock Definitions 
# 2. Generated Clock Definitions
# 3. Clock Latencies
# 4. Clock Uncertainties
# 4. Clock Transitions
####################################################################################
#REF_Master Clock
set REF_CLK_NAME REF_CLK
set REF_CLK_PER 20
set REF_CLK_SETUP_SKEW 0.2
set REF_CLK_HOLD_SKEW 0.1
set REF_CLK_LAT 0
set REF_CLK_RISE 0.01
set REF_CLK_FALL 0.01

create_clock -period $REF_CLK_PER -name $REF_CLK_NAME -waveform "0 [expr $REF_CLK_PER/2]" [get_ports $REF_CLK_NAME]
set_clock_latency $REF_CLK_LAT [get_ports $REF_CLK_NAME]
set_clock_uncertainty -setup $REF_CLK_SETUP_SKEW [get_ports $REF_CLK_NAME]
set_clock_uncertainty -hold $REF_CLK_HOLD_SKEW [get_ports $REF_CLK_NAME]
#set_clock_transition -rise $REF_CLK_RISE [get_ports $REF_CLK_NAME]
#set_clock_transition -fall $REF_CLK_FALL [get_ports $REF_CLK_NAME]

set_dont_touch_network $REF_CLK_NAME

#UART_Master Clock
set UART_CLK_NAME UART_CLK
set UART_CLK_PER 271.297
set UART_CLK_SETUP_SKEW 0.2
set UART_CLK_HOLD_SKEW 0.1
set UART_CLK_LAT 0
set UART_CLK_RISE 0.01
set UART_CLK_FALL 0.01

create_clock -period $UART_CLK_PER -name $UART_CLK_NAME -waveform "0 [expr $UART_CLK_PER/2]" [get_ports $UART_CLK_NAME]
set_clock_latency $UART_CLK_LAT [get_ports $UART_CLK_NAME]
set_clock_uncertainty -setup $UART_CLK_SETUP_SKEW [get_ports $UART_CLK_NAME]
set_clock_uncertainty -hold $UART_CLK_HOLD_SKEW [get_ports $UART_CLK_NAME]
#set_clock_transition -rise $UART_CLK_RISE [get_ports $UART_CLK_NAME]
#set_clock_transition -fall $UART_CLK_FALL [get_ports $UART_CLK_NAME]

set_dont_touch_network $UART_CLK_NAME

#ALU_CLK
create_generated_clock -master_clock  $REF_CLK_NAME \
                       -source        [get_clocks "REF_CLK"] \
                       -name          "ALU_CLK" \
                       -divide_by     1 \
                        [get_ports CLK_GATE/GATED_CLK]

set_clock_latency $REF_CLK_LAT [get_clocks "ALU_CLK"]
set_clock_uncertainty -setup $REF_CLK_SETUP_SKEW [get_clocks "ALU_CLK"]
set_clock_uncertainty -hold $REF_CLK_HOLD_SKEW [get_clocks "ALU_CLK"]

#RX_CLK
create_generated_clock -master_clock  $UART_CLK_NAME \
                       -source        [get_clocks "UART_CLK"] \
                       -name          "RX_CLK" \
                       -divide_by     1 \
                        [get_ports CLK_DIV_1/o_div_clk]

set_clock_latency $UART_CLK_LAT [get_clocks "RX_CLK"]
set_clock_uncertainty -setup $UART_CLK_SETUP_SKEW [get_clocks "RX_CLK"]
set_clock_uncertainty -hold $UART_CLK_HOLD_SKEW [get_clocks "RX_CLK"]

#TX_CLK
create_generated_clock -master_clock  $UART_CLK_NAME \
                       -source        [get_clocks "UART_CLK"] \
                       -name          "TX_CLK" \
                       -divide_by     32 \
                        [get_ports CLK_DIV_2/o_div_clk]

set_clock_latency $UART_CLK_LAT [get_clocks "TX_CLK"]
set_clock_uncertainty -setup $UART_CLK_SETUP_SKEW [get_clocks "TX_CLK"]
set_clock_uncertainty -hold $UART_CLK_HOLD_SKEW [get_clocks "TX_CLK"]

#3. SCAN_CLK (10 MHZ)
set CLK3_NAME SCAN_CLK
set CLK3_PER 100

create_clock -name $CLK3_NAME -period $CLK3_PER -waveform "0 [expr $CLK3_PER/2]" [get_ports scan_clk]
set_clock_uncertainty -setup $REF_CLK_SETUP_SKEW [get_clocks $CLK3_NAME]
set_clock_uncertainty -hold $REF_CLK_HOLD_SKEW   [get_clocks $CLK3_NAME]

####################################################################################
           #########################################################
             #### Section 2 : Clocks Relationship ####
           #########################################################
####################################################################################

set_clock_groups -asynchronous -group [get_clocks "REF_CLK ALU_CLK"]\
                               -group [get_clocks "UART_CLK TX_CLK RX_CLK"] \
                               -group [get_clocks "SCAN_CLK"] 

####################################################################################
           #########################################################
             #### Section 3 : #set input/output delay on ports ####
           #########################################################
####################################################################################

set REF_in_delay  [expr 0.2*$REF_CLK_PER]
set REF_out_delay [expr 0.2*$REF_CLK_PER]

set UART_in_delay  [expr 0.2*$UART_CLK_PER]
set UART_out_delay [expr 0.2*$UART_CLK_PER]


#Constrain Input Paths
set_input_delay $UART_in_delay -clock $UART_CLK_NAME [get_ports RX_IN]

#Constrain Output Paths
set_output_delay $UART_out_delay -clock $UART_CLK_NAME [get_ports TX_OUT]
set_output_delay $UART_out_delay -clock $UART_CLK_NAME [get_ports BUSY]
set_output_delay $UART_out_delay -clock $UART_CLK_NAME [get_ports PARITY_ERROR]
set_output_delay $UART_out_delay -clock $UART_CLK_NAME [get_ports STOP_ERROR]


set in2_delay  [expr 0.2*$CLK3_PER]
set out2_delay [expr 0.2*$CLK3_PER]

#Constrain Scan Input Paths
set_input_delay $in2_delay -clock $CLK3_NAME [get_port test_mode]
set_input_delay $in2_delay -clock $CLK3_NAME [get_port SI]
set_input_delay $in2_delay -clock $CLK3_NAME [get_port SE]

#Constrain Scan Output Paths
set_output_delay $out2_delay -clock $CLK3_NAME [get_port SO]

####################################################################################
           #########################################################
                  #### Section 4 : Driving cells ####
           #########################################################
####################################################################################

set_driving_cell -lib_cell BUFX2M -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -pin Y [get_ports RX_IN]
set_driving_cell -lib_cell BUFX2M -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -pin Y [get_port test_mode]
set_driving_cell -lib_cell BUFX2M -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -pin Y [get_port SI]
set_driving_cell -lib_cell BUFX2M -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -pin Y [get_port SE]

####################################################################################
           #########################################################
                  #### Section 5 : Output load ####
           #########################################################
####################################################################################

set LOAD 0.1

set_load $LOAD [get_ports TX_OUT]
set_load $LOAD [get_ports BUSY]
set_load $LOAD [get_ports PARITY_ERROR]
set_load $LOAD [get_ports STOP_ERROR]
set_load $LOAD [get_ports SO]

####################################################################################
           #########################################################
                 #### Section 6 : Operating Condition ####
           #########################################################
####################################################################################

# Define the Worst Library for Max(#setup) analysis
# Define the Best Library for Min(hold) analysis

set_operating_conditions -min_library "scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c" -min "scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c" -max_library "scmetro_tsmc_cl013g_rvt_ss_1p08v_125c" -max "scmetro_tsmc_cl013g_rvt_ss_1p08v_125c"

####################################################################################
           #########################################################
                  #### Section 7 : wireload Model ####
           #########################################################
####################################################################################

#set_wire_load_model -name tsmc13_wl30 -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c

####################################################################################
           #########################################################
                  #### Section 8 : set_case_analysis ####
           #########################################################
####################################################################################

set_case_analysis 1 [get_port test_mode]

####################################################################################

