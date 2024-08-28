`timescale 1ns/1ps

module ALU_tb () ;

 reg  [15:0]  A_tb , B_tb ;
 reg          CLK_tb ;
 reg  [3:0]   ALU_FUN_tb ;
 wire [15:0]  ALU_OUT_tb ;
 wire         Arith_flag_tb , Logic_flag_tb , CMP_flag_tb , Shift_flag_tb ; 

 always #5 CLK_tb = ~CLK_tb  ;

  ALU DUT1 (
  	 .A (A_tb),
     .B (B_tb),
     .CLK (CLK_tb),
     .ALU_FUN (ALU_FUN_tb),
     .ALU_OUT (ALU_OUT_tb),
     .Arith_flag (Arith_flag_tb),
     .Logic_flag (Logic_flag_tb),
     .CMP_flag (CMP_flag_tb),
     .Shift_flag (Shift_flag_tb)
     );


  initial 
     begin
     	 $dumpfile("ALU.vcd") ;
  	     $dumpvars ;
  	     //////////////////////////////////////////////////////////////////////////////////////////////////

  	     A_tb = 16'b0 ;
  	     B_tb = 16'b0 ;
  	     CLK_tb = 1'b0 ;
  	     ALU_FUN_tb = 4'b0 ;

  	     //////////////////////////////////////////////////////////////////////////////////////////////////

  	     $display ("TEST CASE 1") ;
  	     #10
         A_tb = 16'd6 ;  
         B_tb = 16'd8 ;
         ALU_FUN_tb = 4'b0000 ;
         #10
         if ((ALU_OUT_tb == 16'd14)&&(Arith_flag_tb==1))
         $display ("TEST CASE 1 is passed with ALU_OUT =  A+B = %0d at simulation time",ALU_OUT_tb,$time);
         else
         $display ("TEST CASE 1 is failed with ALU_OUT =  A+B = %0d at simulation time",ALU_OUT_tb,$time);

         //////////////////////////////////////////////////////////////////////////////////////////////////

         $display ("TEST CASE 2") ;
  	     #10
         A_tb = 16'd32 ;  
         B_tb = 16'd16 ;
         ALU_FUN_tb = 4'b0001 ;
         #10
         if ((ALU_OUT_tb == 16'd16)&&(Arith_flag_tb==1))
         $display ("TEST CASE 2 is passed with ALU_OUT = A-B =  %0d at simulation time",ALU_OUT_tb,$time);
         else
         $display ("TEST CASE 2 is failed with ALU_OUT = A-B = %0d at simulation time",ALU_OUT_tb,$time);

         ////////////////////////////////////////////////////////////////////////////////////////////////////////

         $display ("TEST CASE 3") ;
  	     #10
         A_tb = 16'd15 ;  
         B_tb = 16'd5 ;
         ALU_FUN_tb = 4'b0010 ;
         #10
         if ((ALU_OUT_tb == 16'd75)&&(Arith_flag_tb==1))
         $display ("TEST CASE 3 is passed with ALU_OUT = A*B =  %0d at simulation time",ALU_OUT_tb,$time);
         else
         $display ("TEST CASE 3 is failed with ALU_OUT = A*B = %0d at simulation time",ALU_OUT_tb,$time);

         ////////////////////////////////////////////////////////////////////////////////////////////////////////

         $display ("TEST CASE 4") ;
  	     #10
         A_tb = 16'd32 ;  
         B_tb = 16'd8 ;
         ALU_FUN_tb = 4'b0011 ;
         #10
         if ((ALU_OUT_tb == 16'd4)&&(Arith_flag_tb==1))
         $display ("TEST CASE 4 is passed with ALU_OUT = A/B =  %0d at simulation time",ALU_OUT_tb,$time);
         else
         $display ("TEST CASE 4 is failed with ALU_OUT = A/B = %0d at simulation time",ALU_OUT_tb,$time);

         ////////////////////////////////////////////////////////////////////////////////////////////////////////

         $display ("TEST CASE 5") ;
  	     #10
         A_tb = 16'd44 ;  
         B_tb = 16'd96 ;
         ALU_FUN_tb = 4'b0100 ;
         #10
         if ((ALU_OUT_tb == 16'd32)&&(Logic_flag_tb==1))
         $display ("TEST CASE 5 is passed with ALU_OUT = A&B =  %0d at simulation time",ALU_OUT_tb,$time);
         else
         $display ("TEST CASE 5 is failed with ALU_OUT = A&B = %0d at simulation time",ALU_OUT_tb,$time);

         ////////////////////////////////////////////////////////////////////////////////////////////////////////

         $display ("TEST CASE 6") ;
  	     #10
         A_tb = 16'd99 ;  
         B_tb = 16'd54 ;
         ALU_FUN_tb = 4'b0101 ;
         #10
         if ((ALU_OUT_tb == 16'd119)&&(Logic_flag_tb==1))
         $display ("TEST CASE 6 is passed with ALU_OUT = A|B =  %0d at simulation time",ALU_OUT_tb,$time);
         else
         $display ("TEST CASE 6 is failed with ALU_OUT = A|B = %0d at simulation time",ALU_OUT_tb,$time);

         ////////////////////////////////////////////////////////////////////////////////////////////////////

         $display ("TEST CASE 7") ;
  	     #10
         A_tb = 16'd44 ;  
         B_tb = 16'd96 ;
         ALU_FUN_tb = 4'b0110 ;
         #10
         if ((ALU_OUT_tb == 16'b1111_1111_1101_1111)&&(Logic_flag_tb==1))
         $display ("TEST CASE 7 is passed with ALU_OUT = ~(A&B) =  %0d at simulation time",ALU_OUT_tb,$time);
         else
         $display ("TEST CASE 7 is failed with ALU_OUT = ~(A&B) = %0d at simulation time",ALU_OUT_tb,$time);

         ////////////////////////////////////////////////////////////////////////////////////////////////////

         $display ("TEST CASE 8") ;
  	     #10
         A_tb = 16'd99 ;  
         B_tb = 16'd54 ;
         ALU_FUN_tb = 4'b0111 ;
         #10
         if ((ALU_OUT_tb == 16'b1111_1111_1000_1000)&&(Logic_flag_tb==1))
         $display ("TEST CASE 8 is passed with ALU_OUT = ~(A|B) =  %0d at simulation time",ALU_OUT_tb,$time);
         else
         $display ("TEST CASE 8 is failed with ALU_OUT = ~(A|B) = %0d at simulation time",ALU_OUT_tb,$time);

         ////////////////////////////////////////////////////////////////////////////////////////////////////

         $display ("TEST CASE 9") ;
  	     #10
         A_tb = 16'd99 ;  
         B_tb = 16'd54 ;
         ALU_FUN_tb = 4'b1000 ;
         #10
         if ((ALU_OUT_tb == 16'd85)&&(Logic_flag_tb==1))
         $display ("TEST CASE 9 is passed with ALU_OUT = A^B =  %0d at simulation time",ALU_OUT_tb,$time);
         else
         $display ("TEST CASE 9 is failed with ALU_OUT = A^B = %0d at simulation time",ALU_OUT_tb,$time);

         ////////////////////////////////////////////////////////////////////////////////////////////////////

         $display ("TEST CASE 10") ;
  	     #10
         A_tb = 16'd99 ;  
         B_tb = 16'd54 ;
         ALU_FUN_tb = 4'b1001 ;
         #10
         if ((ALU_OUT_tb == 16'b1111_1111_1010_1010)&&(Logic_flag_tb==1))
         $display ("TEST CASE 10 is passed with ALU_OUT = ~(A^B) =  %0d at simulation time",ALU_OUT_tb,$time);
         else
         $display ("TEST CASE 10 is failed with ALU_OUT = ~(A^B) = %0d at simulation time",ALU_OUT_tb,$time);

         /////////////////////////////////////////////////////////////////////////////////////////////////////

         $display ("TEST CASE 11") ;
  	     #10
         A_tb = 16'd90 ;  
         B_tb = 16'd90 ;
         ALU_FUN_tb = 4'b1010 ;
         #10
         if ((ALU_OUT_tb == 16'd1)&&(CMP_flag_tb==1))
         $display ("TEST CASE 11 is passed with ALU_OUT = (A=B)? =  %0d at simulation time",ALU_OUT_tb,$time);
         else
         $display ("TEST CASE 11 is failed with ALU_OUT = (A=B)? = %0d at simulation time",ALU_OUT_tb,$time);
         //////////////////////////////////////////////////////////////////////////////////////////////////////

         $display ("TEST CASE 12") ;
  	     #10
         A_tb = 16'd80 ;  
         B_tb = 16'd90 ;
         ALU_FUN_tb = 4'b1011 ;
         #10
         if ((ALU_OUT_tb == 16'd0)&&(CMP_flag_tb==1))
         $display ("TEST CASE 12 is passed with ALU_OUT = (A>B)? =  %0d at simulation time",ALU_OUT_tb,$time);
         else
         $display ("TEST CASE 12 is failed with ALU_OUT = (A>B)? = %0d at simulation time",ALU_OUT_tb,$time);

         //////////////////////////////////////////////////////////////////////////////////////////////////////

         $display ("TEST CASE 13") ;
  	     #10
         A_tb = 16'd80 ;  
         B_tb = 16'd90 ;
         ALU_FUN_tb = 4'b1100 ;
         #10
         if ((ALU_OUT_tb == 16'd3)&&(CMP_flag_tb==1))
         $display ("TEST CASE 13 is passed with ALU_OUT = (A<B)? =  %0d at simulation time",ALU_OUT_tb,$time);
         else
         $display ("TEST CASE 13 is failed with ALU_OUT = (A<B)? = %0d at simulation time",ALU_OUT_tb,$time);

         //////////////////////////////////////////////////////////////////////////////////////////////////////

         $display ("TEST CASE 14") ;
  	     #10
         A_tb = 16'd88 ;  
         B_tb = 16'd0 ;
         ALU_FUN_tb = 4'b1101 ;
         #10
         if ((ALU_OUT_tb == 16'b0000_0000_0010_1100 )&&(Shift_flag_tb==1))
         $display ("TEST CASE 14 is passed with ALU_OUT = A>>1 =  %0d at simulation time",ALU_OUT_tb,$time);
         else
         $display ("TEST CASE 14 is failed with ALU_OUT = A>>1 = %0d at simulation time",ALU_OUT_tb,$time);

         //////////////////////////////////////////////////////////////////////////////////////////////////////

         $display ("TEST CASE 15") ;
  	     #10
         A_tb = 16'd88 ; 
         B_tb = 16'd0 ;
         ALU_FUN_tb = 4'b1110 ;
         #10
         if ((ALU_OUT_tb == 16'b0000_0000_1011_0000 )&&(Shift_flag_tb==1))
         $display ("TEST CASE 15 is passed with ALU_OUT = A<<1 =  %0d at simulation time",ALU_OUT_tb,$time);
         else
         $display ("TEST CASE 15 is failed with ALU_OUT = A<<1 = %0d at simulation time",ALU_OUT_tb,$time);

         /////////////////////////////////////////////////////////////////////////////////////////////////////

         $display ("TEST CASE 16") ;
  	     #10
         A_tb = 16'd88 ; 
         B_tb = 16'd99 ;
         ALU_FUN_tb = 4'b1111 ;
         #10
         if (ALU_OUT_tb == 16'b0 )
         $display ("TEST CASE 16 is passed with ALU_OUT =  %0d at simulation time",ALU_OUT_tb,$time);
         else
         $display ("TEST CASE 16 is failed with ALU_OUT = %0d at simulation time",ALU_OUT_tb,$time);

         /////////////////////////////////////////////////////////////////////////////////////////////////////

         #20
         $stop;

    end
    
endmodule 







