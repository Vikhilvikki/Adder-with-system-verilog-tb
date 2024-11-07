
class generator;
  transaction trans;
  mailbox gen2driv; //mailbox between generator to driver
  
  function new (mailbox gen2driv);
    this.gen2driv = gen2driv;
  endfunction
  task main();
    repeat(2)
      begin
        trans = new();
        trans.randomize();
        trans.display("generator class signals");
        gen2driv.put(trans);
      end
  endtask
endclass

        
  