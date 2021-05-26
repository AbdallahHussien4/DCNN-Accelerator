module Decompressor (compressedData, decompressedData, enable, rst);
parameter sectionSize = 4;
parameter rowSize = 16;
input [rowSize - 1 : 0] compressedData;
reg [rowSize - 1 : 0] compressedDataTmp;
output reg[rowSize - 1 : 0] decompressedData;
reg[rowSize - 1 : 0] decompressedDataTmp;
input enable;
input rst;
integer numberOfDigits;
reg currentDigit;

always @(posedge enable) begin
    
    compressedDataTmp = compressedData;
    decompressedData = {rowSize{1'b0}};
    currentDigit = 0;

    while (compressedDataTmp != 0) begin
        
        numberOfDigits = compressedDataTmp[sectionSize - 1:0];
        decompressedDataTmp = {rowSize { currentDigit } };
        decompressedDataTmp = decompressedDataTmp >> (rowSize - numberOfDigits);
        decompressedData = (decompressedData << numberOfDigits) + decompressedDataTmp;
        compressedDataTmp = compressedDataTmp >> sectionSize;
        currentDigit = ! currentDigit;
    end
end    


always @(posedge rst) begin
    decompressedData = {rowSize{1'b0}};
    currentDigit = 0;
end 
endmodule