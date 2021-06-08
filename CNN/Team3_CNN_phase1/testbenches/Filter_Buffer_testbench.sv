
module Filter_Buffer_testbench();

    localparam N = 5; 

	shortint filter [0:4][0:4];
    reg FB_filter_buffer_finish;
    reg FB_write, FB_bias_or_filter, reset;
    shortint FB_index_filter, FB_index_bias, FB_output_bias, index_filter;
    shortint FB_filter [0:4][0:4];
    shortint FB_bias[0:119];

    localparam period = 100; 

	Filter_Buffer_5x5 FILTER_BUFFER (
        FB_write, 
        FB_filter, 
        FB_filter_buffer_finish, 
        filter, 
        FB_index_filter, 
        FB_index_bias, 
        FB_bias, 
        FB_bias_or_filter, 
        FB_output_bias,
        reset,
        index_filter
        );
    integer i,x,y;
    
    initial
        begin
		reset = 1;
		FB_write = 0;
		FB_bias_or_filter = 1;
		#period;
		reset = 0;
		for(i=0; i<300; i=i+1) begin
			FB_index_filter = i;
			index_filter = i;
			FB_write = 1;
			// Set the input filter
			for(x=0; x<N; x=x+1) begin
			for(y=0; y<N; y=y+1) begin
				FB_filter[x][y] = $urandom%100;
			end
			end

			#period;

			// Check the image
			if ( FB_filter != filter) $display("Error value in Reading");
			FB_write = 0;

			#period 
			if ( FB_filter_buffer_finish != 0) $display("Error did not reset");
			
		end
        end
endmodule