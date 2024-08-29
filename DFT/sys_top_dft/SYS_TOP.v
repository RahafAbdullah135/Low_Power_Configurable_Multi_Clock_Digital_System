module SYS_TOP 
#(
	parameter DATA_WIDTH = 8 ,
	parameter ADDRESS_WIDTH = 4 ,
	parameter FUN_WIDTH = 4 ,
	parameter OUT_WIDTH = DATA_WIDTH*2 ,
        parameter NUM_OF_CHAINS = 4
 )

 (
        input   wire                          scan_clk ,
 	input   wire                          scan_rst ,
 	input   wire                          test_mode ,
	input   wire                          SE ,
	input   wire   [NUM_OF_CHAINS-1:0]    SI ,
	output  wire   [NUM_OF_CHAINS-1:0]    SO ,

 	input  wire                  REF_CLK ,
 	input  wire                  RST ,
 	input  wire                  UART_CLK ,
        input  wire                  RX_IN ,
 	output wire                  TX_OUT ,
        output wire                  PARITY_ERROR,
        output wire                  STOP_ERROR,
 	output wire                  BUSY
 );
 
 wire  [DATA_WIDTH-1:0]     RX_P_DATA ;
 wire                       RX_DATA_VALID ;
 wire  [DATA_WIDTH-1:0]     SYNC_RX_P_DATA ;
 wire                       SYNC_RX_DATA_VALID ;

 wire                       WR_EN ;
 wire                       RD_EN ;
 wire  [ADDRESS_WIDTH-1:0]  ADDRESS  ;
 wire  [DATA_WIDTH-1:0]     WR_DATA ;
 wire  [DATA_WIDTH-1:0]     RD_DATA ;
 wire                       RD_DATA_VALID ;           
 wire  [FUN_WIDTH-1:0]      FUN ;
 wire                       ALU_EN ;
 wire  [OUT_WIDTH-1:0 ]     ALU_OUT ;
 wire                       ALU_OUT_VALID ;
 wire                       FIFO_FULL ;
 wire  [DATA_WIDTH-1:0]     CTRL_OUT_DATA ;
 wire                       CTRL_OUT_VALID ;
 wire                       CLK_GATE_EN ;
 wire                       CLK_DIV_EN ;

 wire  [DATA_WIDTH-1:0]     UART_config ;
 wire  [DATA_WIDTH-1:0]     OP_A ;
 wire  [DATA_WIDTH-1:0]     OP_B ;

 wire  [DATA_WIDTH-1:0]     RX_DIV_RATIO ;
 wire  [DATA_WIDTH-1:0]     TX_DIV_RATIO ;

 wire                       REF_SYNC_RST ;
 wire                       UART_SYNC_RST ;
 wire                       ALU_CLK ; 
 wire                       TX_CLK ;
 wire                       RX_CLK ;

 wire                       FIFO_EMPTY ;
 wire                       RD_INC ;
 wire   [DATA_WIDTH-1:0]    TX_IN_DATA ;

wire                 		       REF_SCAN_CLK;
wire                                   UART_SCAN_CLK;
wire                                   UART_RX_SCAN_CLK;
wire                                   UART_TX_SCAN_CLK;

wire             		       RSTN_SCAN_RST;
wire              		       SYNC_REF_SCAN_RST;
wire              		       SYNC_UART_SCAN_RST;



//////////////////////// Clocks /////////////////////////////

// Mux primary REF_CLK & SCAN_CLK
mux2X1 U0_mux2X1 (
.IN_0(REF_CLK),
.IN_1(scan_clk),
.SEL(test_mode),
.OUT(REF_SCAN_CLK)
); 

// Mux primary UART_CLK & SCAN_CLK
mux2X1 U1_mux2X1 (
.IN_0(UART_CLK),
.IN_1(scan_clk),
.SEL(test_mode),
.OUT(UART_SCAN_CLK)
); 

// Mux generated UART_RX_CLK & SCAN_CLK
mux2X1 U2_mux2X1 (
.IN_0(RX_CLK),
.IN_1(scan_clk),
.SEL(test_mode),
.OUT(UART_RX_SCAN_CLK)
); 

