module stop_check 
 (
 	 input  wire clk ,
    input  wire rst ,
    input  wire stp_chk_en ,
    input  wire sampled_bit ,
    output reg  stp_error 
 );


 always @(posedge clk or negedge rst) 
 begin
   if (!rst) 
      begin
         stp_error <= 1'b0 ;
      end
   else if ((stp_chk_en == 1'b1) && (sampled_bit == 1'b1))
      begin
         stp_error <= 1'b0 ;
      end
   else if ((stp_chk_en == 1'b1) && (sampled_bit == 1'b0))
      begin
         stp_error <= 1'b1 ;
      end
 end


 endmodule