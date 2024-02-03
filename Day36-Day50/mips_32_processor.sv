/* ********************************************************************************
Author: Manish Pilla
Project: MIPS 32 Processor
********************************************************************************
*/

module mips_32(clk1,clk2);
  input clk1,clk2; // Two stage clock
  
  reg [31:0]if_id_npc,if_id_ir,pc; //Latches between Instruction Fetch and Instruction Decoder
  reg [31:0]id_ex_npc,id_ex_ir,id_ex_a,id_ex_b,id_ex_imm; //Latches between Instruction Decoder and Execution
  reg [31:0]ex_mem_aluout,ex_mem_b,ex_mem_ir; //Latches between Execution and Memory
  reg ex_mem_cond; // For branching condition
  reg [31:0]mem_wb_lmd,mem_wb_aluout,mem_wb_ir; //Latches between Memory and Write Back
  reg [2:0] id_ex_type,ex_mem_type,mem_wb_type; //To store and pass the INSTRUCTION TYPE
  
  reg [31:0]Reg[0:31]; //To store
  reg [31:0]Mem[0:1023]; //Consists all instructions
  
  parameter ADD=6'b000000, SUB=6'b000001, AND=6'b000010, OR=6'b000011, SLT=6'b000100, MUL=6'b000101, HLT=6'b111111, LW=6'b001000, SW=6'b001001, ADDI=6'b001010, SUBI=6'b001011, SLTI=6'b001100, BNEQZ=6'b001101, BEQZ=6'b001110; //Opcodes to all Instructions
  parameter RR_ALU=3'b000, RM_ALU=3'b001, LOAD=3'b010, STORE=3'b011, BRANCH=3'b100, HALTED=3'b101; 
  
  reg HALT; // HALT=1 when the instruction is completed (in WB stage)
  reg TAKEN_BRANCH; //To disable instruction after branch
  
  always@(posedge clk1)begin   // INSTRUCTION FETCH (STAGE1)
    if(HALT == 0)begin
      if(((ex_mem_ir[31:26]==BEQZ) && (ex_mem_cond==1)) || ((ex_mem_ir[31:26]==BNEQZ) && (ex_mem_cond==0)))begin // for beanching
        if_id_ir <= Mem[ex_mem_aluout]; // Instruction to branch is taken from ALU
        TAKEN_BRANCH <= 1'b1; // Activating 
        if_id_npc <= ex_mem_aluout + 1;
        pc <= ex_mem_aluout + 1;
      end
      else begin
        if_id_ir <= Mem[pc]; // Normal instruction fetching
        if_id_npc <= pc+1;
        pc <= pc+1;
      end
    end
  end
  
  always@(posedge clk2)begin  // INSTRUCTION DECODER (STATGE2)
    if(HALT == 0)begin
      if(if_id_ir[25:21]==5'b0) // Cheking if R0 register is used for A or not, as R0 is by default 0 
        id_ex_a <= 0;
      else 
        id_ex_a <= Reg[if_id_ir[25:21]]; // Storing A=reg[rs]
      if(if_id_ir[20:16]==5'b0) //  Cheking if R0 register is used for B or not, as R0 is by default 0 
        id_ex_b <= 0;
      else
        id_ex_b <= Reg[if_id_ir[20:16]]; // Storing B=reg[rt]
      
      id_ex_npc <= if_id_npc;
      id_ex_ir <= if_id_ir;
      id_ex_imm <= {{16{if_id_ir[15]}},{if_id_ir[15:0]}}; // Sign extender i.e. making imm data 16 bit to 32 bit
    end
    case(if_id_ir[31:26]) // To store the type of instruction 
      ADD,SUB,AND,OR,SLT,MUL: id_ex_type <= RR_ALU;
      ADDI,SUBI,SLTI: id_ex_type <= RM_ALU;
      LW: id_ex_type <= LOAD;
      SW: id_ex_type <= STORE;
      BNEQZ,BEQZ: id_ex_type <= BRANCH;
      HLT: id_ex_type <= HALTED;
      default: id_ex_type <= HALTED;
    endcase
  end
  
  always@(posedge clk1)begin  // EXECUTION (STAGE3)
    if(HALT==0) begin
      ex_mem_type <= id_ex_type;
      ex_mem_ir <= id_ex_ir;
      TAKEN_BRANCH <= 0; // This is set 0 zero because no brach should happen while in this stage
      
      case(id_ex_type) //Acts as the func for the ALU
        RR_ALU: begin
          case(id_ex_ir[31:26]) //Checking the opcode
            ADD: ex_mem_aluout<=id_ex_a+id_ex_b;
            SUB: ex_mem_aluout<=id_ex_a-id_ex_b;
            AND: ex_mem_aluout<=id_ex_a&id_ex_b;
            OR: ex_mem_aluout<=id_ex_a|id_ex_b;
            SLT: ex_mem_aluout<=id_ex_a<id_ex_b;
            MUL: ex_mem_aluout<=id_ex_a*id_ex_b;
            default: ex_mem_aluout<=32'hx;
          endcase
        end
        RM_ALU: begin
          case(id_ex_ir[31:26])
            ADDI: ex_mem_aluout<=id_ex_a+id_ex_imm;
            SUBI: ex_mem_aluout<=id_ex_a-id_ex_imm;
            SLTI: ex_mem_aluout<=id_ex_a<id_ex_imm;
          endcase
        end
        LOAD,STORE: begin
          ex_mem_aluout<=id_ex_a+id_ex_imm; //In this stage the rs is added with the imm 
          ex_mem_b<=id_ex_b;				//and rd is kept as it is 
        end
        BRANCH: begin
          ex_mem_aluout<=id_ex_npc+id_ex_imm;
          ex_mem_cond<=(id_ex_a==0);
        end
      endcase
    end
  end
  
  always@(posedge clk2)begin // MEMORY (STAGE 4)
    if(HALT == 0) begin
      mem_wb_ir <= ex_mem_ir;
      mem_wb_type <= ex_mem_type; // Passing the instruction type
      
      case (ex_mem_type)
        RR_ALU,RM_ALU: mem_wb_aluout <= ex_mem_aluout;
        LOAD: mem_wb_lmd <= Reg[ex_mem_aluout]; //Takes the data from the location specified in ALU out and to store in LMD
        STORE: if(TAKEN_BRANCH == 0) 
          Mem[ex_mem_aluout] <= ex_mem_b; // Storing data from B to Memory
      endcase
    end
  end
  
  always@(posedge clk1) begin // WRITE BACK (STAGE 5)
    if(TAKEN_BRANCH == 0) // Only work when there is no branching
      case(mem_wb_type)
        RR_ALU: Reg[mem_wb_ir[15:11]] <= mem_wb_aluout; //rd
        RM_ALU: Reg[mem_wb_ir[20:16]] <= mem_wb_aluout; //rt
        LOAD: Reg[mem_wb_ir[20:16]] <= mem_wb_lmd; //rt
        HALTED: HALT <= 1'b1;
      endcase
  end
endmodule
