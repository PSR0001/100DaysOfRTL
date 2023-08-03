`timescale 1ns / 1ps

module DFF_tb();

reg d,clk,reset; 
wire q;

DFF U1(
    .d(d),
    .clk(clk),
    .reset(reset),
    .q(q),
    .q_bar(q_bar)
);

always #3 clk = ~clk;

initial begin
    clk=1'b0;
    d=1'b0;
    reset =1'b1;
    #8;
    reset =1'b0;
    
    #13 ;
    d=1'b1;
    #20;
    d=1'b0;
    #30;
    d=1'b1;
    #35;
    d=1'b0;
    #60;
    d=1'b1;
    #65;
    d=1'b0;
    
    $stop;
    $finish;
end

endmodule
