module series_sum(
    input logic clk,
    input logic rst,
    input logic sum_request,
    input logic [31:0] item,
    output logic [2:0] exception,
    output logic busy,
    output logic [31:0] result_sum
);

    logic [31:0] inner_sum;
    logic adder_busy;

    Float32Add adder(
        .CLK(clk),
		.nRST(rst),
		.leftArg(sum),
		.rightArg(item),
		.addSub(1'b1),
		.loadArgs(sum_request),
		.status(exception),
		.busy(adder_busy),
		.sum(inner_sum)
    );

    always @(posedge clk or negedge rst) begin
        if(!rst) begin
            inner_sum <= 32'h0;
            busy <= 0;
            exception <= 3'b0;
        end else begin
            if(inner_sum != result_sum) begin

            end else begin
                
            end
        end
    end

endmodule
