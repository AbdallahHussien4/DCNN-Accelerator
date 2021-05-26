module IO_Controller (load, io_interface_en, decompressor_en, interrupt, cnn_img, dma_done, dma_enable, decompressor_done);

input load;
input cnn_img;
input interrupt;
output io_interface_en;
input dma_done;
input decompressor_done;
output reg dma_enable;
output decompressor_en;

assign io_interface_en = ~load && interrupt;
assign decompressor_en = load && interrupt && cnn_img;

always @(posedge dma_done) begin
    dma_enable = 0;
end

always @(posedge decompressor_done) begin
    dma_enable = 1;
end



endmodule