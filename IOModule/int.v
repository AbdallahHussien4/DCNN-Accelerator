module INT_D (decompressedRow, dma_enable, clk, done);

parameter blockSize = 16;
parameter rowSize = 512;

// parameter blockSize = 16;
// parameter rowSize = 512;

input clk;
input dma_enable;
input [rowSize - 1:0] decompressedRow;
output done;
wire write;
wire ram_en;
wire finish;
wire [blockSize - 1 : 0] blockToWrite;
wire [15:0] offset;
wire [15:0] address;
DMA  #(.rowSize(rowSize), .blockSize(blockSize)) dma_1 (.decompressedRow(decompressedRow),.address(address) ,.dma_enable(dma_enable), .write(write), .ram_enable(ram_en),  .blockToWrite(blockToWrite), .done(done), .clk(clk), .finish(finish));
RAM #() ram_1 (.enable(ram_en), .clk(clk), .address(address), .write(write), .output_data(), .offset(offset), .input_data(blockToWrite), .finish(finish));

endmodule
