`timescale 1ns / 1ps
// Code your testbench here
// or browse Examples
module testbench; 
reg [3:0]in;
wire [4:0]light;
wire [3:0]state;
wire flag;
FSM_Project g1(.light(light),.in(in),.state(state),.flag(flag));
initial begin
in=4'b0000; #5;
#180 $finish;
end
always #20 in=in+1;
endmodule
