module RST_SYNC
 #( parameter NUM_STAGES = 2)

 (
 	input  wire CLK ,
 	input  wire RST ,
 	output reg  SYNC_RST 
 );

 reg  [NUM_STAGES-1:0] stages ;

 integer i ;

 always @(posedge CLK or negedge RST) 
 begin
   if (!RST) 
     begin
       stages   <= 'b0 ;
       SYNC_RST <= 0 ;
     end
   else 
     begin
       stages[0] <= 1 ;
       for (i=1; i<NUM_STAGES; i=i+1) 
          begin
              stages[i] <= stages[i-1];
          end
       SYNC_RST <= stages[NUM_STAGES-1];
     end
 end

 endmodule
