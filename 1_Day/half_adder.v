`timescale 1ns / 1ps
/**************
Name: Partha Singha Roy
Date: 31-07-2023
***************/

module half_adder(
    input a,b,
    output carry,sum
    );
    assign sum = a^b;
    assign carry = a&b;      
endmodule
