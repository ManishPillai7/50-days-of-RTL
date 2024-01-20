module controller(
  input start,clk,q1,q0,done,
  output reg enD,enA,enM,enQ,sub_add,clr_A,clr_count,dec,shift,clr_Q,clr_r,clrff
);
  parameter s0=4'b0000,s1=4'b0001,s2=4'b0010,s3=4'b0011,s4=4'b0100,s5=4'b0101,s6=4'b0110,s7=4'b0111,s8=4'b1000;
  reg [3:0]state;
  
  always@(posedge clk)begin
    case(state)
      s0: if(start) state=s1; // all =0 except sub_add
      s1: state=s2; // data into M,clr A
      s2: state=s3; // data into Q,all other 0
      s3: begin // enM=0,en_count=0
        if(q0==0 && q1==1) state=s4; 
        else if(q0==1 && q1==0) state=s5;
        else state=s6;
      end
      s4: state=s7;
      s5: state=s7;
      s6: state=s7;
      s7: begin
        if(done) state=s8;
        else state=s3;
      end
      s8: state=s8;
      default: state=s0;
    endcase
  end
  
  always@(state) begin
    case(state)
      s0: begin enD=0;enA=0;enM=0;enQ=0;clr_A=0;clr_count=0;dec=0;shift=0;clr_Q=0;clr_r=0;clrff=0; end
      s1: begin clr_A=1;enM=1;clrff=1;clr_count=1;clr_r=1;clr_Q=1;enQ=0; end
      s2: begin clr_A=0;enM=0;clrff=0;clr_count=0;clr_r=0;clr_Q=0;enQ=1; end
      s3: begin enQ=0;dec=0;enA=0;shift=0; end
      s4: begin sub_add=1;enA=1; end
      s5: begin sub_add=0;enA=1; end
      s6: sub_add=1'bx;
      s7: begin sub_add=1'bx;enA=0;shift=1;dec=1; end
      s8: begin enA=0;enM=0;enQ=0;clr_A=0;clr_count=0;dec=0;shift=0;clr_Q=0;clr_r=0;clrff=0; end
      default: begin enA=0;enM=0;enQ=0;clr_A=0;clr_count=0;dec=0;shift=0;clr_Q=0;clr_r=0;clrff=0; end
    endcase
  end
endmodule
