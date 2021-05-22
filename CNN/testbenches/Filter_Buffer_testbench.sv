
module Filter_Buffer_testbench();

    localparam N = 5; 

    shortint input_filter[N-1:0][N-1:0] ;
    reg read;
    shortint output_filter[N-1:0][N-1:0] ;
    wire finish;

    localparam period = 100; 

    Filter_Buffer_5x5 FILTER1 (read, input_filter, finish, output_filter);
    integer i,x,y;
    
    initial
        begin
		for(i=0; i<300; i=i+1) begin

			read = 1;
			// Set the input filter
			for(x=0; x<N; x=x+1) begin
			for(y=0; y<N; y=y+1) begin
				input_filter[x][y] = $urandom%100;
			end
			end

			#period;

			// Check the image
			if ( input_filter != output_filter) $display("Error value in Reading");
			if ( finish != 1) $display("Error did not finish");
			read = 0;

			#period 
			if ( finish != 0) $display("Error did not reset");
			
		end
        end
endmodule