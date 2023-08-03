`timescale 1ns / 1ps
/**************
Name: Partha Singha Roy
Date: 01-08-2023
***************/
module DFF(
    input wire d,clk,reset, 
    output reg q,
    output q_bar    
    );

    assign q_bar=~q;
    
    always @ (posedge clk, posedge reset) begin
        if(reset)
            q<=1'b0;
        else
            q<=d;
    end 
endmodule