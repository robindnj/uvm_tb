class sequence extends uvm_sequence#(seq_item);
  `uvm_object_utils(sequence)
  function new(string name="sequence");
    super.new(name);
  endfunction
  
  virtual task body();
    //repeat(5)
      begin
        `uvm_do(req);
      end
  endtask
endclass
    