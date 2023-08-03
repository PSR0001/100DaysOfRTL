`timescale 1ns / 1ps

module LFSR_TB();
localparam N=4;

reg clk,reset;
wire [N:0] Q;

LFSR U1(
    .clk(clk),
    .reset(reset),
    .Q(Q)
);

always #5 clk=~clk;

initial begin
    clk=0;
    reset = 1;
    #10;
    reset = 0;
    #150;
    $finish;
    $stop;  
end


endmodule
