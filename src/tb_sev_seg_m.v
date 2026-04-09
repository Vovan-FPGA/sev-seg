`timescale 1ns / 1ps

module tb_sev_seg_m();

reg clk = 0;
reg rst = 1;
reg [15:0] data_in = 0;
wire [7:0] SEG;
wire [3:0] AN;

always #10 begin
    clk <= ~clk;
end

sev_seg_m uut(
    .clk(clk),
    .rst(rst),
    .reg_seg(data_in),
    .SEG(SEG),
    .AN(AN)
);

initial begin
    $dumpfile("tb_sev_seg_m.vcd");
    $dumpvars(0, tb_sev_seg_m);
#10;
rst = 0;
#10;
data_in <=16'h3210;
rst = 1;
#1000;
$finish;
end


    
endmodule