module ALU 
#(
	parameter OPERAND_WIDTH = 8 ,
	parameter FUN_WIDTH     = 4 ,
	parameter ALU_OUT_WIDTH = OPERAND_WIDTH*2 
 )
(
	input  wire                      CLK,
	input  wire                      RST,
	input  wire [OPERAND_WIDTH-1:0]  A ,
	input  wire [OPERAND_WIDTH-1:0]  B ,
    input  wire [FUN_WIDTH-1:0]      ALU_FUN ,
    input  wire                      ALU_EN,
    output reg  [ALU_OUT_WIDTH-1:0]  ALU_OUT,
    output reg                       OUT_VALID
);

always @(posedge CLK or negedge RST) 
    begin
        if (!RST) 
	        begin
	        	ALU_OUT   <= 'b0 ;
	        	OUT_VALID <= 'b0 ;
	        end
	    else 
		    begin
		    case (ALU_FUN)
			  4'b0000 :
			    begin
			         ALU_OUT   <= A+B ; 
			         OUT_VALID <= 'b1 ;    
			    end
			   
			  4'b0001 : 
			    begin 
			         ALU_OUT   <= A-B ;
			         OUT_VALID <= 'b1 ;      
			    end

			  4'b0010 : 
			    begin 
			         ALU_OUT   <= A*B ;   
			         OUT_VALID <= 'b1 ;   
			    end

			  4'b0011 : 
			    begin 
			         ALU_OUT   <= A/B ;   
			         OUT_VALID <= 'b1 ;   
			    end

			  4'b0100 : 
			    begin
			         ALU_OUT   <= A&B ; 
			         OUT_VALID <= 'b1 ; 
			    end

			  4'b0101 : 
			    begin
			         ALU_OUT   <= A|B ;   
			         OUT_VALID <= 'b1 ;   
			    end

			  4'b0110 : 
			    begin 
			         ALU_OUT   <= ~(A&B) ;
			         OUT_VALID <= 'b1 ;   
			    end

			  4'b0111 :
			    begin 
			         ALU_OUT   <= ~(A|B) ;
			         OUT_VALID <= 'b1 ;   
			    end 

			  4'b1000 : 
			    begin 
			         ALU_OUT   <= A^B ;   
			         OUT_VALID <= 'b1 ;   
			    end

			  4'b1001 : 
			    begin 
			         ALU_OUT   <= ~(A^B) ;
			         OUT_VALID <= 'b1 ;   
			    end 

			  4'b1010 :
			    begin 
			         if(A==B)
	                     begin
	                         ALU_OUT   <= 16'd1;
	                         OUT_VALID <= 'b1 ;  
	                     end 
	                 else
	                     begin
	                         ALU_OUT   <= 16'd0;  
	                         OUT_VALID <= 'b0 ; 
	                     end    
			    end 

			  4'b1011 : 
			    begin 
			          if(A>B)
	                     begin
	                         ALU_OUT   <= 16'd1; 
	                         OUT_VALID <= 'b1 ; 
	                     end 
	                 else
	                     begin
	                         ALU_OUT   <= 16'd0;  
	                         OUT_VALID <= 'b0 ; 
	                     end        
			    end 

			  4'b1100 : 
			    begin 
			          if(A<B)
	                     begin
	                         ALU_OUT   <= 16'd1; 
	                         OUT_VALID <= 'b1 ; 
	                     end 
	                 else
	                     begin
	                         ALU_OUT   <= 16'd0;  
	                         OUT_VALID <= 'b0 ; 
	                     end        
			    end 

			  4'b1101 : 
			    begin 
			         ALU_OUT   <= A>>1 ;    
			         OUT_VALID <= 'b1 ; 
			    end

			  4'b1110 : 
			    begin 
			         ALU_OUT   <= A<<1 ;  
			         OUT_VALID <= 'b0 ;   
			    end 

			  default :
			    begin
			         ALU_OUT   <= 16'b0 ; 
			         OUT_VALID <= 'b0 ; 
			    end  
	        endcase
		    end
		end

endmodule 