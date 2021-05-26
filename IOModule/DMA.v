module DMA(decompressedRow, dma_enable, ram_write, ram_enable, ram_address, output_to_ram, done, clk);

parameter rowSize = 16;
parameter blockSize = 4;

input [rowSize - 1 : 0] decompressedRow;
reg [rowSize - 1 : 0] decompressedRowTMP;
output reg ram_write;
output reg ram_enable;
output reg [15:0] ram_address;
output reg done;
output reg [blockSize - 1 : 0] output_to_ram;
input clk;
input dma_enable;

integer i = 0;

always @(negedge clk) begin
    if(dma_enable)
    begin
        ram_address = i;
        decompressedRowTMP = decompressedRow;
        if(i >= rowSize) begin
            done = 1;
            ram_enable = 1'b0;
            i = 0;
            ram_write = 0;
        end
        else begin
            ram_enable = 1'b1;
            ram_write = 1'b1;
            decompressedRowTMP = decompressedRowTMP >> (i * blockSize);
            output_to_ram = decompressedRowTMP[blockSize - 1: 0];
            i = i + 1;
        end
        
    end
end

endmodule