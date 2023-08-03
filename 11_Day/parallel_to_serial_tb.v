`timescale 1ns / 1ps

module parallel_to_serial_tb();
localparam N=8;

reg clk,reset;
reg [N-1:0] data_in;
wire empty_tick;
wire data_out;

parallel_to_serial#(.N(N)) U1(
        .clk(clk),
        .reset(reset),
        .data_in(data_in),
        .empty_tick(empty_tick),
        .data_out(data_out)
);

always #2 clk=~clk;

initial begin
    clk = 0;
    reset = 1;
    data_in =  8'b00100110;
    #1;
    
    reset=0;
    #32;
    
    data_in = 8'b11110000;
    #32;
    
    data_in = 8'b00000000;
    #100;
    $finish;
end

endmodule