// Mux generated UART_TX_CLK & SCAN_CLK
mux2X1 U3_mux2X1 (
.IN_0(TX_CLK),
.IN_1(scan_clk),
.SEL(test_mode),
.OUT(UART_TX_SCAN_CLK)
); 


//////////////////////// Resets /////////////////////////////

// Mux primary RST_N & scan_rst
mux2X1 U4_mux2X1 (
.IN_0(RST),
.IN_1(scan_rst),
.SEL(test_mode),
.OUT(RSTN_SCAN_RST)
); 

// Mux generated SYNC_REF_RST & scan_rst
mux2X1 U5_mux2X1 (
.IN_0(REF_SYNC_RST),
.IN_1(scan_rst),
.SEL(test_mode),
.OUT(SYNC_REF_SCAN_RST)
); 

// Mux generated SYNC_UART_RST & scan_rst
mux2X1 U6_mux2X1 (
.IN_0(UART_SYNC_RST),
.IN_1(scan_rst),
.SEL(test_mode),
.OUT(SYNC_UART_SCAN_RST)
); 


DATA_SYNC #(.BUS_WIDTH(DATA_WIDTH))
          DATA_SYNC (.CLK(REF_SCAN_CLK),
                     .RST(SYNC_REF_SCAN_RST),
                     .BUS_EN(RX_DATA_VALID),
                     .UN_SYNC_BUS(RX_P_DATA),
                     .EN_PULSE(SYNC_RX_DATA_VALID),
                     .SYNC_BUS(SYNC_RX_P_DATA)
                    );
 
 
 SYS_CTRL #(.DATA_WIDTH(DATA_WIDTH),.ADDRESS_WIDTH(ADDRESS_WIDTH),.FUN_WIDTH(FUN_WIDTH),.ALU_OUT_WIDTH(OUT_WIDTH))
          SYS_CTRL (.CLK(REF_SCAN_CLK),
 	              .RST(SYNC_REF_SCAN_RST),
 	              .RX_P_DATA(SYNC_RX_P_DATA),
 	              .RX_DATA_VALID(SYNC_RX_DATA_VALID),
 	              .RD_DATA(RD_DATA),
 	              .RD_DATA_VALID(RD_DATA_VALID),
 	              .ALU_OUT(ALU_OUT),
 	              .ALU_OUT_VALID(ALU_OUT_VALID),
 	              .FIFO_FULL(FIFO_FULL),
 	              .ALU_FUN(FUN),
 	              .ALU_EN(ALU_EN),
 	              .CLK_GATE_EN(CLK_GATE_EN),
 	              .ADDRESS(ADDRESS),
 	              .WR_EN(WR_EN),
 	              .RD_EN(RD_EN),
 	              .WR_DATA(WR_DATA),
 	              .TX_P_Data(CTRL_OUT_DATA),
 	              .TX_DATA_VALID(CTRL_OUT_VALID),
 	              .CLK_DIV_EN(CLK_DIV_EN)
 	              );


 RST_SYNC #(.NUM_STAGES(2))
          RST_SYNC_1 (.CLK(REF_SCAN_CLK),
 	              .RST(RSTN_SCAN_RST),
 	              .SYNC_RST(REF_SYNC_RST)
 	              );

 RST_SYNC #(.NUM_STAGES(2))
          RST_SYNC_2 (.CLK(UART_SCAN_CLK),
 	              .RST(RSTN_SCAN_RST),
 	              .SYNC_RST(UART_SYNC_RST)
 	              );

 Reg_File  #(.DATA_WIDTH(DATA_WIDTH),.ADDRESS_WIDTH(ADDRESS_WIDTH),.DEPTH(16))
          Reg_file (.CLK(REF_SCAN_CLK),
 	              .RST(SYNC_REF_SCAN_RST),
 	              .WR_DATA(WR_DATA),
 	              .ADDRESS(ADDRESS),
 	              .WR_EN(WR_EN),
 	              .RD_EN(RD_EN) ,
 	              .RD_DATA(RD_DATA),
 	              .RD_DATA_VALID(RD_DATA_VALID),
 	              .REG_0(OP_A),
 	              .REG_1(OP_B),
 	              .REG_2(UART_config),
 	              .REG_3(TX_DIV_RATIO)
 	              );

