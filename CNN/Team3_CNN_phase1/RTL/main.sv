module main (start,reset,finish,clk);
    
    ////////////////////
    // INPUTS AND OUTPUTS
    ////////////////////
    input start, reset;
    input clk;
    output finish;
    
    ///////////////////////
    // PORTMAPS VARIABLES
    //////////////////////

    shortint filter [0:4][0:4];

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

    CNN CNN1 (
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
endmodule