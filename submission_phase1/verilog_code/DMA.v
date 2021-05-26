module DMA(decompressedRow, cpuInput, cnn_img, dma_enable, ram_write, ram_enable, ram_address, output_to_ram, done, clk, rst,load);

parameter rowSize = 16;
parameter blockSize = 4;

input [rowSize - 1 : 0] decompressedRow;
reg [rowSize - 1 : 0] decompressedRowTMP;
input [blockSize - 1 : 0] cpuInput;
output reg ram_write;
output reg ram_enable;
output reg [15:0] ram_address;
output reg done;
output reg [blockSize - 1 : 0] output_to_ram;
input clk,rst,load, dma_enable, cnn_img;

integer next_address = 0;
integer start_address = 0;

always @(negedge clk) begin
    if(dma_enable)
    begin
        // IMG
        if(cnn_img) begin
            if(next_address - start_address >= rowSize / blockSize) begin
                done = 1;
                ram_enable = 1'b0;
                ram_write = 0;
                start_address = next_address;
            end
            else begin
                ram_address = next_address;
                ram_enable = 1'b1;
                ram_write = 1'b1;
                decompressedRowTMP = decompressedRow >> blockSize * (next_address - start_address);
                output_to_ram = decompressedRowTMP[blockSize - 1: 0];
                next_address = next_address + 1;
            end            
        end
        
        // CNN
        else begin
            ram_address = next_address;
            output_to_ram = cpuInput;
            ram_enable = 1'b1;
            ram_write = 1'b1;
            next_address = next_address + 1;
            start_address = next_address;
            done = 0;
        end
        
    end
end

always @(posedge rst) begin
    start_address = 0;
    next_address = 0;
    ram_write = 0;
    ram_enable =0;
    done =0;
end

always @(negedge load) begin
    done = 0;
end


endmodule