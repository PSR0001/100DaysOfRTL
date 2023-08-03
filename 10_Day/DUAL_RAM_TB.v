`timescale 1ns / 1ps

module DUAL_RAM_TB();
localparam data_width=8, addr_width=4;

reg clk,we;
reg [addr_width - 1:0] addr_wr,addr_rd;
reg [data_width - 1:0] din;
wire [data_width - 1:0] dout;

dual_port_RAM#(.data_width(data_width), .addr_width(addr_width)
) U1(
        .clk(clk),
        .we(we),
        .addr_wr(addr_wr),
        .addr_rd(addr_rd),
        .din(din),
        .dout(dout)
);

always #5 clk = ~clk;
reg [addr_width-1:0] i;
initial begin
    clk=0;
    
    we=1;
    for(i=0;i<=6;i=i+1) begin
        addr_wr = i;
        din= 8'h00+i;
        #10;
    end
    #10;
    
    we=0;
    for(i=5;i>1;i=i-1) begin
        addr_rd = i;
        #10;
    end
    #10;
    $finish;
    $stop;
end

endmodule
