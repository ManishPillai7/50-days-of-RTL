module sram_tb();
parameter DEPTH=8,LENGTH=4;
reg [LENGTH-1:0]data_in;
reg sw,wr_en,rd_en,clk;
wire [LENGTH-1:0]data_out;
wire full,empty;
wire [LENGTH-1:0]wr_ptr,rd_ptr;

sram s1(sw,data_in,wr_en,rd_en,full,empty,clk,data_out);

initial begin
clk=0;
sw=0;
end

always #5 clk=~clk;
initial begin
#10;sw=1;#20;wr_en=1;rd_en=0;
data_in=4'hb;#10;
data_in=4'hc;#10;
data_in=4'hd;#10;
data_in=4'he;#10;
data_in=4'hf;#10;
data_in=4'h1;#10;
data_in=4'h2;#10;
data_in=4'h3;#20;
wr_en=0;rd_en=1;#100;
sw=0;#50;
$stop;
end
endmodule
