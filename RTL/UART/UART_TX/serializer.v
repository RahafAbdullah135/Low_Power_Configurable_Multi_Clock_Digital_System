module serializer #( parameter WIDTH = 8)
 (
 input  wire               CLK,
 input  wire               RST,
 input  wire  [WIDTH-1:0]  P_DATA,
 input  wire               DATA_VALID,
 input  wire               SER_EN,
 output reg                SER_DATA,
 output wire               SER_DONE
 );

 reg [3:0] counter ;
 reg [7:0] REG ;

 always @(posedge CLK or negedge RST) 
     begin
  	      if (!RST) 
  	         begin
  	         SER_DATA <= 1'b0 ;
             counter  <= WIDTH ;
             REG      <= 'b0 ;
  	         end
          else if ((SER_EN) && (counter != 0 ))
             begin
                 SER_DATA <= REG[counter-1] ;
                 counter  <= counter - 1 ; 
  	         end
  	      else if (DATA_VALID)
  	         begin
                 counter <= WIDTH ; 
                 REG     <= P_DATA ;
  	         end
     end 

 assign SER_DONE = (counter==0)? 1:0  ;

 endmodule 