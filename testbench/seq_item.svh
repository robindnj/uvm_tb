class seq_item extends uvm_sequence_item;
  randc bit wr_en;
  randc bit port_1,port_0;
  bit clk;
  rand bit [0:3] data_in;
  bit [0:3] data_out0;
  bit [0:3] data_out1;
  bit [0:3] out;
  bit [0:3] addr_1;
  bit [0:3] addr_0;
  logic [3:0] mem[7:0];

  
  `uvm_object_utils_begin(seq_item)
  `uvm_field_int(data_in,UVM_ALL_ON)
  `uvm_field_int(wr_en,UVM_ALL_ON)
  `uvm_field_int(port_1,UVM_ALL_ON)
  `uvm_field_int(port_0,UVM_ALL_ON)
  `uvm_field_int(addr_1,UVM_ALL_ON)
  `uvm_field_int(addr_0,UVM_ALL_ON)
  `uvm_object_utils_end
  
  function new(string name="seq_item");
    super.new(name);
  endfunction

endclass