`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Junichi Motohisa
// 
// Create Date:    11:08:10 05/04/2013 
// Design Name:    
// Module Name:    sel7seg4 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: dynamic display of 4-7seg LEDs
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module sel7seg4(
				input 		 clk,    // clock
				input 		 enable, // enable
				input [3:0]  dig0,   // digit 0 (Least Significant)
				input [3:0]  dig1,   //
				input [3:0]  dig2,   //
				input [3:0]  dig3,   // digit 3 (Most Significant)
				output [3:0] digout, // which digit to turn on
				output [3:0] sel     // output for digit
				);
   
   parameter MAX_COUNT = 3'b111;
   reg [2:0] 				 cnt = 3'b000; 
   reg [3:0] 				 sel_tmp = 4'b0000;
   reg [3:0] 				 digout_tmp;
   
   always @(posedge clk) begin
	  if ( enable==1'b1)
		if(cnt==MAX_COUNT)
		  cnt <= 3'b000;
		else
		  cnt <= cnt + 1'b1;
   end
   
   always @(posedge clk) begin
	  if(cnt[0]==1'b1)
		begin
		   sel_tmp <= 4'b1111;
		   digout_tmp <= digout_tmp;
		end
	  else
		case (cnt[2:1])
		  2'b00: begin
			 sel_tmp <= 4'b1110;
			 digout_tmp <= dig0;
		  end
		  2'b01: begin
			 sel_tmp <= 4'b1101;
			 digout_tmp <= dig1;
		  end
		  2'b10: begin
			 sel_tmp <= 4'b1011;
			 digout_tmp <= dig2;
		  end
		  2'b11: begin
			 sel_tmp <= 4'b0111;
			 digout_tmp <= dig3;
		  end
		  default:begin
			 sel_tmp <= 4'bxxxx;
			 digout_tmp <= 4'bxxxx;
		  end
		endcase
   end
   
   assign digout = digout_tmp;
   assign sel = sel_tmp;
   
endmodule
