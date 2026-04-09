`timescale 1ns / 1ps

module tb_b_filter();
    
reg in_b = 0;
reg rst;
reg clk = 0;
wire out_b,im_out_b;

always #10 begin
    clk <= ~clk;
end


b_filter f1(
      .clk(clk),
      .in_b(in_b),
      .rst(rst),
      .out_b(out_b),
      .im_out_b(im_out_b)
);

initial begin
    $dumpfile("tb_b_filter.vcd");
    $dumpvars(0, tb_b_filter);
#10;
rst = 0;
#10;
rst = 1;
#100;
in_b <= 1;
#500;
in_b <= 0;

#1000;
$finish;
end

endmodule