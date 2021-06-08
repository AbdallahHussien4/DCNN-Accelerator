module conv_tb();
 	
  shortint window[4:0][4:0], filter[4:0][4:0];
  bit [15:0] convResult;
  reg finish, start;
  conv DUT2 (
    .window(window),
    .filter(filter),
    .start(start),
    .convResult(convResult),
    .finish(finish)
  );

  initial begin
	$display("///////////////////////////////\nConvolution Module\n///////////////////////////////");
    window = '{'{2048, 2048, 2048, 2048, 2048}, '{2048, 2048, 2048, 2048, 2048}, '{2048, 2048, 2048, 2048, 2048}, '{2048, 2048, 2048, 2048, 2048}, '{2048, 2048, 2048, 2048, 2048}};
    filter = '{'{1024, 1024, 1024, 1024, 1024}, '{1024, 1024, 1024, 1024, 1024}, '{1024, 1024, 1024, 1024, 1024}, '{1024, 1024, 1024, 1024, 1024}, '{1024, 1024, 1024, 1024, 1024}};
    start = 0;
    #50ps
    start = 1;
    #50ps
	if (convResult == 16'b0110010000000000) $display ("Out is correct");
    else $error("It's wrong");
    $stop;
  end
 
endmodule