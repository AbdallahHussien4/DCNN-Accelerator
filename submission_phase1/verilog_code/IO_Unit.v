module IO_Unit (load_process, rst, interrupt, clk, inputSection, cnn_img, done, cnn_enable);

parameter sectionSize = 16;
parameter rowSize = 512;

wire [rowSize - 1:0] decompressedData;
input [sectionSize - 1:0] inputSection;
input load_process;
input cnn_img;
input rst;
input interrupt;
input clk;
output done;
wire [rowSize - 1:0] compressedData;
wire de_en;
wire in_en;

wire dma_enable, ram_enable, ram_write, dma_done, decompressor_done;
wire [sectionSize - 1 : 0] output_to_ram;
wire [sectionSize - 1 : 0] ram_address;

output cnn_enable;


Decompressor #(.sectionSize(sectionSize), .rowSize(rowSize)) decompressor (.compressedData(compressedData), .enable(de_en), .rst(rst), .decompressedData(decompressedData));
IO_Interface #(.sectionSize(sectionSize), .rowSize(rowSize)) interface (.compressedData(compressedData), .inputSection(inputSection) , .enable(in_en), .clk(clk), .rst(rst));
IO_Controller #() controller(.load(load_process), .io_interface_en(in_en), .decompressor_en(de_en), .cnn_enable(cnn_enable), .interrupt(interrupt), .cnn_img(cnn_img), .done(done), .dma_enable(dma_enable), .dma_done(dma_done));

DMA  #(.rowSize(rowSize), .blockSize(sectionSize)) dma_1 (.decompressedRow(decompressedData), .dma_enable(dma_enable), .cnn_img(cnn_img), .cpuInput(inputSection), .ram_write(ram_write), .ram_enable(ram_enable), .ram_address(ram_address), .output_to_ram(output_to_ram), .done(dma_done), .clk(clk),.rst(rst),.load(load_process));
RAM #() ram_1 (.enable(ram_enable), .clk(clk), .address(ram_address), .write(ram_write), .input_data(output_to_ram), .output_data(), .finish(), .offset());


endmodule
