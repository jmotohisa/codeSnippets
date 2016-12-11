`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/12/04 14:22:35
// Design Name: 
// Module Name: count16
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module count16(
    input clk,
    input enable,
    input rst,
    output [15:0] count16_out
    );
    reg [15:0] c_tmp=16'b0;
    
    always @(posedge clk)
        begin
            if(rst==1'b1)
                c_tmp <= 16'b0;
            else if(enable==1'b1)
                c_tmp <= c_tmp + 1'b1;
        end
 
    assign count16_out = c_tmp;
endmodule
