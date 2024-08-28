module Clk_Div 
  #(parameter WIDTH = 8)
 (
 	input  wire             i_ref_clk ,
 	input  wire             i_rst_n ,
 	input  wire             i_clk_en ,
 	input  wire [WIDTH-1:0] i_div_ratio ,
 	output wire             o_div_clk
 );  

 wire is_even ;
 wire is_odd  ;
 wire clk_en  ;
 reg  div_clk ;
 reg  flag  ;
 reg [WIDTH-1:0] counter  ;

 assign is_even = ~(i_div_ratio[0]) ;
 assign is_odd  = i_div_ratio[0] ;
 assign clk_en  = i_clk_en && (i_div_ratio != 0) && (i_div_ratio != 1) ;
 assign o_div_clk = (clk_en)? div_clk : i_ref_clk ;

 always @(posedge i_ref_clk or negedge i_rst_n) 
	 begin
	 	if (!i_rst_n) 
		 	begin
		 		div_clk <= 0 ;
		 		counter <= 0 ;
		 		flag    <= 0 ;	
		 	end
	 	else if (clk_en) 
		 	begin
		 		if (counter==((i_div_ratio>>1)-1) && is_even) 
			 		begin
			 			div_clk <= !div_clk ;
			 			counter <= 0 ;
			 		end 
			 	else if ((!flag && counter==(i_div_ratio>>1) && is_odd) || (flag && counter==((i_div_ratio>>1)-1) && is_odd))
				 	begin
				 		div_clk <= !div_clk ;
				 		counter <= 0 ;
				 		flag    <= !flag ;	
				 	end
				else 
					begin
						counter <= counter + 1 ;
					end
		 	end
	 end

endmodule