module booth_tb();
 	
   reg [7:0] A16, B16;
  wire [15:0] out32;
 
  Booth_Multiplier_Routing_8 DUT2 (
    .multiplicand(A16),
    .multiplier(B16),
    .product(out32)
  );

  initial begin
	$display("///////////////////////////////\nBooth Mult\n///////////////////////////////");
    A16 = 8'd0;
    B16 = 8'd5;
    #20
	if (out32 == 16'd0) $display ("0*5=0, Out is correct");
    else $error("It's wrong");

    A16 = 8'd100;
    B16 = 8'd12;
    #20
	if (out32 == 16'd1200) $display ("100*12=1200, Out is correct");
    else $error("It's wrong");
	
	A16 = 8'd90;
    B16 = 8'd4;
    #20
	if (out32 == 16'd360) $display ("90*4=360, Out is correct");
    else $error("It's wrong");
	
	A16 = 8'd85;
    B16 = 8'd30;
    #20
	if (out32 == 16'd2550) $display ("85*30=2550, Out is correct");
    else $error("It's wrong");
	
    $stop;
  end
 
endmodule