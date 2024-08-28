
/////////////////////////////////////////////////////////////
///////////////////// pulse genetator ///////////////////////
/////////////////////////////////////////////////////////////

module PULSE_GEN 
 (
 	input  wire CLK,
 	input  wire RST,
 	input  wire LVL_SIG,
 	output wire PULSE_SIG
 );

 reg FLOP_IN ;
 reg FLOP_OUT ;

 always @(posedge CLK or negedge RST) 
 begin
 	if (!RST) 
	 	begin
	 	   FLOP_IN  <= 0 ;
	 	   FLOP_OUT <= 0 ;
	 	end
 	else  
	 	begin
	 		FLOP_IN  <= LVL_SIG ;
	 		FLOP_OUT <= FLOP_IN ; 
	 	end
 end

 assign PULSE_SIG = (FLOP_IN) && (!FLOP_OUT) ;

 endmodule 