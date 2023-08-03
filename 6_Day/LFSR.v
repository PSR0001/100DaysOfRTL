`timescale 1ns / 1ps

/*
    feedback function x^4 + x^3 + 1
    N = 4
    Maximun Length: 2^4 - 1 = 15
*/
module LFSR
#(parameter N=4)(
    input wire clk,reset,
    output [N:0] Q
    );
    
reg [N:0] r_reg;
wire [N:0] r_next;
wire feedback;
    
always @ (posedge clk, posedge reset) begin
    if(reset)
        r_reg <= 1;
     else
        r_reg = r_next;
end
//feedback
assign feedback = r_reg[4] + r_reg[3] + r_reg[0];

assign r_next = {feedback,r_reg[N:1]};
assign Q=r_reg;

endmodule
