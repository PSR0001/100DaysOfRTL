/**************
Name: Partha Singha Roy
Date: 01-08-2023
***************/
`timescale 1ns / 1ps

module mux(
    input wire [7:0] a_i,
    input wire [7:0] b_i,
    input wire sel,
    output wire [7:0] y_o
    );
    
    assign y_o = sel ? a_i : b_i;
    
endmodule

