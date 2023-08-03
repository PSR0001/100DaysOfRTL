`timescale 1ns / 1ps
/**************
Name: Partha Singha Roy
Design: Mod M Counter
***************/
module modMcounter
#(parameter M=5,N=8)
(
    input wire clk,reset,
    output wire [N-1:0] count,
    output wire complete_tick
);

reg [N-1:0] count_reg;
wire [N-1:0] count_next;

always @ (posedge clk) begin
    if(reset)
        count_reg = 0;
    else
        count_reg = count_next;
end

assign count_next = (count_reg == M-1)? 0 : count_reg + 1;

assign complete_tick = (count_reg == M-1)? 1 : 0;

assign count = count_reg;
endmodule
