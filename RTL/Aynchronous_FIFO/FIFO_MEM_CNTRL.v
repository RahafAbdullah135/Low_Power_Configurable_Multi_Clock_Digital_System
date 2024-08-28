module FIFO_MEM_CNTRL 
 #( 
   parameter DATA_WIDTH = 8 ,                  // data size
   parameter ADDRESS_WIDTH = 3                 // address size 
  )
 (
   input  wire [DATA_WIDTH-1:0]    WR_DATA ,   // write data bus
   input  wire [ADDRESS_WIDTH-1:0] WR_ADDR,    // write address bus
   input  wire [ADDRESS_WIDTH-1:0] RD_ADDR,    // synchronized read pointer bus
   input  wire                     W_INC ,     // write control signal
   input  wire                     R_INC ,     // read control signal
   input  wire                     W_CLK ,     // write domian operating clock
   input  wire                     R_CLK ,     // read domian operating clock
   input  wire                     FULL ,      // fifo buffer full flag
   output wire  [DATA_WIDTH-1:0]    RD_DATA    // read data bus
 );

 wire W_CLK_EN ;

//FIFO Memory
 reg [DATA_WIDTH-1:0] MEM [7:0] ;

 assign W_CLK_EN = (W_INC && !FULL) ;

// writing data
always @(posedge W_CLK) 
 begin
 	if ((W_CLK_EN == 1'b1) && (W_INC == 1'b1)) 
	 	begin
	 		MEM[WR_ADDR] <= WR_DATA ;	
	 	end
 end

// reading domain
 assign RD_DATA = MEM[RD_ADDR] ;

 
endmodule 