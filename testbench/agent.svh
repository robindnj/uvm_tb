`include "seq_item.sv"
`include "sequence.sv"
`include "sequencer.sv"
`include "driver.sv"
`include "monitor.sv"

class agent extends uvm_agent;
  `uvm_component_utils(agent)
  seqr s;
  dri d;
  mon m;
  
  function new(string name="agent",uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    m=mon::type_id::create("m",this);
    if(get_is_active()==UVM_ACTIVE)
      begin
        s=seqr::type_id::create("s",this);
        d=dri::type_id::create("d",this);
      end
  endfunction
  
  function void connect_phase(uvm_phase phase);
    if(get_is_active()==UVM_ACTIVE)
      begin
        d.seq_item_port.connect(s.seq_item_export);
      end
  endfunction
endclass