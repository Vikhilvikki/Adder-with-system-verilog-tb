
class transaction;
  rand bit a;
  rand bit b;
  rand bit c;
  bit sum;
  bit carry;
  
  function void display( string name);
    $display("--------- %s ------", name);
    $display("a = %0b b = %0b c = %0b sum = %0b carry = %0b", a, b, c, sum, carry);
    $display("-----------------------------------------");
  endfunction
endclass
