
// ************************* Description *********************** //
//  This module is implemented to:-                              //
//   -- generate write address in binary code                    //
//   -- generate full flag to overcome fifo overwrite            //
//   -- generate gray coded write pointer                        //
// ************************************************************* //

module FIFO_WR
 #( 
   parameter DATA_WIDTH = 8 ,                       // data size
   parameter ADDRESS_WIDTH = 3                      // address size 
  )
 (
 	input  wire                      W_INC ,          // write control signal 
 	input  wire                      W_CLK ,          // write domian operating clock
 	input  wire                      W_RST ,          // write domian active low reset 
 	input  wire  [ADDRESS_WIDTH:0]   SYNC_RD_PTR ,    // synced gray coded read pointer
 	output reg   [ADDRESS_WIDTH-1:0] WR_ADDR ,        // generated binary write address
 	output reg   [ADDRESS_WIDTH:0]   WR_PTR ,         // generated gray coded write address [registered]
 	output wire                      FULL             // fifo full flag
 );
   
    reg [ADDRESS_WIDTH:0] WR_PTR_binary ;

// increment binary pointer
 always @(posedge W_CLK or negedge W_RST) 
 begin
 	if (!W_RST) 
	 	begin
	 		WR_ADDR        <= 'b0 ;
	 		WR_PTR_binary  <= 'b0 ;	
	 	end
 	else if ((W_INC == 1'b1) && (FULL == 1'b0)) 
	 	begin
	 		WR_ADDR        <= WR_ADDR + 1'b1 ;
	 		WR_PTR_binary  <= WR_PTR_binary + 1'b1 ;
	 	end
	else 
		begin
			WR_ADDR        <= WR_ADDR ;
			WR_PTR_binary  <= WR_PTR_binary ;
		end

 end

 wire condition1 ;
 wire condition2 ;
 wire condition3 ;
 
// generation of full flag
 assign condition1 = (WR_PTR[ADDRESS_WIDTH] != SYNC_RD_PTR[ADDRESS_WIDTH]) ;
 assign condition2 = (WR_PTR[ADDRESS_WIDTH-1] != SYNC_RD_PTR[ADDRESS_WIDTH-1]) ;
 assign condition3 = (WR_PTR[ADDRESS_WIDTH-2:0] == SYNC_RD_PTR[ADDRESS_WIDTH-2:0]) ;
 assign FULL = (condition1 && condition2 && condition3)? 1:0 ;


// converting binary write pointer to gray coded
 always @(posedge W_CLK or negedge W_RST) 
 begin
 	if (!W_RST) 
	 	begin
	 		WR_PTR  = 'b0 ;
	 	end
 	else  
	 	begin
	 		case( WR_PTR_binary)
	 		'd0  : WR_PTR = 'b0000 ;
	 		'd1  : WR_PTR = 'b0001 ;
	 		'd2  : WR_PTR = 'b0011 ;
	 		'd3  : WR_PTR = 'b0010 ;
	 		'd4  : WR_PTR = 'b0110 ;
	 		'd5  : WR_PTR = 'b0111 ;
	 		'd6  : WR_PTR = 'b0101 ;
	 		'd7  : WR_PTR = 'b0100 ;
	 		'd8  : WR_PTR = 'b1100 ;
	 		'd9  : WR_PTR = 'b1101 ;
	 		'd10 : WR_PTR = 'b1111 ;
	 		'd11 : WR_PTR = 'b1110 ;
	 		'd12 : WR_PTR = 'b1010 ;
	 		'd13 : WR_PTR = 'b1011 ;
	 		'd14 : WR_PTR = 'b1001 ;
	 		'd15 : WR_PTR = 'b1000 ;
	 		endcase
	 	end
 end

 endmodule

 
