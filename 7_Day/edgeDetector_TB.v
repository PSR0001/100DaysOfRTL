`timescale 1ns / 1ps

module edgeDetector_TB();

reg clk,reset;
reg level;
wire Mealy_tick, Moore_tick;

edge_detector edgeDetector(
                    .clk(clk),
                    .reset(reset),
                    .level(level),
                    .Mealy_tick(Mealy_tick), 
                    .Moore_tick(Moore_tick)                  
);

always #5 clk=~clk;
always #20 level = ~level;

initial begin 
    clk<=0;
    reset <= 1;
    level<=0;
    #3;
    reset <=0;
    #200;
    $finish;
    $stop;
end
endmodule