CLK_GATE CLK_GATE (.CLK(REF_SCAN_CLK),
 	            .CLK_EN(CLK_GATE_EN || test_mode),
 	            .GATED_CLK(ALU_CLK)
 	           );

 ALU #(.OPERAND_WIDTH(DATA_WIDTH),.FUN_WIDTH(FUN_WIDTH))
     ALU (.CLK(ALU_CLK),
 	      .RST(SYNC_REF_SCAN_RST),
 	      .A(OP_A),
 	      .B(OP_B),
 	      .ALU_FUN(FUN),
 	      .ALU_EN(ALU_EN),
 	      .ALU_OUT(ALU_OUT),
 	      .OUT_VALID(ALU_OUT_VALID)
 	     );


 CLK_DIV_MUX CLK_DIV_MUX (.IN(UART_config[7:2]),
 	                  .OUT(RX_DIV_RATIO)
 	                 );

 Clk_Div #(.WIDTH(DATA_WIDTH))
         CLK_DIV_1 (.i_ref_clk(UART_SCAN_CLK),
 	              .i_rst_n(SYNC_UART_SCAN_RST),
 	              .i_clk_en(CLK_DIV_EN),
 	              .i_div_ratio(RX_DIV_RATIO),
 	              .o_div_clk(RX_CLK)
 	              );

 Clk_Div #(.WIDTH(DATA_WIDTH))
         CLK_DIV_2 (.i_ref_clk(UART_SCAN_CLK),
 	              .i_rst_n(SYNC_UART_SCAN_RST),
 	              .i_clk_en(CLK_DIV_EN),
 	              .i_div_ratio(TX_DIV_RATIO),
 	              .o_div_clk(TX_CLK)
 	              );

 FIFO  #(.DATA_WIDTH(DATA_WIDTH),.ADDRESS_WIDTH(ADDRESS_WIDTH))
      FIFO (.WR_DATA(CTRL_OUT_DATA),
 	      .W_INC(CTRL_OUT_VALID),
 	      .R_INC(RD_INC),
 	      .W_CLK(REF_SCAN_CLK),
 	      .R_CLK(UART_TX_SCAN_CLK),
 	      .W_RST(SYNC_REF_SCAN_RST),
 	      .R_RST(SYNC_UART_SCAN_RST),
 	      .FULL(FIFO_FULL),
 	      .EMPTY(FIFO_EMPTY),
 	      .RD_DATA(TX_IN_DATA)
 	      );

 PULSE_GEN PULSE_GEN (.CLK(UART_TX_SCAN_CLK),
 	              .RST(SYNC_UART_SCAN_RST),
 	              .LVL_SIG(BUSY),
 	              .PULSE_SIG(RD_INC)
 	              );

 UART_RX UART_RX (.clk(UART_RX_SCAN_CLK),
 	          .rst(SYNC_UART_SCAN_RST),
 	          .rx_in(RX_IN),
 	          .par_en(UART_config[0]),
 	          .par_typ(UART_config[1]),
 	          .prescale(UART_config[7:2]),
 	          .data_valid(RX_DATA_VALID),
 	          .par_error(PARITY_ERROR),
 	          .stp_error(STOP_ERROR),
 	          .p_data(RX_P_DATA)
 	          );

 UART_TX UART_TX (.CLK(UART_TX_SCAN_CLK),
 	          .RST(SYNC_UART_SCAN_RST),
 	          .P_DATA(TX_IN_DATA),
 	          .DATA_VALID(!FIFO_EMPTY),
 	          .PAR_EN(UART_config[0]),
 	          .PAR_TYP(UART_config[1]),
 	          .TX_OUT(TX_OUT),
 	          .BUSY(BUSY)
 	          );
 endmodule 


