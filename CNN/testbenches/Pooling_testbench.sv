module pooling_testbench();

    localparam N = 5; 

    shortint image_in[0:4][0:4] ;
    reg start;
    shortint pixel_out;
    wire finish;

    localparam period = 100; 

    Pooling_2x2_Synth POOL1  (start, image_in[0][0] , image_in[0][1] , image_in[0][2] , 
      image_in[0][3] , image_in[0][4] , image_in[1][0] , image_in[1][1] , 
      image_in[1][2] , image_in[1][3] , image_in[1][4] , image_in[2][0] , 
      image_in[2][1] , image_in[2][2] , image_in[2][3] , image_in[2][4] , 
      image_in[3][0] , image_in[3][1] , image_in[3][2] , image_in[3][3] , 
      image_in[3][4] , image_in[4][0] , image_in[4][1] , image_in[4][2] , 
      image_in[4][3] , image_in[4][4] , finish, pixel_out);
    
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

        if ( (image_in[0][0]+image_in[0][1]+image_in[1][0]+image_in[1][1])/4 != pixel_out) $display("Error value in Pooling");
        if ( finish != 1) $display("Error did not finish");
        start = 0;

        #period 
        if ( finish != 0) $display("Error did not reset");
        
      end
    end
endmodule
