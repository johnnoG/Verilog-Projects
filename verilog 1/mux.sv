
module mux2to1(D0,D1,S,Z);
  
  input D0,D1,S;
  output Z;
  wire D1_S,S_not,D0_Snot,Fnor;

  and2_1bit and1(.a(D1),.b(S),.c(D1_S));
  and2_1bit and2(.a(D0),.b(S_not),.c(D0_Snot));
  
  nor2_1bit nor1(.a(S),.b(S),.c(S_not));
  nor2_1bit nor2(.a(D0_Snot),.b(D1_S),.c(Fnor));
  nor2_1bit nor3(.a(D0_Snot),.b(D1_S),.c(Fnor));
  nor2_1bit nor4(.a(Fnor),.b(Fnor),.c(Z));
  
endmodule

module mux4to1(D0,D1,D2,D3,S0,S1,Z);
  
  input D0,D1,D2,D3,S0,S1;
  output Z;
  wire res1,res2;
  
  mux2to1 mux1(.D0(D0),.D1(D1),.S(S1),.Z(res1));
  mux2to1 mux2(.D0(D2),.D1(D3),.S(S1),.Z(res2));
  mux2to1 mux3(.D0(res1),.D1(res2),.S(S0),.Z(Z));
  
endmodule