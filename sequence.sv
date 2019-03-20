class seqn extends uvm_sequence#(seq_item);
  `uvm_object_utils(seqn)
  function new(string name="seqn");
    super.new(name);
  endfunction
  
  virtual task body();
    //repeat(5)
      begin
        `uvm_do(req);
      end
  endtask
endclass
    