module RAM (enable, clk, address, write, output_data, offset, input_data, finish);
	input clk, enable, write;
	input reg[15:0] address, offset;
	input shortint input_data;

	output shortint output_data[0:4][0:4];
	output finish;

	shortint mem [0:1000000];
	reg finish_flag = 0;

	assign finish = finish_flag;

	initial begin
		$readmemh("MainMemory.mem",mem);
	end
	
	always @(negedge enable) begin
		finish_flag = 0;
	end

	always @(posedge clk) begin
		if (enable & write) begin
			mem[address] = input_data;
			finish_flag = 1;
		end
	end
	always @(negedge clk) begin
		if(enable & !write) begin
			output_data[0] <= mem[address +: 5];
			output_data[1] <= mem[address + (offset * 1) +: 5];
			output_data[2] <= mem[address + (offset * 2) +: 5];
			output_data[3] <= mem[address + (offset * 3) +: 5];
			output_data[4] <= mem[address + (offset * 4) +: 5];
			finish_flag = 1;
		end
	end
endmodule