module Pooling_2x2 #(parameter N=5) (start, image_in, finish, pixel_out);

   input shortint image_in [0:N-1][0:N-1];
   input start;
   output shortint pixel_out;
   output finish;
   reg finish_done;

    assign finish = finish_done;
   always @(*)
     begin
    if(start)
        begin
        pixel_out = (image_in[0][0] + image_in[0][1] + image_in[1][0] + image_in[1][1]) >> 2;
        finish_done = 1;
        end
        else begin
        finish_done = 0;
        end
    end
    
endmodule