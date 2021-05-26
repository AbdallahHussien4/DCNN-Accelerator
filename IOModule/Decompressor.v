module Decompressor (compressedData, decompressedData, enable, rst, done);
parameter sectionSize = 4;
parameter rowSize = 16;
input [rowSize - 1 : 0] compressedData;
reg [rowSize - 1 : 0] compressedDataTmp;
reg [rowSize - 1 : 0] decompressedDataTmp;
output reg[rowSize - 1 : 0] decompressedData;
input enable;
input rst;
output reg done;
integer numberOfDigits;
integer totalDigits;
reg currentDigit;

always @(posedge enable) begin
    
    compressedDataTmp = compressedData;
    decompressedData = {rowSize{1'b0}};
    totalDigits = 0;
    currentDigit = 0;

    while (compressedDataTmp != 0) begin
        
        numberOfDigits = compressedDataTmp[sectionSize - 1:0];
        decompressedDataTmp = {rowSize { currentDigit } };
        decompressedDataTmp = decompressedDataTmp << rowSize - numberOfDigits;
        totalDigits = totalDigits + numberOfDigits;
        decompressedDataTmp = decompressedDataTmp >> rowSize - totalDigits;
        decompressedData = decompressedData + decompressedDataTmp;

        compressedDataTmp = compressedDataTmp >> sectionSize;
        currentDigit = ! currentDigit;
    end
    done = 1;
end    


always @(negedge rst) begin
    decompressedData = {rowSize{1'b0}};
    totalDigits = 0;
    currentDigit = 0;
    done = 0;
end 
endmodule