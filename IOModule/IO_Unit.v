module IO_Unit (load, rst, interrupt, clk, inputSection, decompressedData, cnn_img, done);

parameter sectionSize = 4;
parameter rowSize = 16;

input [rowSize - 1:0] decompressedData;
input [sectionSize - 1:0] inputSection;
input load;
input cnn_img;
input rst;
input interrupt;
input clk;
output done;
wire [rowSize - 1:0] compressedData;
wire de_en;
wire in_en;


Decompressor #(.sectionSize(sectionSize), .rowSize(rowSize)) decompressor (.compressedData(compressedData), .decompressedData(decompressedData), .enable(de_en), .rst(rst));
IO_Interface #(.sectionSize(sectionSize), .rowSize(rowSize)) interface (.compressedData(compressedData), .inputSection(inputSection) , .enable(in_en), .clk(clk), .rst(rst));
IO_Controller #() controller(.load(load), .io_interface_en(in_en), .decompressor_en(de_en), .interrupt(interrupt), .cnn_img(cnn_img));



endmodule
