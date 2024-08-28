module deserializer 
 (
 	 input  wire       clk ,
    input  wire       rst ,
    input  wire       deser_en ,
    input  wire       sampled_bit ,
    output reg  [7:0] p_data
 );

 reg [3:0] counter ;


 always @(posedge clk or negedge rst) begin
 	if (!rst) 
    	begin
    		counter  <= 4'b0 ;
    		p_data <= 8'b00000000 ;		
    	end
 	else if ((deser_en ==1'b1) && (counter != 8))
    	begin
    		p_data[counter] <= sampled_bit ;
    		counter <= counter + 1 ;
    	end
 	else if (counter == 8)
      begin
    		counter  <= 4'b0 ;
    	end
 end

 endmodule