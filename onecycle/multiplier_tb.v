/*****************************************************************************************************
* Description:                 Test bench for multiplier
*
* Author:                      Dengxue Yan
*
* Email:                       Dengxue.Yan@wustl.edu
*
* Rev History:
*       <Author>        <Date>        <Hardware>     <Version>        <Description>
*     Dengxue Yan   2016-09-09 23:00       --           1.00             Create
*****************************************************************************************************/
`timescale 1ns / 1ps

module multiplier_tb();

    reg  [31:0] a;
    reg  [31:0] b;
    reg  clk;
    reg  rst;

    reg  req;
    wire req_rdy;

    wire [63:0] y;

    wire resp_val;
//    reg  resp_rdy;


    multiplier DUT(
        .rst(rst),
        .clk(clk),
        .req_msg_a(a),
        .req_msg_b(b),
        .req_val(req),
        .req_rdy(req_rdy),
        .resp_msg(y),
        .resp_val(resp_val),
        .resp_rdy(1'b1)
        );

    initial
    begin
        $dumpfile("multiplier.vcd");
        $dumpvars(0, multiplier_tb);

        rst = 1;
        clk = 0;
        a = 0;
        b = 0;
        req = 0;

        // 1
        #16
        rst = 0;
        a = 1;
        b = 1;
        req = 1;

        // 2
        #1000
        a = 100;
        b = 100;

        // 3
        #1000
        a = 50;
        b = 100;

        // 4
        #1000
        a = 12;
        b = 30;

        // 5
        #1000
        a = 256;
        b = 16;

        // 6
        #1000
        a = 256;
        b = 1024;

        // 7
        #1000
        a = 65536;
        b = 65536;

        // 8
        #1000
        a = 32'hFFFFFFFF;
        b = 32'hFFFFFFFF;


        // 9
        #1000
        a = 32'hFFFFFFFF;
        b = 32'h0000FFFF;

        // 10
        #1000
        a = 32'hFFFFFFFF;
        b = 32'h0FFFFFFF;

        // 11
        #1000
        a = 32'hFFFFFFFF;
        b = 32'h00FFFFFF;

        // 12
        #1000
        a = 32'hFFFFFFFF;
        b = 32'h000FFFFF;

        // 13
        #1000
        a = 32'hFFFFFFFF;
        b = 32'h0000FFFF;

        // 14
        #1000
        a = 32'hFFFFFFFF;
        b = 32'h00000FFF;

        // 15
        #1000
        a = 32'hFFFFFFFF;
        b = 32'h000000FF;

        // 16
        #1000
        a = 32'hFFFFFFFF;
        b = 32'h0000000F;

        #1000
        $finish;
    end

    always 
        #10 clk = !clk;

endmodule
