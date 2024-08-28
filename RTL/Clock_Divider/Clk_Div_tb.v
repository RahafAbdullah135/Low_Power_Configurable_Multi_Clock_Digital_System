`timescale 1ns/100ps

module Clk_Div_tb ();

///////////////////// Parameters ////////////////////////

  parameter clk_period = 10 ;
 
 //////////////////// DUT Signals //////////////////////// 

  reg        i_ref_clk_tb ;
  reg        i_rst_n_tb ;
  reg        i_clk_en_tb ;
  reg  [7:0] i_div_ratio_tb ;
  wire       o_div_clk_tb;
  
  ////////////////// Clock Generator  ////////////////////

  always #(clk_period/2.0)  i_ref_clk_tb = ~i_ref_clk_tb ;

  /////////////////// DUT Instantation ///////////////////

  Clk_Div DUT (.i_ref_clk(i_ref_clk_tb),
               .i_rst_n(i_rst_n_tb),
               .i_clk_en(i_clk_en_tb),
               .i_div_ratio(i_div_ratio_tb),
               .o_div_clk(o_div_clk_tb)
              );

  /////////////// Signals Initialization //////////////////


 task initialize ();
  begin
     i_ref_clk_tb   = 1'b0 ;
     i_rst_n_tb     = 1'b1 ;
     i_clk_en_tb    = 1'b0 ;  
     i_div_ratio_tb = 8'b0 ;
  end
 endtask

 ///////////////////////// RESET /////////////////////////

 task reset ();
  begin
     i_rst_n_tb =  1'b1 ;
     #(clk_period)
     i_rst_n_tb  = 1'b0 ;
     #(clk_period)
     i_rst_n_tb  = 1'b1 ;
  end
 endtask

 ////////////////// initial block ///////////////////////

    initial 
     begin
     $dumpfile("Clk_Div.vcd") ;       
     $dumpvars;

     initialize() ;

     reset() ;

     i_clk_en_tb     = 1'b1 ;
     i_div_ratio_tb  = 8'b0010 ;

     #(100*clk_period) ;

     i_clk_en_tb     = 1'b1 ;
     i_div_ratio_tb  = 8'b0011 ;

     #(100*clk_period) ;

     i_clk_en_tb     = 1'b1 ;
     i_div_ratio_tb  = 8'b0100 ;

     #(100*clk_period) ;

     i_clk_en_tb     = 1'b1 ;
     i_div_ratio_tb  = 8'b0101 ;

     #(100*clk_period) ;

     i_clk_en_tb     = 1'b1 ;
     i_div_ratio_tb  = 8'b0110 ;

     #(100*clk_period) ;

     i_clk_en_tb     = 1'b1 ;
     i_div_ratio_tb  = 8'b0111 ;

     #(100*clk_period) ;

     i_clk_en_tb     = 1'b1 ;
     i_div_ratio_tb  = 8'b1000 ;

     #(100*clk_period) ;


     $stop;

     end

     


 endmodule