module DMA (
    start,
    reset,
    finish_read,
    clk,
    address,
    offset,
    read_write_filter_bias,
    filter_number,
    CNN_output_data,
    CNN_input_data,
    RAM_address,
    RAM_offset,
    RAM_write,
    RAM_output_data,
    RAM_input_data,
    RAM_finish,
    RAM_enable,
    FB_write,
    FB_filter,
    FB_index_filter,
    FB_bias,
    FB_bias_or_filter,
    FB_finish);
    
    input start, clk, reset, RAM_finish, FB_finish;
    input [1:0] read_write_filter_bias;
    input shortint address, filter_number;
    input shortint offset;
    input shortint CNN_input_data;
    input shortint RAM_input_data [0:4][0:4];

    output RAM_write, finish_read, RAM_enable;
    output shortint RAM_address, RAM_offset;
    output shortint RAM_output_data ;
    output shortint CNN_output_data [0:4][0:4];

    output FB_write, FB_bias_or_filter;
    output shortint FB_index_filter;
    output shortint FB_filter [0:4][0:4];
    output shortint FB_bias[0:119];

    reg RAM_write, finish_read, RAM_enable, FB_bias_or_filter, FB_write;
    shortint inner_address;
    shortint bias[0:119];
    int biasCounter, filter_index, temp;
    
    
    assign RAM_offset = offset;
    
    always @(reset) begin
        RAM_enable = 0;
        RAM_write = 0;
        finish_read = 0;
        FB_write = 0;
        biasCounter = 0;
    end

    always @(negedge clk) begin
        if(start & read_write_filter_bias == 2'b01) begin
            
            if(RAM_finish == 1'b1) begin
                finish_read = 1;
                RAM_enable = 0;
            end else
            RAM_write = 1;
            RAM_address = address;
            RAM_output_data = CNN_input_data;
            RAM_enable = 1;
        end
    end   

    always @(posedge clk) begin
        if (start) begin
            if (read_write_filter_bias == 2'b00) begin
                RAM_write = 0;
                RAM_address = address;
                RAM_enable = 1;

                if(RAM_finish == 1'b1) begin
                    CNN_output_data = RAM_input_data;
                    finish_read = 1;
                    RAM_enable = 0;
                end
            end else if (read_write_filter_bias == 2'b10) begin
                if (filter_index < filter_number) begin
                    if (filter_index == 0) begin
                        inner_address = address;
                    end

                    RAM_write = 0;
                    RAM_enable = 1;
                    RAM_address = inner_address;

                    if(RAM_finish == 1'b1) begin
                        FB_bias_or_filter = 1;
                        FB_filter = RAM_input_data;
                        FB_index_filter = filter_index;
                        FB_write = 1;
                        RAM_enable = 0;
                        if (FB_finish == 1) begin
                            FB_write = 0;
                            filter_index += 1;
                            inner_address += 25;
                        end
                    end
                end else begin
                    filter_index = 0;
                    finish_read = 1;
                end
            end else if (read_write_filter_bias == 2'b11) begin
                if(biasCounter < 5) begin

                    if (biasCounter == 0) begin
                        inner_address = address;
                    end
                    RAM_enable = 1;
                    RAM_write = 0;
                    RAM_address = inner_address;

                    if(biasCounter < 4) begin
                        if(RAM_finish == 1'b1) begin
                            temp= (biasCounter * 25);
                            bias[temp] = RAM_input_data[0][0];
                            bias[temp + 1] = RAM_input_data[0][1];
                            bias[temp + 2] = RAM_input_data[0][2];
                            bias[temp + 3] = RAM_input_data[0][3];
                            bias[temp + 4] = RAM_input_data[0][4];
                            bias[temp + 5] = RAM_input_data[1][0];
                            bias[temp + 6] = RAM_input_data[1][1];
                            bias[temp + 7] = RAM_input_data[1][2];
                            bias[temp + 8] = RAM_input_data[1][3];
                            bias[temp + 9] = RAM_input_data[1][4];
                            bias[temp + 10] = RAM_input_data[2][0];
                            bias[temp + 11] = RAM_input_data[2][1];
                            bias[temp + 12] = RAM_input_data[2][2];
                            bias[temp + 13] = RAM_input_data[2][3];
                            bias[temp + 14] = RAM_input_data[2][4];
                            bias[temp + 15] = RAM_input_data[3][0];
                            bias[temp + 16] = RAM_input_data[3][1];
                            bias[temp + 17] = RAM_input_data[3][2];
                            bias[temp + 18] = RAM_input_data[3][3];
                            bias[temp + 19] = RAM_input_data[3][4];
                            bias[temp + 20] = RAM_input_data[4][0];
                            bias[temp + 21] = RAM_input_data[4][1];
                            bias[temp + 22] = RAM_input_data[4][2];
                            bias[temp + 23] = RAM_input_data[4][3];
                            bias[temp + 24] = RAM_input_data[4][4];
                            biasCounter += 1;
                            inner_address += 25;
                            RAM_enable = 0;
                        end
                    end else begin
                        if(RAM_finish == 1'b1) begin
                            temp= (biasCounter * 25);
                            bias[temp] = RAM_input_data[0][0];
                            bias[temp + 1] = RAM_input_data[0][1];
                            bias[temp + 2] = RAM_input_data[0][2];
                            bias[temp + 3] = RAM_input_data[0][3];
                            bias[temp + 4] = RAM_input_data[0][4];
                            bias[temp + 5] = RAM_input_data[1][0];
                            bias[temp + 6] = RAM_input_data[1][1];
                            bias[temp + 7] = RAM_input_data[1][2];
                            bias[temp + 8] = RAM_input_data[1][3];
                            bias[temp + 9] = RAM_input_data[1][4];
                            bias[temp + 10] = RAM_input_data[2][0];
                            bias[temp + 11] = RAM_input_data[2][1];
                            bias[temp + 12] = RAM_input_data[2][2];
                            bias[temp + 13] = RAM_input_data[2][3];
                            bias[temp + 14] = RAM_input_data[2][4];
                            bias[temp + 15] = RAM_input_data[3][0];
                            bias[temp + 16] = RAM_input_data[3][1];
                            bias[temp + 17] = RAM_input_data[3][2];
                            bias[temp + 18] = RAM_input_data[3][3];
                            bias[temp + 19] = RAM_input_data[3][4];
                            RAM_enable = 0;

                            FB_bias_or_filter = 0;
                            FB_bias = bias;
                            FB_write = 1;

                            if (FB_finish == 1) begin
                                biasCounter += 1;
                                FB_write = 0;
                            end
                        end
                    end
                end else begin 
                    finish_read = 1;
                    biasCounter = 0;
                end
            end
        end
    end

    always @(negedge start) begin
        finish_read = 0;
        RAM_enable = 0;
    end
endmodule