typedef shortint fixedPoint;
module conv (
  input fixedPoint window [0:4][0:4], filter [0:4][0:4],
  input start,
  output fixedPoint convResult,
  output finish
);
  int result;
  reg [31: 0] products [0:24];
  reg finish_temp;

  assign finish = finish_temp;

  genvar i, j;
    generate
        for (i=0; i < 5; i++) begin
          for (j=0; j < 5; j++) begin
          Booth_Multiplier #(16) booth(window[i][j], filter[i][j], products[i*5 + j]);
          end
        end
    endgenerate

  int k;
  always @(posedge(start)) begin
    for(k=0; k < 25; k+=1) begin
      result = result + products[k];
    end
    finish_temp = 1;
  end
  always @(negedge(start)) begin
    finish_temp = 0;
  end
// TODO:: Should take into consideration overflow if happened
  assign convResult = result[26:11];
endmodule