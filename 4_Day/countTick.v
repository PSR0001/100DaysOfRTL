`timescale 1ns / 1ps

/**************
Name: Partha Singha Roy
Design: TestBench
***************/

module countTick();

localparam N=4;

reg clk,reset;
wire complete_tick;
wire [N-1:0] count;

binarycounter#(.N(N)) U1
(
    .clk(clk),
    .reset(reset),
    .complete_tick(complete_tick),
    .count(count)
);

always #5 clk = ~clk;
initial begin
    clk = 1'b0;
    reset = 1'b1;
    
    #10;
    reset = 1'b0;
    
    #600;   
    $finish;
    $stop;
end

endmodule
