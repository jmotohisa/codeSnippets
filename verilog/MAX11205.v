`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/12/04 09:00:25
// Design Name: 
// Module Name: MAX11205
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

module MAX11205(
    input ck,      //2MHz
    input res,      //Reset Signal(Sync)
    input trg,      //AD Covert Start Trigger
    input sdata,      //AD Data from AD7680A
    output busy,      //Convert Busy Signal
    output sclk,      //SPI I/F Clock
    output cs_n,      //Convert Enable
    output [15:0] data);
    
    reg [4:0]cnt;
    reg busy;
    reg cs;
    reg [15:0]buff;
    reg [15:0]data;
    wire adend;
    assign sclk = ck;
    assign adend = (cnt==5'd20); //←変換完了（abend）生成

    always @(posedge ck) begin
        if (res) busy <= 1'b0; //　←A-D変換動作中ビジー信号"H"
        else if (adend) busy <= 1'b0;
        else if (trg)busy <= 1'b1;
    end
        
    always @(negedge ck) begin
        if (res) cnt <= 5'b0;
        else if (~cs) cnt <= 5'b0;
        else cnt <= cnt + 5'b1; // ←変換サイクル数カウント
    end
//cs (cs_n)
    assign cs_n = ~cs;
    always @(posedge ck) begin
        if (res) 　　　　 cs <= 1'b0;
        else if (adend) 　 cs <= 1'b0;//　←CS信号生成
        else if (busy) 　　 cs <= 1'b1;
    end

//buff
    always @( posedge ck ) begin
        if (res)　 buff <= 16'b0;
        else if (~busy)　 buff <= 16'b0;
        else if (cnt < 5'd20) buff <= {buff[14:0],sdata};//　←※1
    end
//data
    always @(negedge ck) begin
        if (res) 　　　　　　　　data <= 16'b0;
    else if (cnt == 5'd19)　　data <= buff;//　←※2
    end
endmodule
