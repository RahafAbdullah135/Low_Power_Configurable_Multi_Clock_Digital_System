module UART_RX 
 (
 	 input  wire       clk ,
    input  wire       rst ,
    input  wire       rx_in ,
    input  wire       par_en ,
    input  wire       par_typ ,
    input  wire [5:0] prescale ,      
    output wire       data_valid ,
    output wire       par_error ,
    output wire       stp_error ,
    output wire [7:0] p_data
 );

 wire [3:0] bit_count ;
 wire [4:0] edge_count ;
 wire       str_glitch ;
 wire       par_chk_en ;
 wire       str_chk_en ;
 wire       stp_chk_en ;
 wire       data_sample_en ;
 wire       counter_en ;
 wire       deser_en ;
 wire       sampled_bit ;


 fsm DUT0 (.clk(clk) ,
 	       .rst(rst),
 	       .rx_in(rx_in),
 	       .par_en(par_en),
 	       .bit_count(bit_count),
 	       .edge_count(edge_count),
          .prescale(prescale),
 	       .par_error(par_error),
 	       .str_glitch(str_glitch),
 	       .stp_error(stp_error),
 	       .par_chk_en(par_chk_en),
 	       .str_chk_en(str_chk_en),
 	       .stp_chk_en(stp_chk_en),
 	       .data_sample_en(data_sample_en),
 	       .counter_en(counter_en),
 	       .deser_en(deser_en),
 	       .data_valid(data_valid)
          );


 counter DUT1 (.clk(clk) ,
 	           .rst(rst),
 	           .counter_en(counter_en),
 	           .prescale(prescale),
 	           .par_en(par_en),
 	           .bit_count(bit_count),
 	           .edge_count(edge_count)
 	          );


 data_sampling DUT2 (.clk(clk) ,
 	                 .rst(rst),
 	                 .rx_in(rx_in),
 	                 .prescale(prescale),
 	                 .edge_count(edge_count),
 	                 .data_sample_en(data_sample_en),
 	                 .sampled_bit(sampled_bit)
                    ); 


 parity_check DUT3 (.clk(clk) ,
 	                .rst(rst),
 	                .p_data(p_data),
 	                .par_chk_en(par_chk_en),
 	                .par_typ(par_typ),
 	                .sampled_bit(sampled_bit),
 	                .par_error(par_error)
 	               );


 start_check DUT4 (.clk(clk) ,
 	               .rst(rst),
 	               .str_chk_en(str_chk_en),
 	               .sampled_bit(sampled_bit),
 	               .str_glitch(str_glitch)
 	              );


 stop_check DUT5 (.clk(clk) ,
 	               .rst(rst),
 	               .stp_chk_en(stp_chk_en),
 	               .sampled_bit(sampled_bit),
 	               .stp_error(stp_error)
 	              );


 deserializer DUT6 (.clk(clk) ,
 	                .rst(rst),
 	                .deser_en(deser_en),
 	                .sampled_bit(sampled_bit),
 	                .p_data(p_data)
 	               );

 endmodule