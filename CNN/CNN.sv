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
    shortint featureMapNumber[0:5] = '{1, 6, 6, 16, 16, 120}; // 6
    shortint featureMapSize[0:6] = '{10, 28, 14, 10, 5, 1, 1}; // 32
    shortint filtersGroup[0:5] = '{1,0,16,0,120,0}; //6
    shortint filtersSizes[0:5] = '{1,0,96,0,1920,0}; //6

    reg finishCNN, poolingReset, convState, convReset;
    int layerCounter, poolingCounter, convResetState;
    int poolingState, poolingWindowX, poolingWindowY;
    int kernelCounter, convWindowX, convWindowY, filterCounter;
    shortint convLocalResult;

    int filtersStartingAdress[0:4] = {0,-1,150,-1,2550};
    int biasStartingAdress[0:4] = {50550,-1,50556,-1,50572};
    int imageStartingAdress[0:5] = {25,200,250,57596,59196,59596}; // {50692,51716,56420,57596,59196,59596}
    int fcStartingAdress = 59716;

    shortint readAdress , writeAdress, baseReadAdress;

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
    reg FB_filter_buffer_finish;
    reg FB_write, FB_bias_or_filter;
    shortint FB_index_filter, FB_index_bias, FB_output_bias, index_filter;
    shortint FB_filter [0:4][0:4];
    shortint FB_bias[0:119];


    ///////////////////////
    // PORTMAPS
    //////////////////////

    conv CONV1 (DMA_CNN_output_data, filter , conv_start, conv_result, conv_finish);
    Pooling_2x2 #( .N (5))  POOL1  (pool_start, DMA_CNN_output_data, pool_finish, pooling_result);
    Filter_Buffer_5x5 FILTER_BUFFER (
        FB_write, 
        FB_filter, 
        FB_filter_buffer_finish, 
        filter, 
        FB_index_filter, 
        FB_index_bias, 
        FB_bias, 
        FB_bias_or_filter, 
        FB_output_bias,
        reset,
        index_filter
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
        FB_bias_or_filter,
        FB_filter_buffer_finish
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
            // Reset signals and counters
        end

        // Check if the CNN can start , if can check if we should wait until DMA finishes
        else if(start == 1'b1 & ((DMA_start == 1 & DMA_finish == 1) | (DMA_start == 0)))
        begin
            // Start layers loop
            if(layerCounter < 5 ) begin
                // layerCounter even = convolution, odd = pooling
                
                /////////////////////////////////
                //// START CONVOLUTION
                //////////////////////////////// 
                if (layerCounter%2 == 0) begin
                    if (convReset == 0) begin
                        baseReadAdress = imageStartingAdress[layerCounter];
                        writeAdress = imageStartingAdress[layerCounter + 1] - 1;
                        readAdress = baseReadAdress - (featureMapSize[layerCounter] * featureMapSize[layerCounter]);
                        convReset =  1;
                    end
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
                                kernelCounter += 1;
                            end
                        end else begin
                            kernelCounter = 0;
                            layerCounter += 1; 
                            convReset =  0;
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