module pooling_testbench_RTL();

    localparam N = 5; 

    shortint image_in[0:4][0:4] ;
    reg start;
    reg [13:0] pixel_out;
    wire finish;

    localparam period = 100; 

    Pooling_2x2 POOL1  (start, image_in, finish, pixel_out);
    
    integer i,j,x,y;
    
    initial
    begin

      start = 0;
      #period
		  for(i=0; i<300; i=i+1) begin

        start = 1;
        // Set the input image
        for(x=0; x<N; x=x+1) begin
          for(y=0; y<N; y=y+1) begin
            image_in[x][y] = $urandom%100;
          end
        end

        #period;

        if ( ((image_in[0][0]+image_in[0][1]+image_in[1][0]+image_in[1][1])/4) != {2'b00,pixel_out}) $display("Error value in Pooling");
        if ( finish != 1) $display("Error did not finish");
        start = 0;

        #period 
        if ( finish != 0) $display("Error did not reset");
        
      end
    end
endmodule
