module Pooling_2x2 #(parameter N=5) (start, image_in, finish, pixel_out);

    input shortint image_in [0:N-1][0:N-1];
    input start;
    output reg[13:0] pixel_out;
    output finish;
    shortint intermediate_pixel_out;

    assign intermediate_pixel_out = (image_in[0][0] + image_in[0][1] + image_in[1][0] + image_in[1][1]) >> 2;
    
    assign finish = start;
    assign pixel_out = intermediate_pixel_out[13:0];

endmodule