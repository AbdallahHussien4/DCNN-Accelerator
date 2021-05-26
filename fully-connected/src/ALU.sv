module ALU #(parameter SIZE=16, parameter PRECISION=11, parameter INPUT_SZ=4) (
  input [0: INPUT_SZ][SIZE-1: 0] i_values,
  input [1: 0] load_enable,
  input enable,
  input clear,

  output [SIZE-1: 0] value
);
  localparam LOAD_VALUES       = 2'd0;
  localparam LOAD_BIAS_WEIGHTS = 2'd1;
  localparam LOAD_UD           = 2'd2;

  reg [SIZE-1: 0] r_accumulator;
  reg [0: INPUT_SZ-1][SIZE-1: 0] r_weights;
  reg [0: INPUT_SZ-1][SIZE-1: 0] r_values;
  reg [SIZE-1: 0] r_bias;

  reg [2*SIZE-1: 0] product;

  always @(*) begin
    case (load_enable)
      LOAD_VALUES: r_values <= i_values[0: INPUT_SZ-1];

      // Load bias and weights
      LOAD_BIAS_WEIGHTS: begin
        r_bias <= i_values[0];
        r_weights <= i_values[1: INPUT_SZ];
      end

      default: /* default */;
    endcase

    if (clear) begin
      r_accumulator <= 0;
    end

    else if (enable) begin
      r_accumulator = 0;
      for (int i = 0; i < INPUT_SZ; i++) begin
        product = r_weights[i] * r_values[i];
        r_accumulator += product[PRECISION + SIZE - 1: PRECISION];
      end
      r_accumulator += r_bias;
    end
  end

  assign value = r_accumulator;
endmodule
