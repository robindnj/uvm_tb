class mon extends uvm_monitor;
  virtual fin f;
  `uvm_component_utils(mon)
  uvm_analysis_port#(seq_item)item_collected_port;
  seq_item i;
  function new(string name="mon",uvm_component parent);
    super.new(name,parent);
    i=new();
    item_collected_port=new("item_collected_port",this);
  endfunction
  // consrtuctor for interface......................
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
     if(!uvm_config_db#(virtual fin)::get(this,"*","fin",f))
      `uvm_fatal("No_f",{"Virtual interface must be set:",get_full_name(),".f"})
   endfunction
//..........................................................       
  virtual task run_phase(uvm_phase phase);
   // repeat(5)
      begin
       #10;
      @(posedge f.clk);
 //..................................................................
       i.wr_en=f.wr_en;
       i.port_1=f.port_1;
       i.port_0=f.port_0;
       i.addr_1=f.addr_1;
       i.addr_0=f.addr_0;   
       i.data_in=f.data_in;
       i.data_out0=f.data_out0;
       i.data_out1=f.data_out1;
       i.out=f.out;
//....................................................................
    $display("Monitor");
    i.print();
    item_collected_port.write(i);
      end
   endtask
endclass