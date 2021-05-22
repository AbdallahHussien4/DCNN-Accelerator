module conv_tb();
 	
  bit [15:0] window[4:0][4:0], filter[4:0][4:0];
  bit [15:0] convResult;
 
  conv DUT2 (
    .window(window),
    .filter(filter),
    .start(1'b1),
    .convResult(convResult)
  );

  initial begin
	$display("///////////////////////////////\nConvolution Module\n///////////////////////////////");
    window = '{'{2048, 2048, 2048, 2048, 2048}, '{2048, 2048, 2048, 2048, 2048}, '{2048, 2048, 2048, 2048, 2048}, '{2048, 2048, 2048, 2048, 2048}, '{2048, 2048, 2048, 2048, 2048}};
    filter = '{'{1024, 1024, 1024, 1024, 1024}, '{1024, 1024, 1024, 1024, 1024}, '{1024, 1024, 1024, 1024, 1024}, '{1024, 1024, 1024, 1024, 1024}, '{1024, 1024, 1024, 1024, 1024}};
    #20
	if (convResult == 16'b0110010000000000) $display ("Out is correct");
    else $error("It's wrong");
    $stop;
  end
 
endmodule