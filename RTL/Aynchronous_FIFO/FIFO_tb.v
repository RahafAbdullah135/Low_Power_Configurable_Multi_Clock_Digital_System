`timescale 1ns/100ps

module FIFO_tb () ;

///////////////////// Parameters ////////////////////////

 parameter DATA_WIDTH_tb    = 8 ;
 parameter ADDRESS_WIDTH_tb = 3 ;
 parameter W_clk_period     = 10.0 ;
 parameter R_clk_period     = 25.0 ;

//////////////////// DUT Signals //////////////////////// 

 	reg  [DATA_WIDTH_tb-1:0] WR_DATA_tb ;
   reg                      W_INC_tb ;
   reg                      R_INC_tb ;
 	reg                      W_CLK_tb ;
   reg                      W_RST_tb ;
   reg                      R_CLK_tb ;
   reg                      R_RST_tb ;
   wire                     FULL_tb ;
   wire                     EMPTY_tb ;
 	wire [DATA_WIDTH_tb-1:0] RD_DATA_tb ;

////////////////// Clock Generator  ////////////////////

  always #(W_clk_period/2.0)  W_CLK_tb = ~W_CLK_tb ; 

  always #(R_clk_period/2.0)  R_CLK_tb = ~R_CLK_tb ; 

/////////////////// DUT Instantation ///////////////////
 
 FIFO #(.DATA_WIDTH(DATA_WIDTH_tb),.ADDRESS_WIDTH(ADDRESS_WIDTH_tb)) 
       DUT (.WR_DATA(WR_DATA_tb),
            .W_INC(W_INC_tb),
            .R_INC(R_INC_tb),
            .W_CLK(W_CLK_tb),
            .W_RST(W_RST_tb),
            .R_CLK(R_CLK_tb),
            .R_RST(R_RST_tb),
            .FULL(FULL_tb),
            .EMPTY(EMPTY_tb),
            .RD_DATA(RD_DATA_tb)
           );

 /////////////// Signals Initialization //////////////////

 task initialize ();
 begin
     W_CLK_tb   = 1'b0 ;
     R_CLK_tb   = 1'b0 ;
     W_RST_tb   = 1'b1 ;  
     R_RST_tb   = 1'b1 ;
     W_INC_tb   = 1'b0 ;
     R_INC_tb   = 1'b0 ;
     WR_DATA_tb =  'b0 ;
 end
 endtask

 ///////////////////////// RESET /////////////////////////

 task W_reset ();
  begin
     W_RST_tb = 1'b1 ;
     #(W_clk_period)
     W_RST_tb = 1'b0 ;
     #(W_clk_period)
     W_RST_tb = 1'b1 ;
  end
 endtask

 task R_reset ();
  begin
     R_RST_tb = 1'b1 ;
     #(R_clk_period)
     R_RST_tb = 1'b0 ;
     #(R_clk_period)
     R_RST_tb = 1'b1 ;
  end
 endtask


 /////////////////////// input data ///////////////////////

 task DATA_IN (
      input [DATA_WIDTH_tb-1:0] WR_DATA ,
      input                     W_INC 
     ); 
     begin
        WR_DATA_tb = WR_DATA ;
        W_INC_tb   = W_INC ;  
     end
 endtask

////////////////// initial block ///////////////////////

    initial 
     begin
        $dumpfile("FIFO.vcd") ;       
        $dumpvars;

        initialize() ;

        W_reset() ;
        R_reset() ;

       //////////////// writing 8 times ////////////////

        @(negedge W_CLK_tb)
        WR_DATA_tb = 'b11000011 ;
        W_INC_tb   = 1'b1 ;

        #W_clk_period ;

        W_INC_tb = 1'b0 ;

        #W_clk_period ;

        @(negedge W_CLK_tb)
        WR_DATA_tb = 'b11111111 ;
        W_INC_tb   = 1'b1 ;

        #W_clk_period ;

        W_INC_tb = 1'b0 ;

        #W_clk_period ;

        @(negedge W_CLK_tb)
        WR_DATA_tb = 'b10101010 ;
        W_INC_tb   = 1'b1 ;

        #W_clk_period ;

        W_INC_tb = 1'b0 ;

        #W_clk_period ;

        @(negedge W_CLK_tb)
        WR_DATA_tb = 'b00111100 ;
        W_INC_tb   = 1'b1 ;

        #W_clk_period ;

        W_INC_tb = 1'b0 ;

        #W_clk_period ;

        @(negedge W_CLK_tb)
        WR_DATA_tb = 'b11000011 ;
        W_INC_tb   = 1'b1 ;

        #W_clk_period ;

        W_INC_tb = 1'b0 ;

        #W_clk_period ;

        @(negedge W_CLK_tb)
        WR_DATA_tb = 'b11111111 ;
        W_INC_tb   = 1'b1 ;

        #W_clk_period ;

        W_INC_tb = 1'b0 ;

        #W_clk_period ;

        @(negedge W_CLK_tb)
        WR_DATA_tb = 'b10101010 ;
        W_INC_tb   = 1'b1 ;

        #W_clk_period ;

        W_INC_tb = 1'b0 ;

        #W_clk_period ;

        @(negedge W_CLK_tb)
        WR_DATA_tb = 'b00111100 ;
        W_INC_tb   = 1'b1 ;

        #W_clk_period ;

        W_INC_tb = 1'b0 ;

        #(2*W_clk_period) ;

        //////////////// Reading 8 times ////////////////

         @(negedge R_CLK_tb)
         R_INC_tb = 1'b1;

         #(8*R_clk_period) ;

         @(negedge R_CLK_tb)
         R_INC_tb = 1'b0;

         #(2*R_clk_period) ;

         //////////////// writing 4 times ////////////////

        @(negedge W_CLK_tb)
        WR_DATA_tb = 'b11100111 ;
        W_INC_tb   = 1'b1 ;

        #W_clk_period ;

        W_INC_tb = 1'b0 ;

        #W_clk_period ;

        @(negedge W_CLK_tb)
        WR_DATA_tb = 'b10011001 ;
        W_INC_tb   = 1'b1 ;

        #W_clk_period ;

        W_INC_tb = 1'b0 ;

        #W_clk_period ;

        @(negedge W_CLK_tb)
        WR_DATA_tb = 'b11111111 ;
        W_INC_tb   = 1'b1 ;

        #W_clk_period ;

        W_INC_tb = 1'b0 ;

        #W_clk_period ;

        @(negedge W_CLK_tb)
        WR_DATA_tb = 'b10111101 ;
        W_INC_tb   = 1'b1 ;

        #W_clk_period ;

        W_INC_tb = 1'b0 ;

        #W_clk_period ;

        //////////////// Reading 2 time ////////////////

         @(negedge R_CLK_tb)
         R_INC_tb = 1'b1;

         #(2*R_clk_period) ;

         R_INC_tb = 1'b0;

         #(2*R_clk_period) ;


         $stop; 

      end


endmodule 

