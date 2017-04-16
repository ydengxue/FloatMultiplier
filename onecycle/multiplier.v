/*****************************************************************************************************
* Description:                 One cycle multiplier for Demo
*
* Author:                      Dengxue Yan
*
* Email:                       Dengxue.Yan@wustl.edu
*
* Rev History:
*       <Author>        <Date>        <Hardware>     <Version>        <Description>
*     Dengxue Yan   2017-01-09 17:00       --           1.00             Create
*****************************************************************************************************/
`timescale 1ns / 1ps

module multiplier(
    rst,
    clk,
    req_msg_a,
    req_msg_b,
    req_val,
    req_rdy,
    resp_msg,
    resp_val,
    resp_rdy
    );

    input  rst;// Reset
    input  clk;// System clk
    input  [31:0] req_msg_a;// Operand a
    input  [31:0] req_msg_b;// Operand b
    input  req_val;// Operation request
    output req_rdy;// New operands could be accepted, if it is deasserted, req_val and req_msg will be ignored

    output [63:0] resp_msg;// Multiplier result output
    output resp_val;// Multiplier result valid flag
    input  resp_rdy;// Host ready to accept the result flag

    assign resp_val = req_val;
    assign req_rdy  = 1'b1;

    wire [31:0] temp00 = req_msg_b[0]  ? req_msg_a: 32'h00000000; 
    wire [31:0] temp01 = req_msg_b[1]  ? req_msg_a: 32'h00000000; 
    wire [31:0] temp02 = req_msg_b[2]  ? req_msg_a: 32'h00000000; 
    wire [31:0] temp03 = req_msg_b[3]  ? req_msg_a: 32'h00000000; 
    wire [31:0] temp04 = req_msg_b[4]  ? req_msg_a: 32'h00000000; 
    wire [31:0] temp05 = req_msg_b[5]  ? req_msg_a: 32'h00000000; 
    wire [31:0] temp06 = req_msg_b[6]  ? req_msg_a: 32'h00000000; 
    wire [31:0] temp07 = req_msg_b[7]  ? req_msg_a: 32'h00000000; 
    wire [31:0] temp08 = req_msg_b[8]  ? req_msg_a: 32'h00000000; 
    wire [31:0] temp09 = req_msg_b[9]  ? req_msg_a: 32'h00000000; 
    wire [31:0] temp10 = req_msg_b[10] ? req_msg_a: 32'h00000000; 
    wire [31:0] temp11 = req_msg_b[11] ? req_msg_a: 32'h00000000; 
    wire [31:0] temp12 = req_msg_b[12] ? req_msg_a: 32'h00000000; 
    wire [31:0] temp13 = req_msg_b[13] ? req_msg_a: 32'h00000000; 
    wire [31:0] temp14 = req_msg_b[14] ? req_msg_a: 32'h00000000; 
    wire [31:0] temp15 = req_msg_b[15] ? req_msg_a: 32'h00000000; 
    wire [31:0] temp16 = req_msg_b[16] ? req_msg_a: 32'h00000000; 
    wire [31:0] temp17 = req_msg_b[17] ? req_msg_a: 32'h00000000; 
    wire [31:0] temp18 = req_msg_b[18] ? req_msg_a: 32'h00000000; 
    wire [31:0] temp19 = req_msg_b[19] ? req_msg_a: 32'h00000000; 
    wire [31:0] temp20 = req_msg_b[20] ? req_msg_a: 32'h00000000; 
    wire [31:0] temp21 = req_msg_b[21] ? req_msg_a: 32'h00000000; 
    wire [31:0] temp22 = req_msg_b[22] ? req_msg_a: 32'h00000000; 
    wire [31:0] temp23 = req_msg_b[23] ? req_msg_a: 32'h00000000; 
    wire [31:0] temp24 = req_msg_b[24] ? req_msg_a: 32'h00000000; 
    wire [31:0] temp25 = req_msg_b[25] ? req_msg_a: 32'h00000000; 
    wire [31:0] temp26 = req_msg_b[26] ? req_msg_a: 32'h00000000; 
    wire [31:0] temp27 = req_msg_b[27] ? req_msg_a: 32'h00000000; 
    wire [31:0] temp28 = req_msg_b[28] ? req_msg_a: 32'h00000000; 
    wire [31:0] temp29 = req_msg_b[29] ? req_msg_a: 32'h00000000; 
    wire [31:0] temp30 = req_msg_b[30] ? req_msg_a: 32'h00000000; 
    wire [31:0] temp31 = req_msg_b[31] ? req_msg_a: 32'h00000000; 
 
    assign resp_msg = 
        {temp00} +
        {temp01, 1'h0} + 
        {temp02, 2'h0} + 
        {temp03, 3'h0} + 
        {temp04, 4'h0} + 
        {temp05, 5'h00} + 
        {temp06, 6'h00} + 
        {temp07, 7'h00} + 
        {temp08, 8'h00} + 
        {temp09, 9'h000} + 
        {temp10, 10'h000} + 
        {temp11, 11'h000} + 
        {temp12, 12'h000} + 
        {temp13, 13'h0000} + 
        {temp14, 14'h0000} + 
        {temp15, 15'h0000} + 
        {temp16, 16'h0000} + 
        {temp17, 17'h00000} + 
        {temp18, 18'h00000} + 
        {temp19, 19'h00000} + 
        {temp20, 20'h00000} + 
        {temp21, 21'h000000} + 
        {temp22, 22'h000000} + 
        {temp23, 23'h000000} + 
        {temp24, 24'h000000} + 
        {temp25, 25'h0000000} + 
        {temp26, 26'h0000000} + 
        {temp27, 27'h0000000} + 
        {temp28, 28'h0000000} + 
        {temp29, 29'h00000000} + 
        {temp30, 30'h00000000} +
        {temp31, 31'h00000000};

endmodule
