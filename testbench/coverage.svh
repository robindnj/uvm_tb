class coverage extends uvm_component;
  virtual fin f;
  covergroup cvr_grp;
     //option.per_instance=1; 
    a1:coverpoint f.wr_en{bins z={0};}
    a2:coverpoint f.port_0{bins z={0000};}
    a3:coverpoint f.data_in {bins z={0000};}
    a4:coverpoint f.data_out0 {bins z={0000};} 
    a5:coverpoint f.addr_0 {bins z={0000};} 
    endgroup 
    
  
  function new(string name,uvm_component parent);
    super.new(name,parent);
   cvr_grp=new();
  endfunction
  
     function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    
       if(!uvm_config_db#(virtual fin)::get(this,"*","fin",f))
      `uvm_fatal("No_f",{"Virtual interface must be set:",get_full_name(),".f"})
   endfunction
  
    
 task run_phase(uvm_phase phase);
    forever begin
      @(posedge f.clk)
      cvr_grp.sample();
    end
  endtask
endclass
