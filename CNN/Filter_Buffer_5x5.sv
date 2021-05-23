module Filter_Buffer_5x5 (read, input_filter, finish, output_filter, index_buffer, index_bias, input_bias, bias_or_filter, output_bias);

    input read, bias_or_filter;
    input shortint index_bias, index_buffer;
    input shortint input_filter [4:0][4:0];
    input shortint input_bias[119:0];

    output shortint output_filter [4:0][4:0];
	output shortint output_bias;
    output finish;

    shortint buffer [1919:0][4:0][4:0];
    shortint bias_buffer [119:0];
    reg finish;

    always @(posedge(read))
    begin
        if(bias_or_filter == 1) begin
			buffer[index_buffer] = input_filter;
        	finish = 1;
        end
		else begin
			bias_buffer = input_bias;
		end
    end

    always @(negedge(read))
	begin
    	finish = 0;
	end

    assign output_filter = buffer[index_buffer];
	assign output_bias = bias_buffer[index_bias];
endmodule