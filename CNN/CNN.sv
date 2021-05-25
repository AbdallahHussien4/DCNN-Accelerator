module CNN (start,reset,finish,clk);
    
    
    ////////////////////
    // INPUTS AND OUTPUTS
    ////////////////////
    input start, reset;
    input clk;
    output finish;

    
    ////////////////////
    // GLOBAL VARIABLES
    ////////////////////
    reg[15:0] memoryReg;
    int state = 0;
    shortint featureMapNumber[0:5] = '{1, 6, 6, 16, 16, 120};
    shortint featureMapSize[0:6] = '{32, 28, 14, 10, 5, 1, 1};
    shortint filtersGroup[0:5] = '{6,0,16,0,120,0};
    shortint result;
    int sum;
    reg finishCNN;
    int layerCounter, poolingCounter;
    int poolingState, poolingWindowX, poolingWindowY;

    int filtersStartingAdress[0:2] = {0,150,2550};
    int biasStartingAdress[0:2] = {50550,50556,50572};
    int imageStartingAdress[0:5] = {50692,0,56420,57596,59196,59596};
    int fcStartingAdress = 59716;

    shortint readAdress , writeAdress;

    ////////////////////
    // OUTPUT ASSIGNS
    ////////////////////

    assign finish = finishCNN;
    
    ///////////////////////
    // PORTMAPS VARIABLES
    //////////////////////

    shortint filter [0:4][0:4];
    shortint conv_result, pooling_result;

    // Convolution Variables
    reg conv_start, conv_finish;

    // Pooling Variables
    reg pool_start, pool_finish;

    // DMA Variables
    shortint DMA_CNN_output_data [0:4][0:4];
    shortint DMA_CNN_input_data;
    reg DMA_start, DMA_finish, DMA_pooling, DMA_write_to_MEM, DMA_Write_OR_Read, DMA_next_window;
    shortint DMA_start_address, DMA_offset, DMA_filter_number;
    reg [1:0] DMA_read_write_filter_bias;

    // Memory Variables
    shortint Mem_input_data [0:4][0:4];
    reg Mem_finish, Mem_enable, Mem_write;
    shortint Mem_data, Mem_offset, Mem_output_data, Mem_address;

    // Filter Buffer Variables
    reg FB_filter_buffer_read, FB_filter_buffer_finish;
    reg FB_write, FB_bias_or_filter;
    shortint FB_index_filter, FB_index_bias, FB_output_bias;
    shortint FB_filter [0:4][0:4];
    shortint FB_bias[0:119];


    ///////////////////////
    // PORTMAPS
    //////////////////////

    conv CONV1 (DMA_CNN_output_data, filter , conv_start, conv_result, conv_finish);
    Pooling_2x2 #( .N (5))  POOL1  (pool_start, DMA_CNN_output_data, pool_finish, pooling_result);
    Filter_Buffer_5x5 FILTER_BUFFER (
        FB_filter_buffer_read, 
        FB_filter, 
        FB_filter_buffer_finish, 
        filter, 
        FB_index_filter, 
        FB_index_bias, 
        FB_bias, 
        FB_bias_or_filter, 
        FB_output_bias
        );
    DMA DMA1 (
        DMA_start,
        reset,
        DMA_finish, 
        clk, 
        DMA_start_address, 
        DMA_offset, 
        DMA_read_write_filter_bias, 
        DMA_filter_number, 
        DMA_CNN_output_data, 
        DMA_CNN_input_data,
        Mem_address, 
        Mem_offset, 
        Mem_write, 
        Mem_output_data,
        Mem_input_data,
        Mem_finish,
        Mem_enable,
        FB_write,
        FB_filter,
        FB_index_filter,
        FB_bias,
        FB_bias_or_filter
        );
    
    RAM RAM1 (Mem_enable, clk, Mem_address, Mem_write,Mem_input_data,Mem_offset,Mem_output_data,Mem_finish );


    ///////////////////////
    // MAIN LOGIC
    //////////////////////

    always @(posedge(clk)) begin
        if(reset == 1'b1) begin
            layerCounter = 0;
            poolingCounter = 0;
            finishCNN = 0;
            poolingState = 0;
            poolingWindowX = 0;
            poolingWindowY = 0;
            DMA_start = 0;
            // Reset signals and counters
        end

        // Check if the CNN can start , if can check if we should wait until DMA finishes
        else if(start == 1'b1 & ((DMA_start == 1 & DMA_finish == 1) | (DMA_start == 0)))
        begin
            // Start layers loop
            if(layerCounter < 5 ) begin
                // layerCounter even = convolution, odd = pooling
                if (layerCounter%2 == 0) begin
                    layerCounter += 1;
                end 
                else begin
                    // start pooling layer loop
                    if (poolingCounter == 0 & poolingWindowX == 0 & poolingWindowY == 0) begin
                        readAdress = imageStartingAdress[layerCounter] - 2;
                        writeAdress = imageStartingAdress[layerCounter + 1] - 1;
                    end
                    if (poolingCounter < featureMapNumber[layerCounter]) begin
                        // $display(layerCounter, featureMapNumber[layerCounter]);
                        if (poolingWindowX < featureMapSize[layerCounter]-1) begin
                            if (poolingWindowY < featureMapSize[layerCounter]-1) begin
                                if(poolingState == 0) begin
                                    if (DMA_start == 0) begin
                                        // TODO:: Rewrite the next instructions
                                        readAdress = readAdress + 2;
                                        DMA_start_address = readAdress;
                                        DMA_offset = featureMapSize[layerCounter]; 
                                        DMA_read_write_filter_bias = 0; 
                                        DMA_start = 1;
                                    end else begin
                                        poolingState = 1; 
                                        DMA_start = 0;
                                    end
                                end else if (poolingState == 1) begin
                                    pool_start = 1;
                                    if (pool_finish == 1) begin
                                        // Save Data to memory
                                        writeAdress = writeAdress + 1;
                                        DMA_start_address = writeAdress;
                                        DMA_read_write_filter_bias = 1; 
                                        DMA_CNN_input_data = pooling_result;
                                        DMA_start = 1;

                                        poolingState = 2;
                                    end
                                end else begin
                                    if (DMA_finish == 1) begin
                                        DMA_start = 0;
                                        poolingWindowY += 2;
                                        poolingState = 0;
                                    end
                                end
                            end else begin
                                poolingWindowY = 0;
                                DMA_start_address = DMA_start_address + featureMapSize[layerCounter];
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