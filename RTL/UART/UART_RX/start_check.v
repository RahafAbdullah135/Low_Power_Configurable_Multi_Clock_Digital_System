module start_check 
 (
 	input  wire clk ,
    input  wire rst ,
    input  wire str_chk_en ,
    input  wire sampled_bit ,
    output reg  str_glitch 
 );

 always @(posedge clk or negedge rst) begin
 	if (!rst) 
    	begin
    		str_glitch <= 1'b0 ;
    	end
 	else if (str_chk_en == 1'b1) 
    	begin
    		if (sampled_bit == 1'b0) 
       		begin
       			str_glitch <= 1'b0 ;
       		end
    		else if (sampled_bit == 1'b1)
       		begin
       			str_glitch <= 1'b1 ;
       		end
    	end
 end

 endmodule