`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/12/04 13:52:34
// Design Name: 
// Module Name: scale50
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// scale clock by 1/50 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module scale50(
    input clk,
    input rst,
    output clk_scaled
    );
    reg [7:0] tmp_count;
    
    always @ (posedge clk)
    begin
        if(rst==1'b0)
            tmp_count <= 8'b0;
        else if (tmp_count == 8'd49)
           tmp_count <= 8'b0;
        else
            tmp_count <= tmp_count + 4'd1;
    end
    assign clk_scaled = tmp_count[7];
endmodule
