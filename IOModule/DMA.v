module DMA(decompressedRow, dma_enable, write, ram_enable, address, blockToWrite, done, clk, finish);

parameter rowSize = 16;
parameter blockSize = 4;

input [rowSize - 1 : 0] decompressedRow;
reg [rowSize - 1 : 0] decompressedRowTMP;
output reg write;
output reg ram_enable;
output reg [15:0] address;
output reg done;
output reg [blockSize - 1 : 0] blockToWrite;
input clk;
input dma_enable;
input finish;

integer i = 0;

always @(negedge clk) begin
    address = i;
    decompressedRowTMP = decompressedRow;
    if(i >= rowSize) begin
        done = 1;
        ram_enable = 1'b0;
    end
    else begin
        ram_enable = 1'b1;
        write = 1'b1;
        decompressedRowTMP = decompressedRowTMP >> (i * blockSize);
        blockToWrite = decompressedRowTMP[blockSize - 1: 0];
        i = i + 1;
    end

end

endmodule


//     always @(negedge clk) begin
        
//         if (i == 0) begin
//             decompressedRowTMP = decompressedRow;
//         end

            
//         if(finish == 1'b1) begin
//                 ram_enable = 0;
//                 decompressedRowTMP = decompressedRowTMP >> blockSize;
//             end

//         else if(dma_enable) begin
//             write = 1;
//             address = address;
//             ram_enable = 1;
//             blockToWrite = decompressedRowTMP[blockSize - 1: 0];

//         end
//     end

//     always @(negedge dma_enable) begin
//         ram_enable = 0;
//     end

// endmodule