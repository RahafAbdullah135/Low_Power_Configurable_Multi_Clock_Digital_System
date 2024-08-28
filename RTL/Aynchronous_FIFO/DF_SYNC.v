
/////////////////////////////////////////////////////////////
///////////////////// bit synchronizer //////////////////////
/////////////////////////////////////////////////////////////

module DF_SYNC 
 # (
 	 parameter STAGES = 2 ,
    parameter ADDRESS_WIDTH = 3 
   )

 (
 	input  wire                       CLK ,
 	input  wire                       RST ,
 	input  wire  [ADDRESS_WIDTH:0]    ASYNC ,
   output reg  [ADDRESS_WIDTH:0]    SYNC
 );

 reg [ADDRESS_WIDTH-1:0]  REG ;

 always @(posedge CLK or negedge RST) 
 begin
 	if (!RST) 
	 	begin
	 		REG  <= 'b0 ;
	 		SYNC <= 'b0 ;
	 	end
 	else 
	 	begin
	 		REG  <= ASYNC ;
	 		SYNC <= REG ;
	 	end
 end
 
 endmodule