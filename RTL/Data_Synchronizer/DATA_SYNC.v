/////////////////////////////////////////////////////////////
//////////////////// data synchronizer //////////////////////
/////////////////////////////////////////////////////////////

module DATA_SYNC 
#(
	parameter NUM_STAGES = 2 ,
	parameter BUS_WIDTH  = 8 
 )
 (
 	input wire                 CLK ,
 	input wire                 RST ,
 	input wire                 BUS_EN ,
 	input wire [BUS_WIDTH-1:0] UN_SYNC_BUS ,
 	output reg                 EN_PULSE ,
 	output reg [BUS_WIDTH-1:0] SYNC_BUS  
 );

 reg  [NUM_STAGES-1:0] stages ;

 integer i ;

 reg SYNC_BUS_EN ;

 reg PULSE_GEN_OUT ;

 always @(posedge CLK or negedge RST) 
 begin
 	if (!RST) 
	 	begin
	 		stages      <= 'b0 ;
	 		SYNC_BUS_EN <= 1'b0 ;	 		
	 	end
 	else  
	 	begin
	 		stages[0] <= BUS_EN ;
			    for (i=1; i<NUM_STAGES; i=i+1) 
			        begin
			            stages[i] <= stages[i-1];
			        end
	        SYNC_BUS_EN <= stages[NUM_STAGES-1];
	 	end
 end

 always @(posedge CLK or negedge RST) 
 begin
 	if (!RST) 
	 	begin
	 		PULSE_GEN_OUT <= 1'b0 ;	 		
	 	end
 	else  
	 	begin
	 		PULSE_GEN_OUT <= SYNC_BUS_EN ;
	 	end
 end

 always @(posedge CLK or negedge RST) 
 begin
 	if (!RST) 
	 	begin
	 		EN_PULSE <= 0 ; 		
	 	end
 	else  
	 	begin
	 		EN_PULSE <= (SYNC_BUS_EN && (~PULSE_GEN_OUT)) ;
	 	end
 end
 
always @(posedge CLK or negedge RST) 
 begin
 	if (!RST)
	 	begin
	 		SYNC_BUS <= 'b0 ;
	 	end
 	else  if (SYNC_BUS_EN == 1'b1)
	 	begin
	 		SYNC_BUS <= UN_SYNC_BUS ;
	 	end
	else 
		begin
			SYNC_BUS <= SYNC_BUS ;
		end
 end

 endmodule
