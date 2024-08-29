`timescale 1ns/10ps

module SYS_TOP_tb ();

 ///////////////////// Parameters ////////////////////////

	parameter DATA_WIDTH_tb = 8 ;
	parameter ADDRESS_WIDTH_tb = 4 ;
	parameter FUN_WIDTH_tb = 4 ;
	parameter OUT_WIDTH_tb = DATA_WIDTH_tb*2 ;

	parameter REF_clk_period = 20.0 ;
	parameter UART_clk_period = 271.27 ;

 //////////////////// DUT Signals //////////////////////// 

 	 reg                       REF_CLK_tb ;
 	 reg                       RST_tb ;
 	 reg                       UART_CLK_tb ;
 	 reg                       RX_IN_tb ;
 	 //reg   [DATA_WIDTH_tb+2:0] RX_IN_tb ;
 	 //wire  [OUT_WIDTH_tb-1:0 ] TX_OUT_tb ;
 	 wire                      TX_OUT_tb ;
     wire                      PARITY_ERROR_tb ;
     wire                      STOP_ERROR_tb ;
 	 wire                      BUSY_tb ;

 ////////////////// Clock Generator  ////////////////////

  always #(REF_clk_period/2.0)   REF_CLK_tb  = ~REF_CLK_tb ;
  always #(UART_clk_period/2.0)  UART_CLK_tb = ~UART_CLK_tb ;

 /////////////////// DUT Instantation ///////////////////

 SYS_TOP #(.DATA_WIDTH(DATA_WIDTH_tb),.ADDRESS_WIDTH(ADDRESS_WIDTH_tb),.FUN_WIDTH(FUN_WIDTH_tb),.OUT_WIDTH(OUT_WIDTH_tb))
         SYS_TOP (.REF_CLK(REF_CLK_tb),
         	      .RST(RST_tb),
         	      .UART_CLK(UART_CLK_tb),
         	      .RX_IN(RX_IN_tb),
         	      .TX_OUT(TX_OUT_tb),
                  .PARITY_ERROR(PARITY_ERROR_tb),
                  .STOP_ERROR(STOP_ERROR_tb),
         	      .BUSY(BUSY_tb)
         	      );

 /////////////// Signals Initialization //////////////////

 task initialize ();
 begin
     REF_CLK_tb  = 1'b0 ;
     RST_tb      = 1'b1 ;
     UART_CLK_tb = 1'b0 ;  
     RX_IN_tb    = 1'b0 ; 
 end
 endtask

 ///////////////////////// RESET /////////////////////////

 task reset ();
  begin
     RST_tb =  1'b1 ;
     #(REF_clk_period)
     RST_tb  = 1'b0 ;
     #(REF_clk_period)
     RST_tb  = 1'b1 ;
  end
 endtask

  /////////////////////// input data with parity ///////////////////////

 task DATA_IN (
      input [10:0] tx_data
     ); 
     integer i ;
     begin
        for(i=10; i>=0; i=i-1)
           begin
              RX_IN_tb = tx_data[i] ;
              //#(32*UART_clk_period);
              #((SYS_TOP.Reg_file.REG_2[7:2])*UART_clk_period);
           end      
     end
 endtask

 /////////////////// check out with parity ///////////////////////////

 task CHECK_OUT_WITH_PARITY (
     input [DATA_WIDTH_tb+2:0] expect_out 
  );

     integer j ;
     reg  [DATA_WIDTH_tb+2:0] generated_out ;

     begin
       for (j=(DATA_WIDTH_tb+2); j>=0; j=j-1)
             begin 
                  generated_out[j] = TX_OUT_tb ;
                  //#(32*UART_clk_period);
                  #((SYS_TOP.Reg_file.REG_3)*UART_clk_period);
             end
         if(generated_out == expect_out) 
             begin
                 $display("Test Case is succeeded");
             end
         else
             begin
                 $display("Test Case is failed");
             end
     end
endtask

 ////////////////// initial block ///////////////////////

    initial 
     begin
     $dumpfile("SYS_TOP.vcd") ;       
     $dumpvars;

     initialize() ;

     reset() ;

     /////////////////// Writing data ///////////////////

     DATA_IN('b0_01010101_01) ;
     DATA_IN('b0_01010000_01) ;
     DATA_IN('b0_00110111_11) ;

     #(UART_clk_period);

     DATA_IN('b0_01010101_01) ;
     DATA_IN('b0_01110000_11) ;
     DATA_IN('b0_00110110_01) ;

     #(UART_clk_period);

     /////////////////// Reading data ///////////////////

     DATA_IN('b0_11011101_01) ;
     DATA_IN('b0_01010000_01) ;

     @(BUSY_tb) @(negedge UART_CLK_tb) CHECK_OUT_WITH_PARITY('b0_11101100_11) ;

     #(UART_clk_period);

     DATA_IN('b0_11011101_01) ;
     DATA_IN('b0_01110000_11) ;

     @(BUSY_tb) @(negedge UART_CLK_tb) CHECK_OUT_WITH_PARITY('b0_01101100_01) ;

     #(UART_clk_period);

     /////////////////// ALU OPERATION ///////////////////

     DATA_IN('b0_00110011_01) ;
     DATA_IN('b0_01101000_11) ;
     DATA_IN('b0_11110000_01) ;
     DATA_IN('b0_00000000_01) ;
     @(BUSY_tb) @(negedge UART_CLK_tb) CHECK_OUT_WITH_PARITY('b0_00100101_11) ;
     @(BUSY_tb) @(negedge UART_CLK_tb) CHECK_OUT_WITH_PARITY('b0_00000000_01) ;

     #(UART_clk_period);

     DATA_IN('b0_10111011_01) ;
     DATA_IN('b0_01000000_11) ;
     @(BUSY_tb) @(negedge UART_CLK_tb) CHECK_OUT_WITH_PARITY('b0_01001010_11) ;
     @(BUSY_tb) @(negedge UART_CLK_tb) CHECK_OUT_WITH_PARITY('b0_00000001_11) ;

     #(UART_clk_period);

     $stop; 

     end


endmodule
