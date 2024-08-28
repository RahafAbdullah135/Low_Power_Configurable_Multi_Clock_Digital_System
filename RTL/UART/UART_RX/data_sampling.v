module data_sampling 
 (
 	input  wire       clk ,
 	input  wire       rst ,
 	input  wire       rx_in ,
 	input  wire [5:0] prescale ,
 	input  wire [4:0] edge_count,
 	input  wire       data_sample_en ,
 	output wire       sampled_bit
 );

 
 reg sample_1 ;
 reg sample_2 ;
 reg sample_3 ;

always @(posedge clk or negedge rst) begin
	if (!rst) 
		begin
			sample_1    <= 1'b0 ;
			sample_2    <= 1'b0 ;
			sample_3    <= 1'b0 ;		
		end
	else if (data_sample_en == 1'b1) 
		begin
			if (edge_count == (prescale>>1)-1) 
				begin
					sample_1 <= rx_in ;
				end
			else if (edge_count == prescale>>1)
				begin
					sample_2 <= rx_in ;
				end
			else if (edge_count == (prescale>>1)+1)
				begin
					sample_3 <= rx_in ;
				end
		end
end

 assign sampled_bit = (sample_1 || sample_2) && (sample_1 || sample_3) && (sample_2 || sample_3);

endmodule