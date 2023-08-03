`timescale 1ns / 1ps

module single_port_RAM
#(parameter addr_width = 2, data_width=3)(
    input wire clk,we,
    input wire [addr_width - 1:0] addr,
    input wire [data_width - 1:0] din,
    output wire [data_width - 1:0] dout
    );
    
    //create the RAM
    reg [data_width - 1:0] single_port_ram [2**addr_width - 1:0];
    
always @ (posedge  clk) begin
    if(we)    
        single_port_ram [addr] <= din; //data write
end
assign dout = single_port_ram[addr];
endmodule
