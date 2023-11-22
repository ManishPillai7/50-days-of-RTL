module edge_detect_tb();
  reg data_in,clk,rst;
  wire data_posedge,data_negedge;
  
  edge_detector d1(.*);
  
  initial begin
    rst=0;
    clk=0;
    forever #5 clk=~clk;
  end
  
  initial begin
    data_in=0;
    rst=1;
    #2;rst=0;#3;
    for (int i=0; i<32; i++) begin
      data_in <= $random%2;#20;
    end
    $stop;
  end
  
  initial begin
    $dumpfile("file.vcd");
    $dumpvars(0,edge_detect_tb);
  end
  
endmodule
