`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/12/04 13:32:39
// Design Name: 
// Module Name: top
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

module top(
		  input 	  clk,
		  input       btn0,
		  output [7:0] SEG,
		  output [3:0] an,
		  output [7:0] Led
		  );
	wire [15:0] count;	  
    wire enable;
    wire rst;
    wire [3:0] count_0;
    wire [3:0] count_1;
    wire [3:0] count_2;
    wire [3:0] count_3;
    wire [3:0] count_sel;
    wire clk2;
    wire clk2M;
    wire en_05s;
    wire clk1kHz;    

    scale50 scale50_0(
        .clk(clk),
        .rst(rst),
        .clk_scaled(clk2));
    
    en_gen_50MHz en_gen_50MHz_0(
        .clk(clk),
        .enable(enable),
        .kHz_enable(clk1kHz),
        .en_05s(en_05s));
    
    count16 count16_0(
        .clk(clk),
        .enable(enable),
        .rst(rst),
        .count16_out(count));
    
    hexTo7seg hexTo7seg_0(.hex_in(count_sel),.seg_out(SEG));
    
    sel7seg4 sel7seg4_0(
        .clk(clk),
        .enable(clk1kHz),
        .dig0(count_0),
        .dig1(count_1),
        .dig2(count_2),
        .dig3(count_3),
        .digout(count_sel),
        .sel(an));

    assign count_0 = count[3:0];
    assign count_1 = count[7:4];
    assign count_2 = count[11:8];
    assign count_3 = count[15:12];
    assign rst = btn0;
    assign Led[0] = clk2;
    assign Led[1] = en_05s;
    assign Led[7:2] = 6'b0;
    								 
endmodule
