module sev_seg_m #(
    parameter CN = 20
)(
    input clk,rst,
    input [15:0] reg_seg,
    output reg [7:0] SEG,
    output reg [3:0] AN
);

reg [3:0]sev0;
reg [3:0]sev1;
reg [3:0]sev2;
reg [3:0]sev3;

reg [CN - 1 : 0] count = 0;

reg [7:0] text0 = 0;
reg [7:0] text1 = 0;
reg [7:0] text2 = 0;
reg [7:0] text3 = 0;

always @(posedge clk or negedge rst) begin
    if (~rst) begin
        sev0 <= 0;
        sev1 <= 0;
        sev2 <= 0;
        sev3 <= 0;

        count <= 0;
    end 
    
    else begin
        sev0 <= reg_seg[3:0];
        sev1 <= reg_seg[7:4];
        sev2 <= reg_seg[11:8];
        sev3 <= reg_seg[15:12];

        count <= count + 1;        
    end
    
end
always @(posedge clk) begin
    
case (count[CN-1:CN-2])
    2'b00:begin
        SEG[7:0]<= text0;
        AN[3:0] <= 4'b1110;
    end
    2'b01:begin
        AN[3:0] <= 4'b1101;
        SEG[7:0]<= text1;
    end
    2'b10:begin
        AN[3:0] <= 4'b1011;
        SEG[7:0]<= text2;
    end
    2'b11:begin
        SEG[7:0]<= text3;
        AN[3:0] <= 4'b0111;
    end
endcase

case (sev0)
    4'b0000: begin
        text0 <= 8'b00000011;  // было 11000000
    end
    4'b0001: begin
        text0 <= 8'b10011111;  // было 11111100
    end
    4'b0010: begin   
        text0 <= 8'b00100101;  // было 10100100
    end
    4'b0011: begin   
        text0 <= 8'b00001101;  // было 10110000
    end
    4'b0100: begin   
        text0 <= 8'b10011001;  // было 10011001 (симметричное)
    end
    4'b0101: begin   
        text0 <= 8'b01001001;  // было 10010010
    end
    4'b0110: begin   
        text0 <= 8'b01000001;  // было 10000010
    end
    4'b0111: begin   
        text0 <= 8'b01110011;  // было 11001110
    end
    4'b1000: begin   
        text0 <= 8'b00000001;  // было 10000000
    end
    4'b1001: begin   
        text0 <= 8'b00001001;  // было 10010000
    end
    4'b1010: begin   
        text0 <= 8'b00010001;  // было 10001000
    end
    4'b1011: begin   
        text0 <= 8'b11000001;  // было 10000011
    end
    4'b1100: begin   
        text0 <= 8'b01100011;  // было 11000110
    end
    4'b1101: begin   
        text0 <= 8'b10000101;  // было 10100001
    end
    4'b1110: begin   
        text0 <= 8'b01100001;  // было 10000110
    end
    4'b1111: begin   
        text0 <= 8'b01110001;  // было 10001110
    end
endcase


case (sev1)
    4'b0000:begin
        text1 <= 8'b00000011;
    end
    4'b0001: begin
        text1 <= 8'b10011111;
    end
    4'b0010: begin   
       text1 <= 8'b00100101;
    end
    4'b0011: begin   
       text1 <= 8'b00001101;
    end
    4'b0100: begin   
       text1 <= 8'b10011001;
    end
    4'b0101: begin   
       text1 <= 8'b01001001;
    end
    4'b0110: begin   
       text1 <= 8'b01000001;
    end
    4'b0111: begin   
       text1 <= 8'b01110011;
    end
    4'b1000: begin   
       text1 <= 8'b00000001;
    end
    4'b1001: begin   
       text1 <= 8'b00001001;
    end
    4'b1010: begin   
       text1 <= 8'b00010001;
    end
    4'b1011: begin   
       text1 <= 8'b11000001;
    end
    4'b1100: begin   
       text1 <= 8'b01100011;
    end
    4'b1101: begin   
       text1 <= 8'b10000101;
    end
    4'b1110: begin   
       text1 <= 8'b01100001;
    end
    4'b1111: begin   
       text1 <= 8'b01110001;
    end
endcase

case (sev2)
    4'b0000:begin
        text2 <= 8'b00000011;
    end
    4'b0001: begin
        text2 <= 8'b10011111;
    end
    4'b0010: begin   
       text2 <= 8'b00100101;
    end
    4'b0011: begin   
       text2 <= 8'b00001101;
    end
    4'b0100: begin   
       text2 <= 8'b10011001;
    end
    4'b0101: begin   
       text2 <= 8'b01001001;
    end
    4'b0110: begin   
       text2 <= 8'b01000001;
    end
    4'b0111: begin   
       text2 <= 8'b01110011;
    end
    4'b1000: begin   
       text2 <= 8'b00000001;
    end
    4'b1001: begin   
       text2 <= 8'b00001001;
    end
    4'b1010: begin   
       text2 <= 8'b00010001;
    end
    4'b1011: begin   
       text2 <= 8'b11000001;
    end
    4'b1100: begin   
       text2 <= 8'b01100011;
    end
    4'b1101: begin   
       text2 <= 8'b10000101;
    end
    4'b1110: begin   
       text2 <= 8'b01100001;
    end
    4'b1111: begin   
       text2 <= 8'b01110001;
    end
endcase

case (sev3)
    4'b0000:begin
        text3 <= 8'b00000011;
    end
    4'b0001: begin
        text3 <= 8'b10011111;
    end
    4'b0010: begin   
       text3 <= 8'b00100101;
    end
    4'b0011: begin   
       text3 <= 8'b00001101;
    end
    4'b0100: begin   
       text3 <= 8'b10011001;
    end
    4'b0101: begin   
       text3 <= 8'b01001001;
    end
    4'b0110: begin   
       text3 <= 8'b01000001;
    end
    4'b0111: begin   
       text3 <= 8'b01110011;
    end
    4'b1000: begin   
       text3 <= 8'b00000001;
    end
    4'b1001: begin   
       text3 <= 8'b00001001;
    end
    4'b1010: begin   
       text3 <= 8'b00010001;
    end
    4'b1011: begin   
       text3 <= 8'b11000001;
    end
    4'b1100: begin   
       text3 <= 8'b01100011;
    end
    4'b1101: begin   
       text3 <= 8'b10000101;
    end
    4'b1110: begin   
       text3 <= 8'b01100001;
    end
    4'b1111: begin   
       text3 <= 8'b01110001;
    end
endcase
end
    
endmodule