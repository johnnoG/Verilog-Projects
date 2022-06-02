module FullAdder(a,b,Cin,s_op,Cout,S);
  
  input a,b,Cin,s_op;
  output Cout,S;
  
  wire bXs, abXs, aXbXs, abs_c, abNcs;
  
  xor2_1bit xor1(.a(b),.b(s_op),.c(bXs));
  xor2_1bit xor2(.a(a),.b(bXs),.c(aXbXs));
  xor2_1bit xor3(.a(aXbXs),.b(Cin),.c(S));
  
  and2_1bit and1(.a(a),.b(bXs),.c(abXs));
  and2_1bit and2(.a(aXbXs),.b(Cin),.c(abs_c));
  
  nor2_1bit nor1(.a(abs_c),.b(abXs),.c(abNcs));
  nor2_1bit nor2(.a(abNcs),.b(abNcs),.c(Cout));
  
endmodule

module RippleFullAdder(a,b,Cin,s_op,Cout,S);
  
  input a[3:0],b[3:0],Cin,s_op;
  output Cout,S[3:0];
  wire c1,c2,c3,c4;
  
  FullAdder bit1 (.a(a[0]),.b(b[0]),.Cin(Cin),.s_op(s_op),.Cout(c1),.S(S[0]));
  FullAdder bit2 (.a(a[1]),.b(b[1]),.Cin(c1),.s_op(s_op),.Cout(c2),.S(S[1]));
  FullAdder bit3 (.a(a[2]),.b(b[2]),.Cin(c2),.s_op(s_op),.Cout(c3),.S(S[2]));
  FullAdder bit4 (.a(a[3]),.b(b[3]),.Cin(c3),.s_op(s_op),.Cout(Cout),.S(S[3]));
  
endmodule
