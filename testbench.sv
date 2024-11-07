`include "interface.sv"
`include "test.sv"
module testbench;
  intf intff();//interface 
  test tst (intff); //test 
  full_adder fa (.a(intff.a),
                 .b(intff.b),
                 .c(intff.c),
                 .sum(intff.sum),
                 .carry(intff.carry)
                );
endmodule

 
