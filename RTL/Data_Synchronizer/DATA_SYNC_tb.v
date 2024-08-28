`timescale 1ns/100ps

module DATA_SYNC_tb (); 

 ///////////////////// Parameters ////////////////////////

  parameter clk_period = 10.0 ;
  parameter NUM_STAGES_tb = 2 ;
  parameter BUS_WIDTH_tb = 8 ;

  //////////////////// DUT Signals //////////////////////// 

    reg                     CLK_tb ;
    reg                     RST_tb ;
    reg                     BUS_EN_tb ;
    reg  [BUS_WIDTH_tb-1:0] UN_SYNC_BUS_tb ;
    wire                    EN_PULSE_tb ;
    wire [BUS_WIDTH_tb-1:0] SYNC_BUS_tb ;

   ////////////////// Clock Generator  ////////////////////

  always #(clk_period/2.0)  CLK_tb = ~CLK_tb ;

  /////////////////// DUT Instantation ///////////////////
 
 DATA_SYNC #(.NUM_STAGES(NUM_STAGES_tb),.BUS_WIDTH(BUS_WIDTH_tb)) 
            DUT (.CLK(CLK_tb),
                .RST(RST_tb),
                .BUS_EN(BUS_EN_tb),
                .UN_SYNC_BUS(UN_SYNC_BUS_tb),
                .EN_PULSE(EN_PULSE_tb),
                .SYNC_BUS(SYNC_BUS_tb)
               );

 /////////////// Signals Initialization //////////////////


 task initialize ();
 begin
     CLK_tb         = 1'b0 ;
     RST_tb         = 1'b1 ;
     BUS_EN_tb      = 1'b0 ;  
     UN_SYNC_BUS_tb =  'b0 ;
 end
 endtask

 ///////////////////////// RESET /////////////////////////

 task reset ();
  begin
     RST_tb =  1'b1 ;
     #(clk_period)
     RST_tb  = 1'b0 ;
     #(clk_period)
     RST_tb  = 1'b1 ;
  end
 endtask

/////////////////// check out  ///////////////////////////

 task CHECK_OUT (
       input [BUS_WIDTH_tb-1:0] expected_out 
  );

     integer i ;
     reg   [BUS_WIDTH_tb-1:0] generated_out ;

     begin
        
         generated_out = SYNC_BUS_tb ;



         if((generated_out == expected_out)&&(EN_PULSE_tb == 1'b1))
             begin
                 $display("Test Case is succeeded with SYNC_BUS = %b , EN_PULSE = %b " ,generated_out,EN_PULSE_tb);
             end 
         else
             begin
                 $display("Test Case is failed with SYNC_BUS = %b , EN_PULSE = %b " ,generated_out,EN_PULSE_tb);
             end
     end
 endtask

 ////////////////// initial block ///////////////////////


    initial 
     begin
     $dumpfile("DATA_SYNC.vcd") ;       
     $dumpvars;

     initialize() ;

     reset() ;

   /////////////////////// check data with even parity and prescale 8 ////////////////////////
     
    UN_SYNC_BUS_tb = 'b11000011 ;

    BUS_EN_tb      = 1'b1 ;

    #clk_period ;
    BUS_EN_tb = 1'b0 ;

    #((NUM_STAGES_tb+1)*clk_period) ;

    CHECK_OUT('b11000011) ; 

    #clk_period ;

    UN_SYNC_BUS_tb = 'b11111111 ;

    BUS_EN_tb      = 1'b1;

    #clk_period ;
    BUS_EN_tb = 1'b0 ;

    #((NUM_STAGES_tb+1)*clk_period) ;

    CHECK_OUT('b11111111) ; 

    #clk_period ;

    UN_SYNC_BUS_tb = 'b10101010 ;

    BUS_EN_tb      = 1'b1;

    #clk_period ;
    BUS_EN_tb = 1'b0 ;

    #((NUM_STAGES_tb+1)*clk_period) ;

    CHECK_OUT('b10101010 ) ; 
    
    #((NUM_STAGES_tb+1)*clk_period) ;
    
    reset() ;


    #(clk_period);
    $stop; 

   end


endmodule 
