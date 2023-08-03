`timescale 1ns / 1ps

module RAM_TB();

localparam data_width=8, addr_width=4;

reg clk,we;
reg [addr_width - 1:0] addr;
reg [data_width - 1:0] din;
wire [data_width - 1:0] dout;

single_port_RAM#(.data_width(data_width), .addr_width(addr_width)
) U1(
        .clk(clk),
        .we(we),
        .addr(addr),
        .din(din),
        .dout(dout)
);

always #5 clk = ~clk;
reg [addr_width-1:0] i;
initial begin
    clk=0;
    
    we=1;
    for(i=0;i<=5;i=i+1) begin
        addr = i;
        din= 8'h00+i;
        #10;
    end
    #10;
    
    we=0;
    for(i=5;i>0;i=i-1) begin
        addr = i;
        #10;
    end
    #10;
    $finish;
    $stop;
end

endmodule
