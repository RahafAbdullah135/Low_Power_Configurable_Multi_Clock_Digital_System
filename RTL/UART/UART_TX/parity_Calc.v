module parity_Calc #( parameter WIDTH = 8)
 (
  input  wire               CLK,
  input  wire               RST,
  input  wire  [WIDTH-1:0]  P_DATA,
  input  wire               DATA_VALID,
  input  wire               PAR_TYP,
  input  wire               PAR_FLAG,
  output reg                PAR_BIT
 );


 localparam EVEN_PARITY = 1'b0 ,
            ODD_PARITY  = 1'b1 ;

 reg [7:0] REG ;

  always @(posedge CLK or negedge RST) 
  begin
  	if (!RST) 
  	     begin
  		 PAR_BIT <= 0 ;
         REG     <= 'b0 ;
         end
       else if ((PAR_TYP == EVEN_PARITY) && (PAR_FLAG)) 
  	     begin
  		 PAR_BIT <= ^REG ;
  	     end
  	else if ((PAR_TYP == ODD_PARITY) && (PAR_FLAG)) 
  	     begin
  		 PAR_BIT <= ~^REG ;
  	     end
       else if (DATA_VALID)
            begin
               REG <= P_DATA ;
            end
  end

 endmodule 