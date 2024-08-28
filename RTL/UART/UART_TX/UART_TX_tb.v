`timescale 1us/1ps

module UART_TX_tb ();

 ///////////////////// Parameters ////////////////////////

  parameter CLK_Period = 8.68 ;
  parameter WIDTH_tb   = 8 ;
 
 //////////////////// DUT Signals //////////////////////// 

  reg                  CLK_tb;
  reg                  RST_tb;
  reg  [WIDTH_tb-1:0]  P_DATA_tb;
  reg                  DATA_VALID_tb;
  reg                  PAR_EN_tb;
  reg                  PAR_TYP_tb;
  wire                 TX_OUT_tb;
  wire                 BUSY_tb;

  ////////////////// Clock Generator  ////////////////////

  always #(CLK_Period/2)  CLK_tb = ~CLK_tb ;


 /////////////////// DUT Instantation ///////////////////

 UART_TX #(.WIDTH(WIDTH_tb)) DUT (
              .CLK(CLK_tb),
              .RST(RST_tb),
              .P_DATA(P_DATA_tb),
              .DATA_VALID(DATA_VALID_tb),
              .PAR_EN(PAR_EN_tb),
              .PAR_TYP(PAR_TYP_tb),
              .TX_OUT(TX_OUT_tb),
              .BUSY(BUSY_tb)
 	        );

////////////////// initial block ///////////////////////

 initial 
     begin
     $dumpfile("UART_TX.vcd") ;       
     $dumpvars;

     initialize() ;

     reset() ;

     /////////////////////// check even parity ////////////////////////
     DATA_IN('b11001100,1,0,1) ;
     #CLK_Period
     DATA_VALID_tb = 1'b0 ;
     CHECK_OUT_WITH_PARITY('b01100110001) ;

     #CLK_Period
     reset() ;
      /////////////////////// check odd parity ////////////////////////
     DATA_IN('b11001100,1,1,1) ;
     #CLK_Period
     DATA_VALID_tb = 1'b0 ;
     CHECK_OUT_WITH_PARITY('b01100110011) ;

     #CLK_Period
     reset() ;

     /////////////////////// check no parity ////////////////////////
     DATA_IN('b11001100,1,1,0) ;
     #CLK_Period
     DATA_VALID_tb = 1'b0 ;
     CHECK_OUT_WITHOUT_PARITY('b0110011001) ;

     #CLK_Period
     reset() ;
      ///////////////////// check two valid data //////////////////////
     DATA_IN('b11100111,1,0,1) ;
     #CLK_Period
     DATA_VALID_tb = 1'b0 ;
     CHECK_OUT_WITH_PARITY('b01110011101) ;

     DATA_IN('b10101010,1,0,0) ;
     #CLK_Period
     DATA_VALID_tb = 1'b0 ;
     CHECK_OUT_WITHOUT_PARITY('b0101010101) ;

     #CLK_Period
     reset() ;
      ///////////////////// Check data valid during transmission //////////////////////
     DATA_IN('b11001100,1,1,1) ;
     #(CLK_Period)
     DATA_VALID_tb = 1'b0 ;
     CHECK_OUT_WITH_PARITY('b01100110011) ;

      #(CLK_Period);
      $stop;   

     end

/////////////// Signals Initialization //////////////////


task initialize ();
 begin
     P_DATA_tb      = 'b0 ;
     CLK_tb         = 1'b0 ;
     RST_tb         = 1'b0 ;
     DATA_VALID_tb  = 1'b0 ;  
     PAR_EN_tb      = 1'b0 ;
     PAR_TYP_tb     = 1'b0 ; 
 end
endtask

///////////////////////// RESET /////////////////////////

task reset ();
 begin
     RST_tb =  1'b1 ;
     #(CLK_Period)
     RST_tb  = 1'b0 ;
     #(CLK_Period)
     RST_tb  = 1'b1 ;
 end
endtask

/////////////////////// input data ///////////////////////

task DATA_IN (
      input [WIDTH_tb-1:0] P_DATA ,
      input                DATA_VALID,
      input                PAR_TYP ,
      input                PAR_EN 
	  );
     begin
        DATA_VALID_tb = DATA_VALID ;
     	P_DATA_tb     = P_DATA ;
        PAR_TYP_tb    = PAR_TYP ;
     	PAR_EN_tb     = PAR_EN ;
     	
     end
endtask
 

/////////////////// check out with parity ///////////////////////////

task CHECK_OUT_WITH_PARITY (
       input [WIDTH_tb+2:0] expect_out 
  );

     integer i ;
     reg   [WIDTH_tb+2:0] generated_out ;

     begin
       for (i=(WIDTH_tb+2); i>=0; i=i-1)
             begin 
                  generated_out[i] = TX_OUT_tb ;
                  if (i==5)
                    begin
                        DATA_VALID_tb = 1'b1 ;
                        P_DATA_tb = 'b11100111 ; 
                    end
                  #(CLK_Period) ;
                  DATA_VALID_tb = 1'b0;
             end
         if(generated_out == expect_out ) 
             begin
                 $display("Test Case is succeeded");
             end
         else
             begin
                 $display("Test Case is failed");
             end
     end
endtask

/////////////////// check out without parity ///////////////////////////

task CHECK_OUT_WITHOUT_PARITY (
       input [WIDTH_tb+1:0] expect_out 
     );

     integer i ;
     reg   [WIDTH_tb+1:0] generated_out ;

     begin
         for (i=(WIDTH_tb+1); i>=0; i=i-1)
             begin 
                  generated_out[i] = TX_OUT_tb ;
                  if (i==5)
                    begin
                        DATA_VALID_tb = 1'b1 ;
                        P_DATA_tb = 'b11100111 ; 
                    end
                  #(CLK_Period) ;
                  DATA_VALID_tb = 1'b0;
             end
         if(generated_out == expect_out ) 
             begin
                 $display("Test Case is succeeded");
             end
         else
             begin
                 $display("Test Case is failed");
             end
     end
endtask


endmodule 