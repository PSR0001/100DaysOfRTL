`timescale 1ns / 1ps

module serial_to_parallel#(parameter N=8)(
    input wire clk,reset,
    input wire data_in,
    output wire full_tick,
    output reg [N-1:0] data_out
    );
    
reg [N-1:0] count_reg, count_next;
reg [N-1:0] data_reg, data_next;
reg full_reg, full_next;

assign full_tick = full_reg;

always @ (posedge clk, posedge reset) begin
    if(reset) begin
        full_reg <= 0;
        data_reg <= 0;
        count_reg <= 0;
    end
    else begin
        full_reg <= full_next;
        data_reg <= data_next;
        count_reg <= count_next;
    end
end

always @* begin
    count_next = count_reg;
    data_next = data_reg;
    full_next = full_reg;
    
    //serial to parallel
    data_next[count_reg] = data_in;
    
    if(count_reg == N-1) begin
        full_next = 1;
        count_next = 0;
        
        data_out = data_reg;
    end else begin
        count_next = count_reg + 1;
        full_next = 0;
    end
end
endmodule
