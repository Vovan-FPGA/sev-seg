module b_filter #(
    parameter CN = 4
) (
    input   clk,
    input   in_b,
    input   rst,
    output  reg out_b,
    output  im_out_b
);

reg [CN - 1 : 0]    count   = 0;
reg [CN - 1:0]      syn     = 0;

always @(posedge clk) begin
    if (~rst) begin
        syn <= 0;
    end else begin
        syn <= {syn[CN-2:0],in_b};

        if(&syn)begin
            out_b <= 1;
        end
        else begin
            out_b <= 0;
        end
        
    end

end

assign im_out_b = (~syn[CN - 1] & syn[CN - 2]) ? 1 : 0;
  
endmodule