module nor2_1bit(a,b,c);
  input a,b;
  output c;
  parameter Tpd = 7;
  assign #(Tpd) c = ~(a|b);
endmodule