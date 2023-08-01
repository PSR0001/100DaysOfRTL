/**************
Name: Partha Singha Roy
Date: 01-08-2023
***************/
`timescale 1ns / 1ps

module half_addr_tb();

integer i;

reg [7:0] a_i,b_i;
reg sel;
wire [7:0] y_o;

mux U1(
    .a_i(a_i),
    .b_i(b_i),
    .sel(sel),
    .y_o(y_o)
    );

initial begin
    for(i=0; i<=10; i=i+1) begin
        a_i = 8'h00 + {$random}%(8'hff + 8'h00); //8 bit value in between 00 to FF
        b_i = 8'h00 + {$random}%(8'hff + 8'h00);
        sel = $random%2;
        #5;
    end
   $stop;
end


endmodule

