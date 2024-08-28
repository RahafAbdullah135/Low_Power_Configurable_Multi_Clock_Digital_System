module SYS_CTRL 
#(
	parameter DATA_WIDTH = 8 ,
	parameter ADDRESS_WIDTH = 4 ,
	parameter FUN_WIDTH = 4 ,
	parameter ALU_OUT_WIDTH = DATA_WIDTH*2 
 )
 (
 	input  wire                     CLK,
 	input  wire                     RST,
 	input  wire [DATA_WIDTH-1:0]    RX_P_DATA,
 	input  wire                     RX_DATA_VALID ,
 	input  wire [DATA_WIDTH-1:0]    RD_DATA ,
 	input  wire                     RD_DATA_VALID ,
 	input  wire [ALU_OUT_WIDTH-1:0] ALU_OUT ,
 	input  wire                     ALU_OUT_VALID ,
 	input  wire                     FIFO_FULL ,
 	output reg  [FUN_WIDTH-1:0]     ALU_FUN ,
 	output reg                      ALU_EN ,
 	output reg                      CLK_GATE_EN ,
 	output reg [ADDRESS_WIDTH-1:0]  ADDRESS ,
 	output reg                      WR_EN ,
 	output reg                      RD_EN ,
 	output reg [DATA_WIDTH-1:0]     WR_DATA ,
 	output reg [DATA_WIDTH-1:0]     TX_P_Data,
 	output reg                      TX_DATA_VALID ,
 	output reg                      CLK_DIV_EN 
 );

 reg [ADDRESS_WIDTH-1:0]  ADDRESS_REG ;
 reg [ALU_OUT_WIDTH-1:0]  ALU_OUT_REG ;

 reg ADDRESS_FLAG ;
 reg ALU_OUT_FLAG ; 

 parameter [3:0] idle              = 4'b0000 ,    
                 WR_address_state  = 4'b0001 ,      
                 WR_data_state     = 4'b0010 , 
                 RD_address_state  = 4'b0011 , 
                 RD_data_state     = 4'b0100 ,   
                 ALU_IN1_state     = 4'b0101 ,
                 ALU_IN2_state     = 4'b0110 , 
                 ALU_FUN_state     = 4'b0111 ,
                 ALU_OUT_state     = 4'b1000 , 
                 ALU_1st_OUT_state = 4'b1001 , 
                 ALU_2st_OUT_state = 4'b1010 ;  
 
 reg [3:0] current_state ; 
 reg [3:0] next_state ;

 always @(posedge CLK or negedge RST) 
 begin
     if (!RST) 
          begin
             current_state <= idle ;   
          end
     else 
          begin
              current_state <= next_state ; 
          end
 end

