module RAM (enable, clk, address, write, data);
	input clk, enable, write;
	input [15:0]address;
	inout data;

	reg [15:0] mem [100000:0];
	always @(posedge clk) begin
		if (enable & write) begin
			mem[address] = data;
		end
	end
	assign data = mem[address];
endmodule