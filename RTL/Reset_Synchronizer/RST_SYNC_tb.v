`timescale 1ns/100ps

module RST_SYNC_tb () ;

///////////////////// Parameters ////////////////////////

 parameter NUM_STAGES_tb = 4 ;
 parameter clk_period = 10.0 ;

//////////////////// DUT Signals //////////////////////// 

   reg     CLK_tb ;
   reg     RST_tb ;
   wire    SYNC_RST_tb ;
 
////////////////// Clock Generator  ////////////////////

  always #(clk_period/2.0)  CLK_tb = ~CLK_tb ; 

/////////////////// DUT Instantation ///////////////////
 
 RST_SYNC #(.NUM_STAGES(NUM_STAGES_tb))
           DUT (.CLK(CLK_tb),
               .RST(RST_tb),
               .SYNC_RST(SYNC_RST_tb)
              );

 /////////////// Signals Initialization //////////////////

 task initialize ();
 begin
     CLK_tb = 1'b0 ;
     RST_tb = 1'b1 ;  
 end
 endtask

 ////////////////// initial block ///////////////////////

    initial 
     begin
        $dumpfile("RST_SYNC.vcd") ;       
        $dumpvars;

        initialize() ;
        
        RST_tb = 1'b1 ;

        #(10*clk_period) ;

        RST_tb = 1'b0 ;

        #clk_period;

        RST_tb = 1'b1 ;

        #(10*clk_period) ;

        
        $stop; 

      end


endmodule 



