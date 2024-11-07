// Code your design here
module full_adder( sum, carry, a, b, c);
  input a, b,c ;
  output sum, carry;
  wire c1, c2,c3;
  xor x1 (sum, a, b, c);
  
  and a1 (c1, a, b);
  and a2 (c2, b, c);
  and a3 (c3, c, a);
  
  or o1 (carry, c1, c2, c3);
endmodule
 class scoreboard;
  // Parameters
  localparam int ADDR_WIDTH = 4;
  localparam int DATA_WIDTH = 32;
  localparam int DEPTH = 16;

  // Storage for the expected memory values
  reg [DATA_WIDTH-1:0] expected_mem [0:DEPTH-1];

  // Mailbox for receiving data from the monitor
  mailbox mon2scb;

  // Constructor
  function new(mailbox mon2scb);
    this.mon2scb = mon2scb;
    // Initialize expected memory to zero
    for (int i = 0; i < DEPTH; i++) begin
      expected_mem[i] = '0;
    end
  endfunction

  // Task to monitor and check the transactions
  task main();
    transaction trans;
    forever begin
      // Get the transaction from the monitor
      mon2scb.get(trans);
      
      // Check for write operation
      if (trans.cs && trans.we) begin
        // Update expected memory with written data
        expected_mem[trans.addr] = trans.data;
      end
      
      // Check for read operation
      if (trans.cs && trans.oe && !trans.we) begin
        if (trans.data !== expected_mem[trans.addr]) begin
          $display("ERROR: Mismatch at address %0d, expected: %0h, got: %0h", trans.addr, expected_mem[trans.addr], trans.data);
        end else begin
          $display("MATCH: Address %0d, Data %0h", trans.addr, trans.data);
        end
      end
    end
  endtask
endclass