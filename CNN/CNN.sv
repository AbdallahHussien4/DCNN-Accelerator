module CNN (clk,start,finish);
    input clk;
    input start;
    output finish;

    shortint window[4:0][4:0];
    shortint filter[4:0][4:0];
    int state = 0;
    
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
                end
            else 
                begin
                    // Pooling Layer
                    // ----------------------------
                    // number of feature maps in this layer
                    // for each feature map
                    //   Read The image
                    //   for each window in image
                    //     calculate avg
                    //     save window
                end
        end
endmodule