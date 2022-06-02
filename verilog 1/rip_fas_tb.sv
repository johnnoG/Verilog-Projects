module rip_fas_tb();
  
  reg t_a[3:0],t_b[3:0],t_Cin,t_s_op;
  wire t_Cout,t_S[3:0];
  
 
  
  
  RippleFullAdder DUT(.a(t_a),.b(t_b),.Cin(t_Cin),.s_op(t_s_op),.Cout(t_Cout),.S(t_S));
  
  
  initial
    
		begin
          	$dumpfile("simulation.vcd");
            $dumpvars(1);
          // sum of numbers
          t_Cin = 0; t_s_op = 0;
          
          t_a[3]=0; t_a[2]=1; t_a[1]=0; t_a[0]=0;  // 0100 = 4
          t_b[3]=0; t_b[2]=0; t_b[1]=1; t_b[0]=0;  // 0010 = 2
          #60
          // sub of numbers
          t_Cin = 1; t_s_op = 1;
          
          t_a[3]=0; t_a[2]=1; t_a[1]=0; t_a[0]=0;  // 0100 = 4
          t_b[3]=0; t_b[2]=0; t_b[1]=1; t_b[0]=0;  // 0010 = 2
          #60
            $stop;
        end
  
  
  
endmodule