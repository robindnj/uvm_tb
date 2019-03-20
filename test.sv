`include "environment.sv"
`include "coverage.sv"
class test extends uvm_test;
  envi e;
  seqn s1;
  coverage cov;
  `uvm_component_utils(test)
  
  function new(string name="test",uvm_component parent=null);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    e=envi::type_id::create("e",this);
    s1=seqn::type_id::create("s1",this);
    cov=new("coverage",this);
  endfunction
  
  function void end_of_elobration();
    print();
  endfunction
   
  function void report_phase(uvm_phase phase);
   uvm_report_server svr;
   super.report_phase(phase);
   
   svr = uvm_report_server::get_server();
   if(svr.get_severity_count(UVM_FATAL)+svr.get_severity_count(UVM_ERROR)>0) begin
     `uvm_info(get_type_name(), "---------------------------------------", UVM_NONE)
     `uvm_info(get_type_name(), "----            TEST FAIL          ----", UVM_NONE)
     `uvm_info(get_type_name(), "---------------------------------------", UVM_NONE)
    end
    else begin
     `uvm_info(get_type_name(), "---------------------------------------", UVM_NONE)
     `uvm_info(get_type_name(), "----           TEST PASS           ----", UVM_NONE)
     `uvm_info(get_type_name(), "---------------------------------------", UVM_NONE)
    end
  endfunction

  virtual task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    s1.start(e.a.s);
    cov.run_phase(null);
    phase.phase_done.set_drain_time(this,30);
    phase.drop_objection(this);
  endtask
endclass