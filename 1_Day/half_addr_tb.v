`timescale 1ns / 1ps
/**************
Name: Partha Singha Roy
Date: 31-07-2023
***************/

module half_addr_tb();

reg a,b;
wire sum, carry;

half_adder U1(
    .a(a),
    .b(b),
    .sum(sum),
    .carry(carry)     
);

initial begin
a=0; b=0;
#10;
a=0; b=1;
#10;
a=1; b=0;
#10;
a=1; b=1;
#10;

$stop;
end
endmodule
