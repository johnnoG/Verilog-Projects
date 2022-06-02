module alu_2bit(a,b,Cin,op,Cout,S);
  
  input a,b,Cin;
  input [1:0]op;
  output Cout,S;
  wire Fa ,aNorb,aNb,aNandB;
  
  FullAdder alu(.a(a),.b(b),.Cin(Cin),.s_op(op),.Cout(Cout),.S(Fa));
  
  nor2_1bit nor1(.a(a),.b(b),.c(aNorb));
  
  nor2_1bit nor2(.a(aNb),.b(aNb),.c(aNandB));
  
  and2_1bit and1(.a(a),.b(b),.c(aNb));
  
  
  mux4to1 mux(.D0(aNandB),.D1(aNorb),.D2(Fa),.D3(Fa),.S0(op[1]),.S1(op[0]),.Z(S));
  
endmodule



module alu_4bit(a,b,Cin,op,S,Cout);
  
  input a[3:0],b[3:0],Cin;
  input [1:0]op;
  output S[3:0],Cout;
  wire c0,c1,c2;
 
  alu_2bit alu1(.a(a[0]),.b(b[0]),.Cin(op[0]),.op(op),.Cout(c0),.S(S[0]));
  alu_2bit alu2(.a(a[1]),.b(b[1]),.Cin(c0),.op(op),.Cout(c1),.S(S[1]));
  alu_2bit alu3(.a(a[2]),.b(b[2]),.Cin(c1),.op(op),.Cout(c2),.S(S[2]));
  alu_2bit alu4(.a(a[3]),.b(b[3]),.Cin(c2),.op(op),.Cout(Cout),.S(S[3]));

  endmodule 