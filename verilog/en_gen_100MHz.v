`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    
// Design Name:  Junichi Motohisa
// Module Name:  en_gen_100MHz
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description:enable gnerator (based on 100MHz clock)
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
// 
module en_gen_50MHz(
					input  clk,             // clock (100MHz)
					output enable,          // enable (1sec)
					output KHz_enable,      // enable (~1kHz)
					output en_05s           // 0.5 sec clock
					);

parameter SEC1_MAX = 100_000_000, // 100MHzの設定
		  MAX_CNT = 16'hFFFF; // KHzイネーブルの設定

reg [26:0] tmp_count = 27'h0; // 1秒カウンタ
wire ENABLE_tmp; // 1秒イネーブル

always @(posedge CLK)
begin
	if (ENABLE_tmp == 1'b1)
		tmp_count <= 'b0;
	else
		tmp_count <= tmp_count + 27'h1; // 1秒カウンタ
end

assign ENABLE_tmp = (tmp_count == (SEC1_MAX - 1)); // 100000000クロックに1回1を出力
assign ENABLE = ENABLE_tmp;
assign KHz_enable = (tmp_count[16:0] == MAX_CNT); // X"FFFF"に1回1を出力(たまに空振りする)
assign EN_05 = (tmp_count <= (SEC1_MAX/2 - 1)); // 0.5秒ごとに1, 0を繰り返す

endmodule
