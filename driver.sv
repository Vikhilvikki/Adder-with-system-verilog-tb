
class driver;
  virtual intf vif;
  mailbox gen2driv;
  function new (virtual intf vif, mailbox gen2driv);
    this.vif = vif;
    this.gen2driv = gen2driv;
  endfunction
  task main();
    repeat (2)
      begin
        transaction trans;
        gen2driv.get(trans);
        vif.a <= trans.a;
        vif.b <= trans.b;
        vif.c <= trans.c;
        #1;
        trans.display("driver class signals");
      end
  endtask
endclass
