module CNN (
    start,
    reset,
    finish,
    clk,
    filter,
    FB_index_bias,
    FB_output_bias,
    index_filter,
    DMA_start,
    DMA_finish, 
    DMA_start_address, 
    DMA_offset, 
    DMA_read_write_filter_bias, 
    DMA_filter_number, 
    DMA_CNN_output_data, 
    DMA_CNN_input_data
    );
    
    
    ////////////////////
    // INPUTS AND OUTPUTS
    ////////////////////
    input start, reset, clk, DMA_finish;
    input shortint filter [0:4][0:4];
    input shortint DMA_CNN_output_data [0:4][0:4];
    input shortint FB_output_bias;
    output shortint FB_index_bias, index_filter;
    output shortint DMA_CNN_input_data, DMA_start_address, DMA_offset, DMA_filter_number;
    output reg [1:0] DMA_read_write_filter_bias;
    output finish, DMA_start;

    
    ////////////////////
    // GLOBAL VARIABLES
    ////////////////////
    shortint featureMapNumber[0:5] = '{1, 6, 6, 16, 16, 120}; // 6
    shortint featureMapSize[0:6] = '{32, 28, 14, 10, 5, 1, 1}; // 32 28
    shortint filtersGroup[0:5] = '{6,0,16,0,120,0}; //6
    shortint filtersSizes[0:5] = '{6,0,96,0,1920,0}; //6

    reg finishCNN, poolingReset, convState, convReset, writeReset, DMA_start;
    int layerCounter, poolingCounter, convResetState;
    int poolingState, poolingWindowX, poolingWindowY;
    int kernelCounter, convWindowX, convWindowY, filterCounter;
    shortint convLocalResult;

    int filtersStartingAdress[0:4] = {0,-1,150,-1,2550};
    int biasStartingAdress[0:4] = {50550,-1,50556,-1,50572};
    int imageStartingAdress[0:5] = {50692,51716,56420,57596,59196,59596}; // {50692,51716,56420,57596,59196,59596, 59716}
    int fcStartingAdress = 59716;

    shortint readAdress , writeAdress, baseReadAdress;

    ////////////////////
    // OUTPUT ASSIGNS
    ////////////////////

    assign finish = finishCNN;
    
    ///////////////////////
    // PORTMAPS VARIABLES
    //////////////////////

    shortint conv_result, pooling_result;

    // Convolution Variables
    reg conv_start, conv_finish;

    // Pooling Variables
    reg pool_start, pool_finish;

    ///////////////////////
    // PORTMAPS
    //////////////////////

    conv CONV1 (DMA_CNN_output_data, filter , conv_start, conv_result, conv_finish);
    Pooling_2x2 #( .N (5))  POOL1  (pool_start, DMA_CNN_output_data, pool_finish, pooling_result);

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
            poolingReset = 0;
            convResetState = 0;
            kernelCounter = 0;
            convWindowX =0;
            convWindowY = 0;
            filterCounter = 0;
            convLocalResult = 0;
            index_filter = 0;
            convReset = 0;
            convState = 0;
            conv_start = 0;
            writeReset = 0;
            // Reset signals and counters
        end

        // Check if the CNN can start , if can check if we should wait until DMA finishes
        else if(start == 1'b1 & ((DMA_start == 1 & DMA_finish == 1) | (DMA_start == 0)))
        begin
            // Start layers loop
            if(layerCounter < 5 ) begin
                // layerCounter even = convolution, odd = pooling
                if (writeReset == 0) begin
                    writeAdress = imageStartingAdress[layerCounter + 1] - 1;
                    writeReset = 1;
                end
                /////////////////////////////////
                //// START CONVOLUTION
                //////////////////////////////// 
                if (layerCounter%2 == 0) begin
                    // READ FILTERS OF LAYER
                    if (convResetState == 0) begin
                        if (DMA_start == 0) begin
                            DMA_start_address = filtersStartingAdress[layerCounter];
                            DMA_offset = 5; 
                            DMA_read_write_filter_bias = 2; 
                            DMA_filter_number = filtersSizes[layerCounter];
                            DMA_start = 1;
                        end else begin
                            DMA_start = 0;
                            convResetState = 1;
                        end
                    // READ BIAS OF LAYER
                    end else if (convResetState == 1) begin
                        if (DMA_start == 0) begin
                            DMA_start_address = biasStartingAdress[layerCounter];
                            DMA_offset = 5; 
                            DMA_read_write_filter_bias = 2'b11;
                            DMA_start = 1;
                        end else begin
                            DMA_start = 0;
                            convResetState = 2;
                        end
                    // CONVOLUTION OF LAYER    
                    end else begin
                        if (kernelCounter < filtersGroup[layerCounter]) begin
                            if (convReset == 0) begin
                                baseReadAdress = imageStartingAdress[layerCounter];
                                readAdress = baseReadAdress - (featureMapSize[layerCounter] * featureMapSize[layerCounter]);
                                convReset =  1;
                            end
                            if (convWindowX < featureMapSize[layerCounter]-4) begin
                                if (convWindowY < featureMapSize[layerCounter]-4) begin
                                    if(filterCounter < featureMapNumber[layerCounter]) begin
                                        // load window for different images
                                        // apply convolution
                                        // Add result to previous conv result
                                        if(convState == 0) begin
                                            if (DMA_start == 0) begin
                                                readAdress = readAdress + (featureMapSize[layerCounter] * featureMapSize[layerCounter]);
                                                DMA_start_address = readAdress;
                                                DMA_offset = featureMapSize[layerCounter]; 
                                                DMA_read_write_filter_bias = 0; 
                                                DMA_start = 1;
                                            end else begin
                                                DMA_start = 0;
                                                convState = 1;    
                                            end
                                        end else begin
                                            index_filter = filterCounter +  kernelCounter * featureMapNumber[layerCounter];
                                            conv_start = 1;
                                            if (conv_finish == 1) begin
                                                conv_start = 0;
                                                convLocalResult += conv_result;
                                                filterCounter += 1;
                                                convState = 0;
                                            end 
                                        end
                                    end
                                    else begin
                                        // Add bias to conv result
                                        // save result to RAM 
                                        if(DMA_start == 0) begin
                                            FB_index_bias = kernelCounter;
                                            convLocalResult += FB_output_bias;
                                            writeAdress = writeAdress + 1;
                                            DMA_start_address = writeAdress;
                                            DMA_read_write_filter_bias = 1; 
                                            DMA_CNN_input_data = convLocalResult;
                                            DMA_start = 1;
                                        end else begin
                                            convLocalResult = 0;
                                            filterCounter = 0;
                                            convWindowY += 1;
                                            DMA_start = 0;
                                            baseReadAdress += 1;
                                            readAdress = baseReadAdress - (featureMapSize[layerCounter] * featureMapSize[layerCounter]);
                                        end
                                    end
                                end else begin
                                    convWindowY = 0;
                                    convWindowX += 1;
                                end
                            end else begin
                                convWindowX = 0;
                                convReset =  0;
                                kernelCounter += 1;
                            end
                        end else begin
                            kernelCounter = 0;
                            layerCounter += 1; 
                            convResetState = 0;
                            writeReset =  0;
                        end
                    end
                end


                /////////////////////////////////
                //// START POOLING
                //////////////////////////////// 
                else begin
                    // start pooling layer loop
                    if (poolingReset == 0) begin
                        readAdress = imageStartingAdress[layerCounter] - 2;
                        writeAdress = imageStartingAdress[layerCounter + 1] - 1;
                        poolingReset =  1;
                    end
                    if (poolingCounter < featureMapNumber[layerCounter]) begin
                        // $display(layerCounter, featureMapNumber[layerCounter]);
                        if (poolingWindowX < featureMapSize[layerCounter]-1) begin
                            if (poolingWindowY < featureMapSize[layerCounter]-1) begin
                                if(poolingState == 0) begin
                                    if (DMA_start == 0) begin
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
                                        pool_start = 0;
                                        poolingState = 2;
                                    end
                                end else begin
                                    DMA_start = 0;
                                    poolingWindowY += 2;
                                    poolingState = 0;
                                end
                            end else begin
                                poolingWindowY = 0;
                                readAdress = readAdress + featureMapSize[layerCounter];
                                poolingWindowX += 2;
                            end
                        end else begin
                            poolingWindowX = 0;
                            poolingCounter += 1;
                        end
                    end else begin
                        poolingCounter = 0;
                        layerCounter += 1;
                        poolingReset = 0;
                    end
                end
            end else begin
                finishCNN = 1;
            end
        end 
        else begin end
    end
endmodule