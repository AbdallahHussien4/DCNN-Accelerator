module Pooling_2x2 #(parameter N=5) (start, image_in, finish, pixel_out);

    input shortint image_in [0:N-1][0:N-1];
    input start;
    output reg[15:0] pixel_out;
    output finish;

    
    always @(image_in[0][0] , image_in[0][1] , image_in[1][0] , image_in[1][1] , start) begin

        if (start) begin
            pixel_out = (image_in[0][0] + image_in[0][1] + image_in[1][0] + image_in[1][1]) >> 2;
        end
        else begin
            pixel_out = 0;
        end
    end

    assign finish = start;

endmodule