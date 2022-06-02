/************************************************************************
 * Example testbench: instantiates 4 basic logic gates and applies      *
 * stimulus to the gate inputs. Prints out the outputs using $display   *
 * function.                                                            *
 ************************************************************************/
module DEMO_TB();

// Signal declarations
// ===================

// Gate output wires
wire c1, c2, c3;

// Gate inputs - declared as registers, since we need them to 'remember'
// values
reg a, b;

// The test bench: try 2 different input combinations at 2 different points
// of time - change values : 00 to 11 to 00 after 10 time units.
// ====================================================================
initial
begin
  	$dumpfile("simulation.vcd");
    $dumpvars(1);
    a = 1'b0;
    b = 1'b0;
    #10;
    a = 1'b1;
    b = 1'b1;
    #10;
    a = 1'b0;
    b = 1'b0;
    #10;
end

// Gate instantiations
// ===================

// For this gate we use the default delays with: Tpdlh=1 and Tpdhl=1
and2_1bit  and_delay1 ( .c(c1), .a(a), .b(b) );

//for the second AND gate we set an equal tpd of 5 time units 
  and2_1bit #(3) and_delay2 ( .c(c2), .a(a), .b(b) );

//for the third AND gate we set a tpdLH of 3 and tpdHL of 6 time units 
  and2_1bit #(5) and_delay3 ( .c(c3), .a(a), .b(b) );

// Print out the output values on every change
// ===========================================
always @(*)
    $display("%t: outputs changed to %d,%d,%d", $time, c1,c2,c3);

endmodule


