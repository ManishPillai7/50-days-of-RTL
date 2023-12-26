module sram#(parameter DEPTH=8,LENGTH=4)(sw,data_in,wr_en,rd_en,full,empty,clk,data_out);
input [LENGTH-1:0]data_in;
input sw,wr_en,rd_en,clk;
output reg [LENGTH-1:0]data_out;
output reg full,empty;
integer i;

reg [LENGTH-1:0]sram[DEPTH-1:0];
reg [LENGTH-1:0]wr_ptr,rd_ptr;
always@(posedge clk)begin
    if(sw==0)begin
        data_out<=0;
        full<=0;
        empty<=0;
        for(i=0;i<DEPTH;i=i+1)begin
            sram[i]=4'b0;
        end
        wr_ptr<=0;
        rd_ptr<=0;
    end
    else begin
        if(wr_en & !full & !rd_en)begin
            sram[wr_ptr[2:0]]<=data_in;
            wr_ptr=wr_ptr+4'b0001;
        end
        if(rd_en & !empty & !wr_en)begin
            data_out=sram[rd_ptr[2:0]];
            rd_ptr=rd_ptr+4'b0001;
        end
    end
end

always@(posedge clk)begin
if(sw)begin
    if(wr_ptr==4'b1000)begin
        full=1;
        wr_ptr=4'b0;
    end
    if(rd_ptr==4'b1000)begin
        empty=1;
        rd_ptr=4'b0;
    end
end
end
endmodule
