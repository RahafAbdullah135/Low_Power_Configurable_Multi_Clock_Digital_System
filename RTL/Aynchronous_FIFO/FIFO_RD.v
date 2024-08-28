
// ************************* Description *********************** //
//  This module is implemented to:-                              //
//   -- generate read address in binary code                     //
//   -- generate empty flag to overcome fifo underflow           //
//   -- generate gray coded read pointer                         //
// ************************************************************* //

module FIFO_RD 
 #( 
   parameter DATA_WIDTH = 8 ,                      // data size
   parameter ADDRESS_WIDTH = 3                     // address size 
  )
 (
 	input  wire                      R_INC ,         // read control signal 
 	input  wire                      R_CLK ,         // read domian operating clock
 	input  wire                      R_RST ,         // read domian active low reset 
 	input  wire  [ADDRESS_WIDTH:0]   SYNC_WR_PTR ,   // synced gray coded write pointer
 	output reg   [ADDRESS_WIDTH-1:0] RD_ADDR ,       // generated binary read address
 	output reg   [ADDRESS_WIDTH:0]   RD_PTR ,        // generated gray coded write address
 	output wire                      EMPTY           // fifo empty flag
 );
 
 reg [ADDRESS_WIDTH:0] RD_PTR_binary ;

// increment binary pointer
 always @(posedge R_CLK or negedge R_RST) 
 begin
 	if (!R_RST) 
	 	begin
	 		RD_ADDR        <= 'b0 ;
	 		RD_PTR_binary  <= 'b0 ;
	 	end
 	else if ((R_INC == 1'b1) && (EMPTY == 'b0)) 
	 	begin
	 		RD_ADDR        <= RD_ADDR + 1'b1 ;
	 		RD_PTR_binary  <= RD_PTR_binary + 1'b1 ;
	 	end
	else 
		begin
			RD_ADDR        <= RD_ADDR ;
			RD_PTR_binary  <= RD_PTR_binary ;
		end
 end

// generation of empty flag
assign EMPTY = (RD_PTR == SYNC_WR_PTR)? 1:0 ;

// converting binary read pointer to gray coded
 always @(posedge R_CLK or negedge R_RST) 
 begin
 	if (!R_RST) 
	 	begin
	 		RD_PTR  = 'b0 ;
	 	end
 	else  
	 	begin
	 		case( RD_PTR_binary)
	 		'd0  : RD_PTR = 'b0000 ;
	 		'd1  : RD_PTR = 'b0001 ;
	 		'd2  : RD_PTR = 'b0011 ;
	 		'd3  : RD_PTR = 'b0010 ;
	 		'd4  : RD_PTR = 'b0110 ;
	 		'd5  : RD_PTR = 'b0111 ;
	 		'd6  : RD_PTR = 'b0101 ;
	 		'd7  : RD_PTR = 'b0100 ;
	 		'd8  : RD_PTR = 'b1100 ;
	 		'd9  : RD_PTR = 'b1101 ;
	 		'd10 : RD_PTR = 'b1111 ;
	 		'd11 : RD_PTR = 'b1110 ;
	 		'd12 : RD_PTR = 'b1010 ;
	 		'd13 : RD_PTR = 'b1011 ;
	 		'd14 : RD_PTR = 'b1001 ;
	 		'd15 : RD_PTR = 'b1000 ;
	 		endcase
	 	end
 end

 endmodule

 
