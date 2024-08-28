module FSM_TX 
 (
 input  wire         CLK,
 input  wire         RST,
 input  wire         DATA_VALID,
 input  wire         SER_DONE,
 input  wire         PAR_EN,
 output reg          SER_EN,
 output reg   [1:0]  MUX_SEL,
 output reg          PAR_FLAG,
 output reg          BUSY
 );

 reg [2:0] current_state ;
 reg [2:0] next_state ;

 localparam [2:0]  IDLE   = 3'b000 ,
                   STR    = 3'b001 ,
                   DATA   = 3'b010 ,
                   PARITY = 3'b011 ,
                   STP    = 3'b100 ;



 always @(posedge CLK or negedge RST) 
 begin
 	if (!RST) 
 	     begin 
 	         current_state <= IDLE ;
 	     end
 	else 
 	     begin
 		     current_state <= next_state ;
 	     end
 end
 
 always @(*) 
 begin
    next_state = IDLE ;
    case(current_state)
         IDLE : begin
                   if (DATA_VALID) 
                         begin
                   	         next_state = STR ;
                         end
                   else
                         begin
                   	         next_state = IDLE ;
                         end
                end
         STR  : begin
                 next_state = DATA ;
                end
         DATA : begin
         	       if ((SER_DONE) && (PAR_EN))
                         begin
                              next_state = PARITY ;
                         end
                   else if ((SER_DONE) && (!PAR_EN))
                         begin
                   	         next_state = STP ;
                         end
                   else 
                         begin
                             next_state = DATA ;
                         end
                end
         PARITY : begin
                     next_state = STP ;
                  end
          STP  : begin
                    next_state = IDLE ;
         	      /*if (DATA_VALID) 
                         begin
                   	         next_state = STR ;
                         end
                   else
                         begin
                   	         next_state = IDLE ;
                         end*/
                 end
         default : begin
                       next_state = IDLE ;
                   end
    endcase
 end

 always @(*) 
 begin
    MUX_SEL  = 2'b00 ;
    BUSY     = 1'b0 ; 
    SER_EN   = 1'b0 ;
    PAR_FLAG = 1'b0 ;
    case(current_state)
         IDLE : begin
                   BUSY     = 1'b0 ;
                   SER_EN   = 1'b0 ;
                   PAR_FLAG = 1'b0 ;
                end
         STR  : begin
         	       MUX_SEL  = 2'b00 ;
         	       BUSY     = 1'b1 ; 
                   SER_EN   = 1'b1 ;
                   PAR_FLAG = 1'b1 ;
                end
         DATA : begin
         	       MUX_SEL  = 2'b01 ;
         	       BUSY     = 1'b1 ;
                   SER_EN   = 1'b1 ;
                   PAR_FLAG = 1'b1 ;
                end
         PARITY : begin
         	       MUX_SEL  = 2'b10 ;
         	       BUSY     = 1'b1 ;
                   SER_EN   = 1'b1 ;
                   PAR_FLAG = 1'b1 ;
                end
          STP  : begin
         	       MUX_SEL  = 2'b11 ;
         	       BUSY     = 1'b1 ;
                   SER_EN   = 1'b0 ;
                   PAR_FLAG = 1'b0 ;
                end
         default : begin
                    MUX_SEL  = 2'b00 ;
                    BUSY     = 1'b0 ; 
                    SER_EN   = 1'b0 ;
                    PAR_FLAG = 1'b0 ;
                   end
    endcase
 end
 
endmodule 
