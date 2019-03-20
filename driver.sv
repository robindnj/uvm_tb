class dri extends uvm_driver#(seq_item);
  virtual fin f;
  `uvm_component_utils(dri)
  function new(string name="dri",uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(!uvm_config_db#(virtual fin)::get(this,"*","fin",f))
      `uvm_fatal("No_f",{"Virtual interface must be set:",get_full_name(),".f"})
   endfunction
      
   virtual task run_phase(uvm_phase phase);
//    repeat(5)
      begin
    seq_item_port.get_next_item(req);
 // .............................................................
    f.data_in=req.data_in;
 //   f.wr_en=req.wr_en;
   // f.port_0=req.port_0;
   // f.port_1=req.port_1;
    f.addr_0=req.addr_0;
    f.addr_1=req.addr_1;    
   
 //.............................................................       
    $display("Driver");
    req.print();
    seq_item_port.item_done();
      end
    endtask
endclass
    
      