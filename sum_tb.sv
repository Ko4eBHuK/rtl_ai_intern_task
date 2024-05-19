`timescale 1 ns /1 ns
`include "Float32Add.v" // import 3rd party lib

module sum_tb;

	bit clk;
	always #1 clk = ~clk;

	logic [31:0] left_op, right_op;
	logic [31:0] actual_sum, expected_sum;
	logic [2:0] actual_status, expected_status;
	bit n_rst, mode, load_args;
	logic busy;

	Float32Add adder_under_test( // connect to module from 3rd party lib
		.CLK(clk),
		.nRST(n_rst),
		.leftArg(left_op),
		.rightArg(right_op),
		.addSub(mode),
		.loadArgs(load_args),
		.status(actual_status),
		.busy(busy),
		.sum(actual_sum)
	);

	initial begin
		left_op = 32'hF3; // equals 243 decimal
		right_op = 32'h13F72; // equals 81778 decimal
		expected_sum = 32'h14065; // expected sum is 82021
		expected_status = 3'b1; // expected status - all is fine
		mode = 1; // addition mode
		n_rst = 0; // idk what is the internal purpose of this reset flag

		#4 n_rst = 1; // set reset flag to high which means that 'reset' is not applying
		#2 load_args = 1; // tell module to read inputs
		#2 load_args = 0; // with command above, tell module to start computing
	end
endmodule
