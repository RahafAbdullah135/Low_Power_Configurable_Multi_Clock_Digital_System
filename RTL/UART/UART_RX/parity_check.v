module parity_check
 (
 	input  wire       clk ,
   input  wire       rst ,
   input  wire [7:0] p_data ,
   input  wire       par_typ ,
 	input  wire       par_chk_en ,
 	input  wire       sampled_bit ,
 	output reg        par_error
 );

 localparam even_parity = 1'b0 ,
            odd_parity  = 1'b1 ;

 reg par_bit ;


always @(posedge clk or negedge rst) 
begin
    if (!rst) 
       begin
          par_bit <= 1'b0 ;
       end
    else if (par_typ == even_parity) 
      begin
         par_bit <= (^p_data) ;
      end
   else if (par_typ == odd_parity)
      begin
         par_bit <= ~(^p_data) ;
      end
end


always @(posedge clk or negedge rst) 
begin
   if (!rst) 
      begin
         par_error <= 1'b0 ;
      end
   else if (par_chk_en == 1'b1)
      begin
          if (par_bit == sampled_bit) 
            begin
               par_error <= 1'b0 ;
            end
         else 
            begin
               par_error <= 1'b1 ;
            end
      end
end
 

 endmodule