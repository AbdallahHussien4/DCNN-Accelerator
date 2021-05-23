module IO_Unit (load_process, rst, interrupt, clk, inputSection, cnn_img, done, dout);

parameter sectionSize = 4;
parameter rowSize = 16;

// parameter sectionSize = 16;
// parameter rowSize = 512;

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

output[3:0]dout;

Decompressor #(.sectionSize(sectionSize), .rowSize(rowSize)) decompressor (.compressedData(compressedData), .enable(de_en), .rst(rst), .decompressedData(decompressedData));
IO_Interface #(.sectionSize(sectionSize), .rowSize(rowSize)) interface (.compressedData(compressedData), .inputSection(inputSection) , .enable(in_en), .clk(clk), .rst(rst));
IO_Controller #() controller(.load(load_process), .io_interface_en(in_en), .decompressor_en(de_en), .interrupt(interrupt), .cnn_img(cnn_img));



endmodule
