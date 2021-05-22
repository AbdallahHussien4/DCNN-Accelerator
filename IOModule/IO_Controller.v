module IO_Controller (load, io_interface_en, decompressor_en, interrupt, cnn_img);

input load;
input cnn_img;
input interrupt;
output io_interface_en;
output decompressor_en;

assign io_interface_en = ~load && interrupt;
assign decompressor_en = load && interrupt && cnn_img;
endmodule