module counter 
 (
 	input  wire       clk ,
 	input  wire       rst ,
 	input  wire       counter_en ,
    input  wire [5:0] prescale ,
    input  wire       par_en ,
 	output reg  [3:0] bit_count,
 	output reg  [4:0] edge_count 
 );

 
always @(posedge clk or negedge rst) 
 begin
    if (!rst) 
        begin
            bit_count  <= 'b0 ;
            edge_count <= 'b0 ;
        end
    else if ((counter_en == 1'b1) && (edge_count != prescale-1))
        begin
            edge_count <= edge_count + 1 ;
        end
    else if ((counter_en == 1'b1) && (edge_count == prescale-1))
        begin
            edge_count <= 'b0 ;
            if ((par_en == 1'b1) && (bit_count == 'b1010))
                 begin
                    bit_count <= 'b0 ;
                end
            else if ((par_en == 1'b0) && (bit_count == 'b1001))
                begin
                    bit_count <= 'b0 ;    
                end
            else 
                begin
                   bit_count <= bit_count + 1 ;
                 end
            
        end
 end
endmodule