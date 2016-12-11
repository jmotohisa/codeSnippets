`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer: Junichi Motohisa
//
// Create Date:
// Design Name:
// Module Name:   hexTo7seg
// Project Name:
// Target Devices:
// Tool versions:
// Description: hex/binary to 7seg decoder
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////

module hexTo7seg(
			input [3:0]  hex_in, // input hex(binary)
			output [7:0] seg_out   // 7-seg output
			);

   reg [7:0] 	seg_out_tmp;
   wire [3:0] 	hex_in_tmp;

   assign hex_in_tmp = hex_in; // invert here for active-low

   always @(hex_in_tmp)
	 begin
		case (hex_in_tmp)		//ABCDEFGDp
            4'b0000: seg_out_tmp <= 8'b11000000; //   --0
            4'b0001: seg_out_tmp <= 8'b11111001; //   --1
            4'b0010: seg_out_tmp <= 8'b10100100; //   --2
            4'b0011: seg_out_tmp <= 8'b10110000; //   --3
            4'b0100: seg_out_tmp <= 8'b10011001; //   --4
            4'b0101: seg_out_tmp <= 8'b10010010; //   --5
            4'b0110: seg_out_tmp <= 8'b10000010; //   --6
            4'b0111: seg_out_tmp <= 8'b11111000; //   --7
            4'b1000: seg_out_tmp <= 8'b10000000; //   --8
            4'b1001: seg_out_tmp <= 8'b10010000; //   --9
            4'b1010: seg_out_tmp <= 8'b10001000; //   --A
            4'b1011: seg_out_tmp <= 8'b10000011; //   --b
            4'b1100: seg_out_tmp <= 8'b11000110; //   --C
            4'b1101: seg_out_tmp <= 8'b10100001; //   --d
            4'b1110: seg_out_tmp <= 8'b10000110; //   --E
            4'b1111: seg_out_tmp <= 8'b10001110; //   --F
            default: seg_out_tmp <= 8'bxxxxxxxx; //   -- blank
		endcase
	 end

   assign seg_out = seg_out_tmp; // invert here for active low

endmodule
