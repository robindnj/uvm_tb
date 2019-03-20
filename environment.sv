`include "agent.sv"
`include "scoreboard.sv"
class envi extends uvm_env;
  `uvm_component_utils(envi)
  ag a;
  scb sb;
  
  function new(string name="envi",uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    a=ag::type_id::create("a",this);
    sb=scb::type_id::create("sb",this);
  endfunction
  
  function void connect_phase(uvm_phase phase);
    a.m.item_collected_port.connect(sb.item_collected_export);
  endfunction
endclass