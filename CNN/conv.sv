typedef bit [15:0] fixedPoint;
module conv (
  input fixedPoint window [4:0][4:0], filter [4:0][4:0],
  input start,
  output fixedPoint convResult
);
  int result;
  reg [31: 0] products [24:0];
  initial begin
    result = 0;
    products = '{default:0};
  end

  genvar i, j;
    generate
        for (i=0; i < 5; i++) begin
          for (j=0; j < 5; j++) begin
          Booth_Multiplier #(16) booth(window[i][j], filter[i][j], products[i*5 + j]);
          end
        end
    endgenerate

  int k;
  always @(*) begin
    for(k=0; k < 25; k+=1) begin
      result = result + products[k];
    end
  end
// TODO:: Should take into consideration overflow if happened
  assign convResult = result[26:11];
endmodule