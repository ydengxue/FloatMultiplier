/*****************************************************************************************************
* Description:                 Fixed latency multiplier for Demo
*
* Author:                      Dengxue Yan
*
* Email:                       Dengxue.Yan@wustl.edu
*
* Rev History:
*       <Author>        <Date>        <Hardware>     <Version>        
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
    reg [63:0] resp_msg;

    output resp_val;// Multiplier result valid flag
    reg    resp_val;
    input  resp_rdy;// Host ready to accept the result flag
 
    reg [1:0] state = 2'b00;
    reg [4:0] counter = 5'h00;

    reg [63:0] a_temp = 0;
    reg [31:0] b_temp = 0;
    reg [63:0] y_temp = 0;

    assign req_rdy = resp_val;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            // reset
            a_temp <= 0;
            b_temp <= 0;
            y_temp <= 0;
            resp_msg <= 0;
            state <= 2'b00;
            resp_val <= 1'b0;
        end
        else begin
            case (state)
            2'b00: begin
                if (req_val) begin
                    a_temp <= {32'h00000000, req_msg_a};
                    b_temp <= req_msg_b;
                    y_temp <= 0;
                    counter <= 5'h00;
                    resp_val <= 1'b0;
                    state <= 2'b01;
                end
            end
            2'b01: begin
                if (5'h1F == counter) begin
                    state <= 2'b11;
                end
                else begin
                    counter <= counter + 1'b1;
                end
                y_temp <= y_temp + (b_temp[0] ? a_temp: 0);

                a_temp <= {a_temp[62:0], 1'b0};
                b_temp <= {1'b0, b_temp[31:1]};
            end
            2'b11: begin
                resp_msg <= y_temp;
                resp_val <= 1'b1;
                state <= 2'b00;
            end
            default: begin
                state <= 2'b00;
            end
            endcase
        end
    end

endmodule
