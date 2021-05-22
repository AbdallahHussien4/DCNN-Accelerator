module CNN (start,finish,clk,DMADone,memorySave,image);
    input start;
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

    assign finish = start + DMADone;
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

    // PORT MAPS OF MODULES
    conv CONV1 (DMA_output, filter , conv_start, window_result, conv_finish);
    Pooling_2x2 #( .N (5))  POOL1  (pool_start, DMA_output, pool_finish, window_result);
    Filter_Buffer_5x5 FILTER_BUFFER (filter_buffer_read, DMA_output, filter_buffer_finish, filter);
    DMA DMA1 (DMA_start, DMA_finish, clk, DMA_start_address, Mem_write, Mem_data, Mem_address, DMA_write_to_MEM, DMA_Write_OR_Read, DMA_output, DMA_image_size, DMA_pooling, intermediate_image, DMA_next_window);
    RAM RAM1 (Mem_enable, clk, Mem_address, Mem_write, Mem_data);

    always @(start) begin
        for(int layer=0; layer<6; layer+=1)
        begin
            if (layer%2 == 0)
            begin
                // Convolution Layer
                // ----------------------------
                // get number of filters of this layer
                // get number of feature maps that enter the layer to know how many filters to be grouped together
                // for each group of filters
                //   for each filter in group
                //     Read filter
                //     Read the image 
                //     for each window in image
                //      apply parallel multiplication
                //      sum the output
                //      read the data from the memory if it's not the first one in the group then add the data to the ouput
                //      save the data to the memory
                for (int group = 0; group < filtersGroup[layer] ; group+=1) begin
                    for (int filterIndex = 0;filterIndex < featureMapNumber[layer] ; filterIndex +=1 ) begin
                        //read filter
                        // Send to DMA to read filter
                        DMA_start = 1; DMA_start_address = 0; DMA_write_to_MEM = 0; DMA_Write_OR_Read = 1; DMA_image_size = 5'b00101; DMA_pooling = 0;
                        wait( DMA_finish == 1 );
                        DMA_start = 0;
                        // Get the values and save in filter buffer
                        filter_buffer_read = 1;
                        wait(filter_buffer_finish == 1);
                        filter_buffer_read = 0;


                        // Send to DMA to read Image
                        DMA_start = 1; DMA_start_address = DMA_start_address + 25; DMA_write_to_MEM = 0; DMA_Write_OR_Read = 1; DMA_image_size = 5'b11111; DMA_pooling = 0;
                        wait( DMA_finish == 1 );
                        DMA_start = 0;   

                        for (int x = 2; x < featureMapSize[layer]-2; x+=1) 
                        begin
                            for (int y = 2; y < featureMapSize[layer]-2; y+=1) 
                            begin
                                DMA_next_window = 0;
                                // Replace with convolve signals
                                conv_start = 1;
                                wait(conv_finish == 1);
                                conv_start = 0;
                                
                                DMA_next_window = 1;
                                // Save intermediate value before DMA 
                                intermediate_image[x-2][y-2] = window_result;
                            
                            end
                        end
                        // Send Signal to DMA to write to memory
                        // save result in memory
                        // @TODO change the DMA Bus to write a given max size of the image
                        DMA_start = 1; DMA_start_address = 1000; DMA_write_to_MEM = 1; DMA_Write_OR_Read = 1; DMA_image_size = 5'b00101; DMA_pooling = 0;
                        wait( DMA_finish == 1 );
                        DMA_start = 0;
                    
                    end
                end
            end
            else begin
                // Pooling Layer
                // ----------------------------
                // number of feature maps in this layer
                // for each feature map
                //   Read The image
                //   for each window in image
                //     calculate avg
                //     save window
                for(int j = 0; j < featureMapNumber[layer]; j+=1)
                begin
                    
                    // read image
                        // Send to DMA to read Image
                    DMA_start = 1; DMA_start_address = DMA_start_address + 25; DMA_write_to_MEM = 0; DMA_Write_OR_Read = 1; DMA_image_size = 5'b00010; DMA_pooling = 1; DMA_next_window=0;
                    wait( DMA_finish == 1 );
                    DMA_start = 0;

                    for (int x = 0; x < featureMapSize[layer]-1; x+=2) 
                    begin
                        for (int y = 0; y < featureMapSize[layer]-1; y+=2) 
                        begin
                            DMA_next_window = 0;
                            //result = (image[x][y] + image[x][y+1] + image[x+1][y] + image[x+1][y+1]) >> 2;
                            // Send signals to pooling layer
                            pool_start = 1; 
                            wait(pool_finish == 1);
                            pool_start = 0; 
                            DMA_next_window = 1;

                            intermediate_image[x][y] = window_result;    
                        end
                    end
                    // save result in memory
                        // Send to DMA again
                    DMA_start = 1; DMA_start_address = 1000; DMA_write_to_MEM = 1; DMA_Write_OR_Read = 1; DMA_image_size = featureMapSize[layer+1]; DMA_pooling = 0;
                    wait( DMA_finish == 1 );
                    DMA_start = 0;
                end
            end
        end
    end
endmodule