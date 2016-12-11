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

   parameter SEC1_MAX = 50_000_000, // 50MHz�̐ݒ�
	 MAX_CNT = 16'hFFFF; // KHz�C�l�[�u���̐ݒ�
   
   reg [25:0] 			   tmp_count = 26'h0; // 1�b�J�E���^
   wire 				   enable_tmp; // 1�b�C�l�[�u��
   
   always @(posedge clk)
	 begin
		if (enable_tmp == 1'b1)
		  tmp_count <= 'b0;
		else
		  tmp_count <= tmp_count + 26'h1; // 1�b�J�E���^
	 end
   
   assign enable_tmp = (tmp_count == (SEC1_MAX - 1)); // 50000000�N���b�N��1��1���o��
   assign enable = enable_tmp;
   assign kHz_enable = (tmp_count[15:0] == MAX_CNT); // X"FFFF"��1��1���o��(���܂ɋ�U�肷��)
   assign en_05s = (tmp_count <= (SEC1_MAX/2 - 1)); // 0.5�b���Ƃ�1, 0���J��Ԃ�
   
endmodule
