`timescale 1ns / 1ps
/**************
Name: Partha Singha Roy
Design: Binary Counter
***************/
module binarycounter
#(parameter N=8)
(
    input wire clk,
    input reset,
    output wire complete_tick,
    output wire [N-1:0] count
);

localparam MAX_COUNT = 2**N-1;

reg [N-1:0] count_reg;
wire [N-1:0] count_next;

always @ (posedge clk) begin
    if(reset)
        count_reg <=0;
    else
        count_reg = count_next; //assign the count next value
end

assign count_next = count_reg + 1; //increase count

//tick count
assign complete_tick = (count_reg == MAX_COUNT) ? 1 : 0;

assign count = count_reg;

endmodule
