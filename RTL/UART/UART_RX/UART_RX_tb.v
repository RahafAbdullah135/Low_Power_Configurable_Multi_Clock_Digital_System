`timescale 1ns/100ps

module UART_RX_tb (); 

 ///////////////////// Parameters ////////////////////////

  parameter clk_period = 5.0 ;
 
 //////////////////// DUT Signals //////////////////////// 

 	reg        clk_tb ;
   reg        rst_tb ;
   reg        rx_in_tb ;
   reg        par_en_tb ;
   reg        par_typ_tb ;
   reg  [5:0] prescale_tb ;      
   wire       data_valid_tb ;
   wire       par_error_tb ;
   wire       stp_error_tb ;
   wire [7:0] p_data_tb ;

   ////////////////// Clock Generator  ////////////////////

  always #(clk_period/2.0)  clk_tb = ~clk_tb ;


 /////////////////// DUT Instantation ///////////////////
 
 UART_RX DUT (.clk(clk_tb),
              .rst(rst_tb),
              .rx_in(rx_in_tb),
              .par_en(par_en_tb),
              .par_typ(par_typ_tb),
              .prescale(prescale_tb),
              .data_valid(data_valid_tb),
              .par_error(par_error_tb),
              .stp_error(stp_error_tb),
              .p_data(p_data_tb)
             );

 /////////////// Signals Initialization //////////////////


 task initialize ();
 begin
     clk_tb      = 1'b0 ;
     rst_tb      = 1'b1 ;
     rx_in_tb    = 1'b1 ;  
     par_en_tb   = 1'b0 ;
     par_typ_tb  = 1'b0 ; 
     prescale_tb = 6'b0 ;
 end
 endtask

 ///////////////////////// RESET /////////////////////////

 task reset ();
  begin
     rst_tb =  1'b1 ;
     #(clk_period)
     rst_tb  = 1'b0 ;
     #(clk_period)
     rst_tb  = 1'b1 ;
  end
 endtask

 /////////////////////// input data with parity ///////////////////////

 task DATA_IN_WITH_PARITY (
      input [10:0] tx_data,
      input        par_en,
      input        par_typ ,
      input [5:0]  prescale 
     ); 
     integer i ;
     begin
        par_en_tb   = par_en ;
        par_typ_tb  = par_typ ;
        prescale_tb = prescale ;
        for(i=10; i>=0; i=i-1)
           begin
              rx_in_tb = tx_data[i] ;
              #((prescale_tb)*clk_period);
           end      
     end
 endtask

 /////////////////////// input data without parity ///////////////////////

 task DATA_IN_WITHOUT_PARITY (
      input [9:0]  tx_data,
      input        par_en,
      input        par_typ ,
      input [5:0]  prescale 
     ); 
     integer i ;
     begin
        par_en_tb   = par_en ;
        par_typ_tb  = par_typ ;
        prescale_tb = prescale ;
        for(i=9; i>=0; i=i-1)
           begin
              rx_in_tb = tx_data[i] ;
              #((prescale_tb)*clk_period);
           end      
     end
 endtask

 /////////////////// check out  ///////////////////////////

 task CHECK_OUT (
       input [7:0] expected_out ,
       input       data_valid ,
       output      par_error ,
       output      stp_error 
  );

     integer i ;
     reg   [7:0] generated_out ;

     begin
       for (i=7; i>=0; i=i-1)
             begin 
                  generated_out[i] = p_data_tb[i] ;
                 // #(clk_period);
             end

         par_error = par_error_tb ;
         stp_error = stp_error_tb ;

         if((generated_out == expected_out)&&(data_valid == data_valid_tb))
             begin
                 $display("Test Case is succeeded with rx data = %b , data valid = %b , parity error = %b , stop error = %b" ,generated_out,data_valid_tb,par_error_tb,stp_error_tb);
             end 
         else
             begin
                 $display("Test Case is failed with rx data = %b , data valid = %b , parity error = %b , stop error = %b" ,generated_out,data_valid_tb,par_error_tb,stp_error_tb);
             end
     end
 endtask


////////////////// initial block ///////////////////////
    
    reg parity_error ;
    reg stop_error ;

    initial 
     begin
     $dumpfile("UART_RX.vcd") ;       
     $dumpvars;

     initialize() ;

     reset() ;

   /////////////////////// check data with even parity and prescale 8 ////////////////////////
     
    DATA_IN_WITH_PARITY('b01100110001,1,0,'b001000);
    
    CHECK_OUT('b00110011,1,parity_error,stop_error) ;

    reset() ;

    /////////////////////// check data with even parity and prescale 16 ////////////////////////
     
    DATA_IN_WITH_PARITY('b01110110011,1,0,'b010000);

    CHECK_OUT('b00110111,1,parity_error,stop_error) ;

    reset() ;

    /////////////////////// check data with even parity and prescale 32 ////////////////////////
     
    DATA_IN_WITH_PARITY('b01101001111,1,0,'b100000);

    CHECK_OUT('b11001011,1,parity_error,stop_error) ;

    reset() ;

    /////////////////////// check data with no parity and prescale 8 ////////////////////////
     
    DATA_IN_WITHOUT_PARITY('b0110011001,0,0,'b001000);

    CHECK_OUT('b00110011,1,parity_error,stop_error) ;

    reset() ;

    /////////////////////// check data with no parity and prescale 16 ////////////////////////
     
    DATA_IN_WITHOUT_PARITY('b0111111111,0,0,'b010000);

    CHECK_OUT('b11111111,1,parity_error,stop_error) ;

    reset() ;

    /////////////////////// check data with no parity and prescale 32 ////////////////////////
     
    DATA_IN_WITHOUT_PARITY('b0100100101,0,1,'b100000);

    CHECK_OUT('b01001001,1,parity_error,stop_error) ;

    reset() ;

    /////////////////////// check data with odd parity and prescale 8 ////////////////////////

    DATA_IN_WITH_PARITY('b01100010001,1,1,'b001000);

    CHECK_OUT('b00100011,1,parity_error,stop_error) ;

    reset() ;

    /////////////////////// check data with odd parity and prescale 16 ////////////////////////

    DATA_IN_WITH_PARITY('b01110010011,1,1,'b010000);

    CHECK_OUT('b00100111,1,parity_error,stop_error) ;

    reset() ;

    /////////////////////// check data with odd parity and prescale 32 ////////////////////////

    DATA_IN_WITH_PARITY('b01010101011,1,1,'b100000);

    CHECK_OUT('b01010101,1,parity_error,stop_error) ;

    reset() ;

    /////////////////////// check two consequent frames with same parity ////////////////////////

    DATA_IN_WITH_PARITY('b00011110011,1,1,'b001000);

    CHECK_OUT('b00111100,1,parity_error,stop_error) ;

    DATA_IN_WITH_PARITY('b01100110001,1,0,'b001000);

    CHECK_OUT('b00110011,1,parity_error,stop_error) ;

    reset() ;

    #(clk_period);
    $stop; 

   end


endmodule 