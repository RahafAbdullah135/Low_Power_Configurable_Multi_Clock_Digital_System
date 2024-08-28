
module FIFO
 #( 
   parameter DATA_WIDTH = 8 ,               // data size
   parameter ADDRESS_WIDTH = 3              // address size 
  )
 (
   input  wire [DATA_WIDTH-1:0] WR_DATA ,   // write data bus
   input  wire                  W_INC ,     // write control signal 
   input  wire                  R_INC ,     // read control signal
   input  wire                  W_CLK ,     // write domian operating clock
   input  wire                  W_RST ,     // write domian active low reset  
   input  wire                  R_CLK ,     // read domian operating clock
   input  wire                  R_RST ,     // read domian active low reset
   output wire                  FULL ,      // fifo full flag
   output wire                  EMPTY ,     // fifo empty flag
   output wire [DATA_WIDTH-1:0] RD_DATA     // read data bus
 );

 wire [ADDRESS_WIDTH-1:0] WR_ADDR ;
 wire [ADDRESS_WIDTH-1:0] RD_ADDR ;

 wire [ADDRESS_WIDTH:0] WR_PTR ;
 wire [ADDRESS_WIDTH:0] RD_PTR ;

 wire [ADDRESS_WIDTH:0] SYNC_WR_PTR ;
 wire [ADDRESS_WIDTH:0] SYNC_RD_PTR ;

 DF_SYNC #(.ADDRESS_WIDTH(ADDRESS_WIDTH))
         DUT0 (.CLK(R_CLK),
               .RST(R_RST),
               .ASYNC(WR_PTR),
               .SYNC(SYNC_WR_PTR)
              );

 DF_SYNC #(.ADDRESS_WIDTH(ADDRESS_WIDTH))
         DUT1 (.CLK(W_CLK),
               .RST(W_RST),
               .ASYNC(RD_PTR),
               .SYNC(SYNC_RD_PTR)
              );


 FIFO_WR #(.DATA_WIDTH(DATA_WIDTH),.ADDRESS_WIDTH(ADDRESS_WIDTH))
         DUT2 (.W_CLK(W_CLK),
               .W_RST(W_RST),
               .W_INC(W_INC),
               .SYNC_RD_PTR(SYNC_RD_PTR),
               .WR_ADDR(WR_ADDR),
               .WR_PTR(WR_PTR),
               .FULL(FULL)
              );

 FIFO_RD #(.DATA_WIDTH(DATA_WIDTH),.ADDRESS_WIDTH(ADDRESS_WIDTH))
         DUT3 (.R_CLK(R_CLK),
               .R_RST(R_RST),
               .R_INC(R_INC),
               .SYNC_WR_PTR(SYNC_WR_PTR),
               .RD_ADDR(RD_ADDR),
               .RD_PTR(RD_PTR),
               .EMPTY(EMPTY)
              );

FIFO_MEM_CNTRL #(.DATA_WIDTH(DATA_WIDTH),.ADDRESS_WIDTH(ADDRESS_WIDTH))
               DUT4 (.W_CLK(W_CLK),
                     .R_CLK(R_CLK),
                     .W_INC(W_INC),
                     .R_INC(R_INC),
                     .FULL(FULL),
                     .RD_ADDR(RD_ADDR),
                     .WR_ADDR(WR_ADDR),
                     .WR_DATA(WR_DATA),
                     .RD_DATA(RD_DATA)
                    );

 
 
endmodule 
