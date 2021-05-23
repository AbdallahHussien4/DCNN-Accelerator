module DMA (
    start, 
    finish_read, 
    clk, 
    address, 
    write, 
    RAM_bus, 
    RAM_address,
    RAM_write,
    data_read,
    dataBus, 
    imageSize, 
    pooling,
    image_input,
    next);
    
    input start, clk, pooling, RAM_write, data_read, next;
    input [4:0] imageSize;
    input [15:0] address;
    input [15:0] image_input [31:0][31:0];

    output write, finish_read;
    output [15:0] RAM_address;
    output [15:0] dataBus [4:0][4:0];

    inout [15:0] RAM_bus;
    
    
    
    reg [15:0] image [31:0][31:0];
    reg [15:0] RAM_bus_reg;
    reg [15:0] dataBus_reg [4:0][4:0];
    reg [15:0] RAM_address = address;
    reg finish = 1'b0, next;
    reg finish_read = 1'b0;
    int i,j;

    assign write = RAM_write;
    // =====================================
    // ===== Reading or writing to RAM =====
    // =====================================
    always @(negedge clk) begin
        if (start & !finish) begin
            if(RAM_write) begin
                for (i = 0; i < imageSize; i += 1) begin
                    for (j = 0; j < imageSize; i += 1) begin
                        RAM_bus_reg = image[i][j];
                        RAM_address += 1;
                    end
                end
                finish = 1'b1;
            end
            else begin
                for (i = 0; i < imageSize; i += 1) begin
                    for (j = 0; j < imageSize; i += 1) begin
                        image[i][j] = RAM_bus;
                        RAM_address += 1;
                    end
                end
                finish = 1'b1;
            end
        end
    end
    assign RAM_bus = RAM_bus_reg;



    always @(posedge finish) begin
        if (data_read) begin
            // ======================================
            // ===== sending filters and images =====
            // ======================================
            if(pooling) begin
                for(i = 0; i < imageSize-2; i+=2) begin
                    for (j= 0; j < imageSize-2; j+=2) begin
                        dataBus_reg[0][0] <= image[ i ][ j ];
                        dataBus_reg[0][1] <= image[ i ][j+1];
                        dataBus_reg[1][0] <= image[i+1][ j ];
                        dataBus_reg[1][1] <= image[i+1][j+1];
                        finish_read = 1;
                        wait(next == 1);
                    end
                end
                finish = 1'b0;
                finish_read = 1;
            end else begin
                for(i = 0; i < imageSize-5; i+=5) begin
                    for (j= 0; j < imageSize-5; j+=5) begin
                        dataBus_reg[0] <= {image[ i ][j], image[ i ][j+1], image[ i ][j+2], image[ i ][j+3], image[ i ][j+4]};
                        dataBus_reg[1] <= {image[i+1][j], image[i+1][j+1], image[i+1][j+2], image[i+1][j+3], image[i+1][j+4]};
                        dataBus_reg[2] <= {image[i+2][j], image[i+2][j+1], image[i+2][j+2], image[i+2][j+3], image[i+2][j+4]};
                        dataBus_reg[3] <= {image[i+3][j], image[i+3][j+1], image[i+3][j+2], image[i+3][j+3], image[i+3][j+4]};
                        dataBus_reg[4] <= {image[i+4][j], image[i+4][j+1], image[i+4][j+2], image[i+4][j+3], image[i+4][j+4]};
                        finish_read = 1;
                        wait(next == 1);
                    end
                end
                finish = 1'b0;
            end
        end else begin
            // ==========================
            // ===== Reading images =====
            // ==========================
            image = image_input;
            finish_read = 1;
            finish = 1'b0;
        end
    end
    assign dataBus = dataBus_reg;

    always @(negedge(start)) begin
        finish_read = 0;
    end

endmodule