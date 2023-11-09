module mux_2x1_tb ();

  reg [7:0]a,b;
  reg select;
  wire [7:0]out;
  
  mux_2x1 m1(.*);
  
  initial begin
    a=8'h1b;
    b=8'hea;
  end
  
  initial begin
    for(int i=0;i<10;i++) begin
      select=$urandom_range(0,1);#5;
    end
  end
  
  initial begin
    $dumpfile("mux_2x1.vcd");
    $dumpvars(0,mux_2x1_tb);
  end
endmodule
