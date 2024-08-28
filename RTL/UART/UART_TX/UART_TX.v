module UART_TX #( parameter WIDTH = 8)
 (
 input  wire               CLK,
 input  wire               RST,
 input  wire  [WIDTH-1:0]  P_DATA,
 input  wire               DATA_VALID,
 input  wire               PAR_EN,
 input  wire               PAR_TYP,
 output wire               TX_OUT,
 output wire               BUSY
 );


 wire       SER_DONE ;
 wire       SER_EN ;
 wire [1:0] MUX_SEL ;
 wire       PAR_BIT;
 wire       SER_DATA ;
 wire       PAR_FLAG ;

 serializer #(.WIDTH(WIDTH)) DUT0 (
                  .CLK(CLK),
                  .RST(RST),
                  .P_DATA(P_DATA),
                  .DATA_VALID(DATA_VALID),
                  .SER_EN(SER_EN),
                  .SER_DATA(SER_DATA),
                  .SER_DONE(SER_DONE)
 	             );

 FSM_TX DUT1 (
           .CLK(CLK),
           .RST(RST),
           .DATA_VALID(DATA_VALID),
           .SER_DONE(SER_DONE),
           .PAR_EN(PAR_EN),
           .SER_EN(SER_EN),
           .MUX_SEL(MUX_SEL),
           .PAR_FLAG(PAR_FLAG),
           .BUSY(BUSY)
 	      );

 parity_Calc #(.WIDTH(WIDTH)) DUT2 (
                   .CLK(CLK),
                   .RST(RST),
                   .P_DATA(P_DATA),
                   .DATA_VALID(DATA_VALID),
                   .PAR_TYP(PAR_TYP),
                   .PAR_FLAG(PAR_FLAG),
                   .PAR_BIT(PAR_BIT)
 	              );

 MUX DUT3 (
 	       .CLK(CLK),
 	       .RST(RST),
 	       .MUX_SEL(MUX_SEL),
 	       .SER_DATA(SER_DATA),
 	       .PAR_BIT(PAR_BIT),
 	       .TX_OUT(TX_OUT)
 	      );

 endmodule 