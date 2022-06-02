module mux4_tb();
 
  reg t_D0,t_D1,t_D2,t_D3,t_S0,t_S1;
  wire t_Z;
  
  mux4to1 DUT(.D0(t_D0),.D1(t_D1),.D2(t_D2),.D3(t_D3),.S0(t_S0),.S1(t_S1),.Z(t_Z));
 
  initial
    
		begin
          	$dumpfile("simulation.vcd");
            $dumpvars(1);
          t_S1 = 0 ; t_S0 = 0 ; t_D0 = 0 ; t_D1 = 0; t_D2 = 0 ; t_D3 = 0; #20;
          t_S1 = 0 ; t_S0 = 0 ; t_D0 = 1 ; #20;
          t_S1 = 0 ; t_S0 = 1 ; t_D0 = 0 ; t_D1 = 1; #20;
          t_S1 = 0 ; t_S0 = 1 ; t_D1 = 1; #20;
             
          t_S1 = 1 ; t_S0 = 0 ;   #20;
          t_S1 = 1 ; t_S0 = 0 ;  t_D2 = 1 ;  #20;
          t_S1 = 1 ; t_S0 = 1 ;  t_D2 = 0 ;  #20;
          t_S1 = 1 ; t_S0 = 1 ;  t_D3 = 1;  #20;
          
          $stop;
        end
  
endmodule