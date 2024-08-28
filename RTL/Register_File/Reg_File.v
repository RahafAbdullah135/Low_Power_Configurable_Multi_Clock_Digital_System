module Reg_File 
 #(
    parameter DATA_WIDTH = 8 ,
    parameter DEPTH = 16 ,
    parameter ADDRESS_WIDTH = 4   
  )

 (
 	input  wire                       CLK,
 	input  wire                       RST,
    input  wire  [DATA_WIDTH-1:0]     WR_DATA,
    input  wire  [ADDRESS_WIDTH-1:0]  ADDRESS,
    input  wire                       WR_EN, 
    input  wire                       RD_EN,
    output reg   [DATA_WIDTH-1:0]     RD_DATA ,
    output reg                        RD_DATA_VALID,
    output wire  [DATA_WIDTH-1:0]     REG_0 ,
    output wire  [DATA_WIDTH-1:0]     REG_1 ,
    output wire  [DATA_WIDTH-1:0]     REG_2 ,
    output wire  [DATA_WIDTH-1:0]     REG_3 
 );

  reg [DATA_WIDTH-1:0] REG [DEPTH-1:0] ;

  integer i ;

 always @(posedge CLK or negedge RST) 
     begin
	     if (!RST)
	         begin
	         RD_DATA_VALID <= 'b0 ;
	         RD_DATA       <= 'b0 ;
                 for (i=0; i<DEPTH; i=i+1)
	                 begin
	                 	if (i==2) 
		                 	begin
		                 		REG[i] <= 'b100000_01 ; 
		                 	end
		                else if (i==3)
			                begin
			                	REG[i] <= 'b100000 ;
			                end
			            else 
			                begin
			                	REG[i] <= 'b0 ;
			                end
	              end
	         end
	     else if (WR_EN && (!RD_EN)) 
	         begin
		         REG[ADDRESS] <= WR_DATA ; 
	         end
	     else if (RD_EN && (!WR_EN)) 
	         begin
	     	     RD_DATA       <= REG[ADDRESS] ; 
	     	     RD_DATA_VALID <= 1'b1 ;
	         end
	     else 
		     begin
		     	  RD_DATA_VALID <= 1'b0 ;
		     end
     end

 assign REG_0 = REG[0] ;
 assign REG_1 = REG[1] ;
 assign REG_2 = REG[2] ;
 assign REG_3 = REG[3] ;

endmodule 