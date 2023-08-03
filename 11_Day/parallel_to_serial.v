`timescale 1ns / 1ps

module parallel_to_serial
#(parameter N=8)(
    input clk,reset,
    input wire [N-1:0] data_in,
    output reg empty_tick,
    output reg data_out
    );

reg [N-1:0] data_reg, data_next;
reg [N-1:0] count_reg, count_next;
reg empty_reg, empty_next;

always @ (posedge clk)
    empty_tick = empty_reg; 
 
always @(posedge clk, posedge reset)begin
    if(reset)begin
        count_reg <= 0;
        data_reg <= 0;
        empty_reg <= 1;
    end
    else begin
        count_reg <= count_next;
        data_reg <= data_next;
        empty_reg <= empty_next;
    end
end

always @* begin
    count_next = count_reg;
    data_reg = data_next;
    empty_reg = empty_next;
    
    data_out = data_reg[count_reg];
    
    if(count_reg == N-1) begin
        data_next = data_in;
        count_next = 0;
        empty_next = 1;
    end
    else begin
        count_next = count_reg +1;
        empty_next = 0;
    end
end
endmodule
