module CNN (start,reset,finish,clk,DMADone,memorySave,image);
    input start, reset;
    input clk;
    input DMADone;
    input shortint image[31:0][31:0];
    output finish;
    output[15:0] memorySave;
    reg[15:0] memoryReg;

    
    shortint result;

    int state = 0;
    int featureMapNumber[5:0] = '{1, 6, 6, 16, 16, 120};
    int featureMapSize[6:0] = '{32, 28, 14, 10, 5, 1, 1};
    int filtersGroup[5:0] = '{6,0,16,0,120,0};

    int sum;
    reg finishCNN;

    assign finish = finishCNN;
    assign memorySave = memoryReg;

    // Inputs and Outputs of PORTMAPS
    reg [15:0] filter [4:0][4:0];
    reg [15:0] DMA_output [4:0][4:0];
    shortint window_result;
    reg conv_start, pool_start, filter_buffer_read, DMA_start;
    wire pool_finish, filter_buffer_finish, DMA_finish, conv_finish;
    reg Mem_enable, Mem_address, Mem_write, DMA_pooling, DMA_write_to_MEM, DMA_Write_OR_Read, DMA_next_window;
    reg [4:0] DMA_image_size;
    reg [15:0] DMA_start_address;
    reg [15:0] Mem_data;
    reg [15:0] intermediate_image [31:0][31:0];

    int layerCounter, poolingCounter;
    int poolingState, poolingWindowX, poolingWindowY;

    // PORT MAPS OF MODULES
    conv CONV1 (DMA_output, filter , conv_start, window_result, conv_finish);
    Pooling_2x2 #( .N (5))  POOL1  (pool_start, DMA_output, pool_finish, window_result);
    Filter_Buffer_5x5 FILTER_BUFFER (filter_buffer_read, DMA_output, filter_buffer_finish, filter);
    DMA DMA1 (DMA_start, DMA_finish, clk, DMA_start_address, Mem_write, Mem_data, Mem_address, DMA_write_to_MEM, DMA_Write_OR_Read, DMA_output, DMA_image_size, DMA_pooling, intermediate_image, DMA_next_window);
    RAM RAM1 (Mem_enable, clk, Mem_address, Mem_write, Mem_data);

    always @(posedge(clk)) begin
        if(reset == 1'b1) begin
            layerCounter = 0;
            poolingCounter = 0;
            finishCNN = 0;
            poolingState = 0;
            poolingWindowX = 0;
            poolingWindowY = 0;
            // Reset signals and counters
        end

        // Check if the CNN can start , if can check if we should wait until DMA finishes
        if(start == 1'b1 & ((DMA_start == 1 & DMA_finish == 1) | (DMA_start == 0)))
        begin
            // Start layers loop
            if(layerCounter < 6 ) begin
                // layerCounter even = convolution, odd = pooling
                if (layerCounter%2 == 0) begin
                    
                end 
                else begin
                    // start pooling layer loop
                    if (poolingCounter < featureMapNumber[layerCounter]) begin
                        if (poolingWindowX < featureMapSize[layerCounter]-1) begin
                            if (poolingWindowY < featureMapSize[layerCounter]-1) begin
                                if(poolingState == 0) begin
                                    if (DMA_start == 0) begin
                                        // TODO:: Rewrite the next instructions
                                        DMA_start = 1; DMA_start_address = DMA_start_address + 25; DMA_write_to_MEM = 0; DMA_Write_OR_Read = 1; DMA_image_size = 5'b00010; DMA_pooling = 1; DMA_next_window=0;
                                    end else begin
                                        poolingState = 1; 
                                        DMA_start = 0;
                                    end
                                end else if (poolingState == 1) begin
                                    pool_start = 1;
                                    if (pool_finish == 1) begin
                                        // Save Data to memory
                                        DMA_start = 1; DMA_start_address = 1000; DMA_write_to_MEM = 1; DMA_Write_OR_Read = 1; DMA_image_size = featureMapSize[layerCounter+1]; DMA_pooling = 0;
                                        poolingState = 2;
                                    end
                                end else begin
                                    DMA_start = 0;
                                    poolingWindowY += 2;
                                    poolingState = 0;
                                end
                            end else begin
                                poolingWindowY = 0;
                                poolingWindowX += 2;
                            end
                        end else begin
                            poolingWindowX = 0;
                            poolingCounter += 1;
                        end
                    end else begin
                        poolingCounter = 0;
                        layerCounter += 1;
                    end
                end
            end else begin
                finishCNN = 1;
            end
        end 
        else begin end
    end
endmodule