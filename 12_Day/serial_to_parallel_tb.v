`timescale 1ns / 1ps

module serial_to_parallel_tb();

localparam N=8;

reg clk,reset;
reg  data_in;
wire full_tick;
wire [N-1:0] data_out;

serial_to_parallel#(.N(N)) U1(
        .clk(clk),
        .reset(reset),
        .data_in(data_in),
        .full_tick(full_tick),
        .data_out(data_out)
);

always #2 clk=~clk;
integer i;

//Serial Data
reg [7:0] data=8'h69;
reg [7:0] data2=8'h0A;

initial begin
    clk = 0;
    reset = 1;
    #5;
    reset=0;
    data_in = 0;
    for(i=0;i<=8;i=i+1) begin
        data_in = data[i];
        #4;
    end
    data_in = 0;
    #60;
    for(i=0;i<=8;i=i+1) begin
        data_in = data2[i];
        #4;
    end
    data_in=0;
    #100;
    $finish;
end


endmodule
