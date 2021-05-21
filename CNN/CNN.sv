module CNN (start,finish,DMADone,memorySave,image);
    input start;
    input DMADone;
    input shortint image[31:0][31:0];
    output finish;
    output[15:0] memorySave;
    reg[15:0] memoryReg;

    shortint window[4:0][4:0];
    shortint filter[4:0][4:0];
    
    shortint result;

    int state = 0;
    int featureMapNumber[5:0] = '{1, 6, 6, 16, 16, 120};
    int featureMapSize[5:0] = '{32, 28, 14, 10, 5, 1};
    int filtersGroup[5:0] = '{6,0,16,0,120,0};

    int sum;

    assign finish = start + DMADone;
    assign memorySave = memoryReg;

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
                        //read image
                        for (int x = 2; x < featureMapSize[layer]-2; x+=1) 
                        begin
                            for (int y = 2; y < featureMapSize[layer]-2; y+=1) 
                            begin
                                sum = 0;
                                for (int row = 0; row <5; row+=1) begin
                                    for (int col = 0; col < 5; col+=1) begin
                                        sum = sum + (filter[row][col] * image[x-2+row][y-2+col]);
                                    end
                                end
                                // save result in memory
                                memoryReg = sum[26:11];
                            end
                        end
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
                    //wait(DMADone == 1'b1);
                    // image = '{ 31{ 31{0} } };
                    for (int x = 0; x < featureMapSize[layer]-1; x+=2) 
                    begin
                        for (int y = 0; y < featureMapSize[layer]-1; y+=2) 
                        begin
                            result = (image[x][y] + image[x][y+1] + image[x+1][y] + image[x+1][y+1]) >> 2;
                            // save image
                            memoryReg = result;
                            //wait(DMADone);
                        end
                    end
                end
            end
        end
    end
endmodule