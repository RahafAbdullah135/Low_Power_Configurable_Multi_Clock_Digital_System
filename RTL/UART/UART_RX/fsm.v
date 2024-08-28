module fsm 
 (
    input  wire       clk ,
    input  wire       rst ,
    input  wire       rx_in ,
    input  wire       par_en ,
    input  wire [3:0] bit_count ,
    input  wire [4:0] edge_count ,
    input  wire       par_error ,
    input  wire       str_glitch ,
    input  wire       stp_error ,
    input  wire [5:0] prescale ,
    output reg        par_chk_en ,
    output reg        str_chk_en ,
    output reg        stp_chk_en ,
    output reg        data_sample_en ,
    output reg        counter_en ,
    output reg        deser_en ,
    output reg        data_valid
  );

 parameter [2:0] idle = 3'b000 ,         //0
                 str_chk = 3'b001 ,      //1
                 deserialize = 3'b010 ,  //2
                 par_chk = 3'b011 ,      //3
                 stp_chk = 3'b100 ;      //4
 
 reg [2:0] current_state ; 
 reg [2:0] next_state ;

 always @(posedge clk or negedge rst) 
 begin
     if (!rst) 
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
     case(current_state)
         idle : begin
                   if (rx_in == 0) 
                     begin
                        next_state = str_chk ;
                     end
                   else 
                     begin
                        next_state = idle ;
                     end
                end
         str_chk : begin
                        if (edge_count == prescale-1) 
                          begin
                             if (str_glitch == 1) 
                             begin
                                next_state = idle ;
                             end
                          else 
                             begin
                                next_state = deserialize ;
                             end
                          end
                        else 
                          begin
                            next_state = str_chk ;
                          end
                    end      
         deserialize : begin
                             if ((bit_count == 'b1001)&&(par_en == 1)) 
                                 begin
                                    next_state = par_chk ;
                                 end
                             else if ((bit_count == 'b1001)&&(par_en == 0))
                                 begin
                                    next_state = stp_chk ;
                                 end
                             else 
                                 begin
                                    next_state = deserialize ;
                                 end
                       end      
         par_chk : begin
                        if (edge_count == prescale-1) 
                            begin
                                 if (par_error == 1) 
                                     begin
                                        next_state = idle ;
                                     end
                                 else 
                                     begin
                                        next_state = stp_chk ;
                                     end
                              end
                        else 
                            begin
                                next_state = par_chk ;
                            end
                    end
         
         stp_chk : begin
                        if (edge_count == prescale-1) 
                        begin
                             //next_state = idle ; 
                             if ((stp_error == 0)&&(rx_in == 1'b0))
                                 begin
                                    next_state = str_chk ;
                                 end
                             else if ((stp_error == 0)&&(rx_in == 1'b1))
                                 begin
                                    next_state = idle ;
                                 end
                        end
                        else 
                            begin
                                next_state = stp_chk ;
                            end
                    end
         default : begin
                      next_state = idle ;
                   end
        endcase
 end


 always @(*) 
 begin
    par_chk_en     = 1'b0 ;
    str_chk_en     = 1'b0 ;
    stp_chk_en     = 1'b0 ;
    data_sample_en = 1'b0 ;
    counter_en     = 1'b0 ;
    deser_en       = 1'b0 ;
    data_valid     = 1'b0 ;
    case(current_state)
         idle : begin
                   par_chk_en     = 1'b0 ;
                   str_chk_en     = 1'b0 ;
                   stp_chk_en     = 1'b0 ;
                   data_sample_en = 1'b0 ;
                   counter_en     = 1'b0 ;
                   deser_en       = 1'b0 ;
                   data_valid     = 1'b0 ;
                end
         str_chk : begin
                      data_sample_en = 1'b1 ;
                      counter_en     = 1'b1 ;
                      deser_en       = 1'b0 ;
                      par_chk_en     = 1'b0 ;
                      stp_chk_en     = 1'b0 ;   
                      data_valid     = 1'b0 ;
                      if (edge_count == prescale-1) 
                          begin
                            str_chk_en     = 1'b1 ;                                  
                          end  
                      else 
                          begin
                            str_chk_en     = 1'b0 ;                                                             
                          end         
                   end
         deserialize : begin
                      data_sample_en = 1'b1 ;
                      counter_en     = 1'b1 ;
                      str_chk_en     = 1'b0 ;
                      par_chk_en     = 1'b0 ;
                      stp_chk_en     = 1'b0 ;
                      data_valid     = 1'b0 ;
                      if (edge_count == prescale-1) 
                         begin
                          deser_en   = 1'b1 ;  
                         end
                      else 
                         begin
                          deser_en   = 1'b0 ;
                         end                                          
                   end
         par_chk : begin
                      data_sample_en = 1'b1 ;
                      counter_en     = 1'b1 ;
                      deser_en       = 1'b0 ;
                      str_chk_en     = 1'b0 ;
                      stp_chk_en     = 1'b0 ;
                      data_valid     = 1'b0 ;
                      if (edge_count == prescale-1) 
                          begin
                            par_chk_en     = 1'b1 ;                                  
                          end  
                      else 
                          begin
                            par_chk_en     = 1'b0 ;                                                             
                          end
                    end
         stp_chk : begin
                      data_sample_en = 1'b1 ;
                      counter_en     = 1'b1 ;  
                      deser_en       = 1'b0 ;
                      str_chk_en     = 1'b0 ;
                      par_chk_en     = 1'b0 ;    
                      if (edge_count == prescale-1) 
                          begin
                            stp_chk_en     = 1'b1 ;                                  
                          end  
                      else 
                          begin
                            stp_chk_en     = 1'b0 ;                                                             
                          end

                    if (edge_count == prescale-1)
                        begin
                          if ((stp_error == 1'b0)&&(par_error == 1'b0)) 
                              begin
                                data_valid  = 1'b1 ;                                  
                              end  
                          else 
                              begin
                                data_valid  = 1'b0 ;                                                             
                              end 
                        end                    
                   else 
                       begin
                          data_valid  = 1'b0 ; 
                       end
                    end
         default : begin
                   par_chk_en     = 1'b0 ;
                   str_chk_en     = 1'b0 ;
                   stp_chk_en     = 1'b0 ;
                   data_sample_en = 1'b0 ;
                   counter_en     = 1'b0 ;
                   deser_en       = 1'b0 ;
                   data_valid     = 1'b0 ;
                end
        endcase
       
 end

 endmodule