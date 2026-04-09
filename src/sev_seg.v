module sev_seg(
    input clk,rst,
    input KEY_SW,
    output reg [7:0] SEG,
    output reg [3:0] AN  
);

wire bat1;
wire [7:0] seg_internal; 
wire [3:0] an_internal;  
reg [15:0] reg_seg = 0;

always @(posedge clk or negedge rst) begin
    if (~rst) begin
        reg_seg <= 0;
    end else begin
        if (bat1) begin
            reg_seg <= reg_seg + 1;
        end 
    end
end

b_filter f1(
    .clk(clk),
    .in_b(KEY_SW),
    .rst(rst),
    .out_b(),
    .im_out_b(bat1)
);

sev_seg_m s1(
    .clk(clk),
    .rst(rst),
    .reg_seg(reg_seg),
    .SEG(seg_internal),  
    .AN(an_internal)     
);


always @(*) begin
    SEG = seg_internal;
    AN = an_internal;
end

endmodule