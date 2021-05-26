module IO_Interface (compressedData, inputSection ,enable, rst, clk);
parameter sectionSize = 4;
parameter rowSize = 16;
output reg [rowSize - 1 : 0] compressedData;
reg [rowSize - 1 : 0] compressedDataTmp;
input [sectionSize - 1 : 0] inputSection;
input enable;
input clk;
input rst;
integer i = 0;




always @(negedge clk) begin


if (enable) begin

    compressedDataTmp = 0;
    compressedDataTmp[sectionSize:0] = inputSection;
    if (i == 0)
        compressedData = compressedDataTmp;    
    else
        compressedData = (compressedDataTmp << i) + compressedData;
    i = i + sectionSize;

end

end

always @(negedge enable) begin

    compressedData = compressedData << rowSize - i;
    compressedData = compressedData >> rowSize - i;
    i = 0;
end

always @(negedge rst) begin
    compressedData = 0;
    i = 0;
end


endmodule