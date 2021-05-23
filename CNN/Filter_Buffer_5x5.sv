module Filter_Buffer_5x5 (read, input_filter, finish, output_filter, index);

   input read;
   input shortint index;
   output finish;
   input shortint input_filter [4:0][4:0];
   output shortint output_filter [4:0][4:0];
  
   shortint buffer [1919:0][4:0][4:0];
   reg finish;

   always @(posedge(read))
     begin
	buffer[index] = input_filter;
	finish = 1;
    end
   always @(negedge(read))
     begin
	finish = 0;
    end

    assign output_filter = buffer[index];
endmodule