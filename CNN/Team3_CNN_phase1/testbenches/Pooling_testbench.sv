module pooling_testbench();

    localparam N = 5; 

    shortint image[0:N-1][0:N-1] ;
    reg start;
    shortint pixel_out;
    wire finish;

    localparam period = 100; 

    Pooling_2x2 #( .N (N))  POOL1  (start, image, finish, pixel_out);
    
    integer i,j,x,y;
    
    initial
        begin
		for(i=0; i<300; i=i+1) begin

			start = 1;
			// Set the input image
			for(x=0; x<N; x=x+1) begin
			for(y=0; y<N; y=y+1) begin
				image[x][y] = $urandom%100;
			end
			end

			#period;

			if ( (image[0][0]+image[0][1]+image[1][0]+image[1][1])/4 != pixel_out) $display("Error value in Pooling");
			if ( finish != 1) $display("Error did not finish");
			start = 0;

			#period 
			if ( finish != 0) $display("Error did not reset");
			
		end
        end
endmodule
