`timescale 1 ns /100 ps

module series_sum_tb;

	bit clk;
	always #1 clk = ~clk;

    logic [9:0][31:0] series;
    int item_index;
    logic [31:0] expected_sum, actual_sum;
    
    logic rst;
    logic sum_request;
    logic [2:0] status;
    logic busy;

    series_sum ssdut(
        .clk(clk),
        .rst(rst),
        .sum_request(sum_request),
        .item(series[item_index]),
        .status(status),
        .busy(busy),
        .sum(actual_sum)
    );

    initial begin
        // fill series
        series[0] = 32'h1;
        series[1] = 32'h2;
        series[2] = 32'h3;
        series[3] = 32'h4;
        series[4] = 32'h5;
        series[5] = 32'h6;
        series[6] = 32'h7;
        series[7] = 32'h8;
        series[8] = 32'h9;
        series[9] = 32'hA;

        expected_sum = 32'h37;

        rst = 0;
		#2 n_rst = 1;
    end



    always @(posedge clk) begin
        if 
    end

endmodule
