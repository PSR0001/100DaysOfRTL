`timescale 1ns / 1ps

module dual_port_RAM
#(parameter addr_width = 2, data_width=3)(
    input wire clk,we,
    input wire [addr_width - 1:0] addr_wr,addr_rd,
    input wire [data_width - 1:0] din,
    output wire [data_width - 1:0] dout
);
    
    //create the RAM
    reg [data_width - 1:0] dual_port_ram [2**addr_width - 1:0];
    
always @ (posedge  clk) begin
    if(we)    
        dual_port_ram [addr_wr] <= din; //data write
end
assign dout = dual_port_ram[addr_rd];
endmodule


`timescale 1ns / 1ps