always @(*) 
 begin
     next_state = idle ;
     case (current_state)
          idle : begin
          	         if (RX_DATA_VALID == 1'b1) 
	          	         begin
	          	         if (RX_P_DATA == 'hAA) 
		          	         begin
		          	         	next_state = WR_address_state ;
		          	         end
		          	      else if (RX_P_DATA == 'hBB)
			          	      begin
			          	      	next_state = RD_address_state ;
			          	      end
	          	          else if (RX_P_DATA == 'hCC)
			          	      begin
			          	      	next_state = ALU_IN1_state ;
			          	      end
			          	  else if (RX_P_DATA == 'hDD)
			          	      begin
			          	      	next_state = ALU_FUN_state ;
			          	      end
	          	         end
	          	         else 
		          	         begin
		          	         	next_state = idle ;
		          	         end
                 end      
          WR_address_state : begin
          	                   if (RX_DATA_VALID == 1'b1)
	          	                   begin
	          	                   	 next_state = WR_data_state ;
	          	                   end
	          	               else 
		          	               begin
		          	               	 next_state = WR_address_state ;
		          	               end
                             end
          WR_data_state : begin
          	                if (RX_DATA_VALID == 1'b1)
	          	                begin
	          	                	 next_state = idle ;
	          	                end
	          	            else 
		          	            begin
		          	            	 next_state = WR_data_state ;
		          	            end
                          end                  
          RD_address_state : begin
          	                   if (RX_DATA_VALID == 1'b1)
	          	                   begin
	          	                   	 next_state = RD_data_state ;
	          	                   end
	          	               else 
		          	               begin
		          	               	 next_state = RD_address_state ;
		          	               end
                             end 
          RD_data_state : begin
          	                if (RD_DATA_VALID == 1'b1)
	          	                begin
	          	                	 next_state = idle ;
	          	                end
	          	            else 
		          	            begin
		          	            	 next_state = RD_data_state ;
		          	            end
                          end 
                            
          ALU_IN1_state : begin
          	                if (RX_DATA_VALID == 1'b1)
	          	               begin
	          	                 next_state = ALU_IN2_state ;
	          	               end
	          	            else 
		          	            begin
		          	             next_state = ALU_IN1_state ;
		          	            end
                          end 
          ALU_IN2_state : begin
          	               if (RX_DATA_VALID == 1'b1)
	          	               begin
	          	               	 next_state = ALU_FUN_state ;
	          	               end
	          	           else 
		          	           begin
		          	           	 next_state = ALU_IN2_state ;
		          	           end
                         end
          ALU_FUN_state : begin
          	               if (RX_DATA_VALID == 1'b1)
	          	               begin
	          	               	 next_state = ALU_OUT_state ;
	          	               end
	          	           else 
		          	           begin
		          	           	 next_state = ALU_FUN_state ;
		          	           end
                         end
          ALU_OUT_state :begin
          	               if (ALU_OUT_VALID == 1'b1)
	          	               begin
	          	               	 next_state = ALU_1st_OUT_state ;
	          	               end
	          	           else 
		          	           begin
		          	           	 next_state = ALU_OUT_state ;
		          	           end
                         end
          ALU_1st_OUT_state : begin
                                next_state = ALU_2st_OUT_state ;
                              end
          ALU_2st_OUT_state : begin
                                next_state = idle ;
                              end
          default : begin
                      next_state = idle ;
                    end             
     endcase 
 end

 always @(*) 
 begin
    CLK_GATE_EN   = 'b0 ;
    CLK_DIV_EN    = 'b1 ;
    ALU_EN        = 'b0 ;
    ALU_FUN       = 'b0 ;
    WR_EN         = 'b0 ;
    RD_EN         = 'b0 ;
    ADDRESS       = 'b0 ;
    WR_DATA       = 'b0 ;
    TX_P_Data     = 'b0 ;
    TX_DATA_VALID = 'b0 ;
    ADDRESS_FLAG  = 'b0 ;
    ALU_OUT_FLAG  = 'b0 ;
    case(current_state)
          idle : begin
                     CLK_GATE_EN   = 'b0 ;
                     CLK_DIV_EN    = 'b1 ;
          	         ALU_EN        = 'b0 ;
          	         ALU_FUN       = 'b0 ;
          	         WR_EN         = 'b0 ;
          	         RD_EN         = 'b0 ;
          	         ADDRESS       = 'b0 ;
          	         WR_DATA       = 'b0 ;
          	         TX_P_Data     = 'b0 ;
          	         TX_DATA_VALID = 'b0 ;
          	         ADDRESS_FLAG  = 'b0 ;
                     ALU_OUT_FLAG  = 'b0 ;
                 end
          WR_address_state : begin
			          	        if (RX_DATA_VALID == 1'b1)
			          	               begin
			          	               	 ADDRESS_FLAG = 'b1 ;
			          	               end
			          	           else 
				          	           begin
				          	           	 ADDRESS_FLAG = 'b0 ;
				          	           end 
		                     end 
          WR_data_state : begin
          	                 if (RX_DATA_VALID == 1'b1)
			          	         begin
			          	         	 WR_EN    = 'b1 ;
			          	         	 ADDRESS  = ADDRESS_REG ;
			          	         	 WR_DATA  = RX_P_DATA ;
			          	         end
			          	     else 
				          	     begin
				          	     	 WR_EN    = 'b0 ;
			          	         	 ADDRESS  = 'b0 ;
			          	         	 WR_DATA  = 'b0 ;
				          	     end
                          end
          RD_address_state : begin
	          	                 if (RX_DATA_VALID == 1'b1)
			          	         begin
			          	         	 RD_EN    = 'b1 ;
			          	         	 ADDRESS  = RX_P_DATA[3:0] ;
			          	         end
			          	     else 
				          	     begin
				          	     	 WR_EN    = 'b0 ;
			          	         	 ADDRESS  = 'b0 ;
				          	     end
                             end
          RD_data_state : begin
          	                 if ((RD_DATA_VALID == 1'b1)&&(FIFO_FULL == 1'b0))
			          	         begin
			          	         	 TX_P_Data     = RD_DATA ;
			          	         	 TX_DATA_VALID = 'b1 ;
			          	         end
			          	     else 
				          	     begin
				          	     	 TX_P_Data     = 'b0 ;
			          	         	 TX_DATA_VALID = 'b0 ;
				          	     end 
                          end
          ALU_IN1_state : begin
                              if (RX_DATA_VALID == 1'b1)
			          	         begin
			          	         	 WR_EN    = 'b1 ;
			          	         	 ADDRESS  = 'b0 ;
			          	         	 WR_DATA  = RX_P_DATA ;
			          	         end
			          	     else 
				          	     begin
				          	     	 WR_EN    = 'b0 ;
			          	         	 ADDRESS  = 'b0 ;
			          	         	 WR_DATA  = 'b0 ;
				          	     end
                          end 
          ALU_IN2_state : begin
          	                if (RX_DATA_VALID == 1'b1)
			          	         begin
			          	         	 WR_EN    = 'b1 ;
			          	         	 ADDRESS  = 'b1 ;
			          	         	 WR_DATA  = RX_P_DATA ;
			          	         end
			          	     else 
				          	     begin
				          	     	 WR_EN    = 'b0 ;
			          	         	 ADDRESS  = 'b0 ;
			          	         	 WR_DATA  = 'b0 ;
				          	     end
                          end
          ALU_FUN_state : begin
                             CLK_GATE_EN = 'b1 ;
          	                 if (RX_DATA_VALID == 1'b1)
			          	         begin
			          	         	 ALU_EN   = 'b1 ;
			          	         	 ALU_FUN  = RX_P_DATA ;
			          	         end
			          	     else 
				          	     begin
				          	     	 ALU_EN   = 'b0 ;
			          	         	 ALU_FUN  = 'b0 ;
				          	     end  
                          end
          ALU_OUT_state :begin
          	                 CLK_GATE_EN = 'b1 ;
          	                 if (ALU_OUT_VALID == 1'b1)
			          	         begin
			          	         	 ALU_OUT_FLAG  = 'b1 ;
			          	         end
			          	     else 
				          	     begin
				          	     	 ALU_OUT_FLAG  = 'b0 ;
				          	     end   
                          end
          ALU_1st_OUT_state : begin
                                 CLK_GATE_EN = 'b1 ;
	          	                 if (FIFO_FULL == 1'b0)
				          	         begin
				          	         	 TX_P_Data     = ALU_OUT_REG[DATA_WIDTH-1:0] ;
				          	         	 TX_DATA_VALID = 'b1 ;
				          	         end
				          	     else 
					          	     begin
					          	     	 TX_P_Data     = 'b0 ;
				          	         	 TX_DATA_VALID = 'b0 ;
					          	     end
          	                  end
          ALU_2st_OUT_state : begin
                                 CLK_GATE_EN = 'b1 ;
	          	                 if (FIFO_FULL == 1'b0)
				          	         begin
				          	         	 TX_P_Data     = ALU_OUT_REG[2*DATA_WIDTH-1:DATA_WIDTH] ;
				          	         	 TX_DATA_VALID = 'b1 ;
				          	         end
				          	     else 
					          	     begin
					          	     	 TX_P_Data     = 'b0 ;
				          	         	 TX_DATA_VALID = 'b0 ;
					          	     end
          	                  end
          default : begin
	          	         CLK_GATE_EN   = 'b0 ;
	                     CLK_DIV_EN    = 'b1 ;
	          	         ALU_EN        = 'b0 ;
	          	         ALU_FUN       = 'b0 ;
	          	         WR_EN         = 'b0 ;
	          	         RD_EN         = 'b0 ;
	          	         ADDRESS       = 'b0 ;
	          	         WR_DATA       = 'b0 ;
	          	         TX_P_Data     = 'b0 ;
	          	         TX_DATA_VALID = 'b0 ;
	          	         ADDRESS_FLAG  = 'b0 ;
                         ALU_OUT_FLAG  = 'b0 ;
                    end
    endcase
 end

// **************** storing Address **************** //
  always @(posedge CLK or negedge RST) 
  begin
  	if (!RST) 
	  	begin
	  		ADDRESS_REG <= 'b0 ;
	  	end
  	else if (ADDRESS_FLAG == 'b1)
	  	begin
	  		ADDRESS_REG <= RX_P_DATA ;
	  	end
  end
 
 // **************** storing ALU Function **************** //
 always @(posedge CLK or negedge RST) 
  begin
  	if (!RST) 
	  	begin
	  		ALU_OUT_REG <= 'b0 ;
	  	end
  	else if (ALU_OUT_FLAG == 'b1)
		begin
			ALU_OUT_REG <= ALU_OUT ;
		end

  end
 


 endmodule