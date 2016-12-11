`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Junichi Motohisa
// 
// Create Date:    
// Design Name: 
// Module Name:  en_gen_50MHz
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description:enable gnerator (based on 50MHz clock)
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
					input  clk,             // clock (50MHz)
					output enable,          // enable (1sec)
					output kHz_enable,      // enable (~1kHz)
					output en_05s           // 0.5 sec clock
					);

   parameter SEC1_MAX = 50_000_000, // 50MHzの設定
	 MAX_CNT = 16'hFFFF; // KHzイネーブルの設定
   
   reg [25:0] 			   tmp_count = 26'h0; // 1秒カウンタ
   wire 				   enable_tmp; // 1秒イネーブル
   
   always @(posedge clk)
	 begin
		if (enable_tmp == 1'b1)
		  tmp_count <= 'b0;
		else
		  tmp_count <= tmp_count + 26'h1; // 1秒カウンタ
	 end
   
   assign enable_tmp = (tmp_count == (SEC1_MAX - 1)); // 50000000クロックに1回1を出力
   assign enable = enable_tmp;
   assign kHz_enable = (tmp_count[15:0] == MAX_CNT); // X"FFFF"に1回1を出力(たまに空振りする)
   assign en_05s = (tmp_count <= (SEC1_MAX/2 - 1)); // 0.5秒ごとに1, 0を繰り返す
   
endmodule
