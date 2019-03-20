class scb extends uvm_scoreboard;
  virtual fin f;
  `uvm_component_utils(scb)
  seq_item qin[$];
  seq_item i;
  bit [0:3] temp;
  uvm_analysis_imp#(seq_item,scb)item_collected_export;
  //.............................
  function new(string name="scb",uvm_component parent);
    super.new(name,parent);
    i=new();
    item_collected_export=new("item_collected_port",this);
  endfunction
  //.................................
  //constuctor for interface.........................
   function void build_phase(uvm_phase phase);
    super.build_phase(phase);
     if(!uvm_config_db#(virtual fin)::get(this,"*","fin",f))
       `uvm_fatal("No_f",{"Virtual interface must be set:",get_full_name(),".f"})
      endfunction
  //............................................    
   virtual function void write(seq_item se);
      $display("output from monitor");
     se.print();
     qin.push_back(se);
   endfunction
  
  virtual task run_phase(uvm_phase phase);
   // repeat(5)
      begin
    #20;
    i=qin.pop_front;
    $display("Score board poped values");
    i.print();
    if(f.clk)
      if((f.wr_en==1)&&(f.port_0==1))
        begin
          f.ram[f.addr_0]=f.data_in;
          $display("outtt =%d",f.ram[f.addr_0]);
          //addr_0=addr_0+1
          f.data_out0=f.ram[f.addr_0];
          f.out=f.data_out0;
         // addr_0=addr_0-1
        end
        else if((f.wr_en==1)&&(f.port_1==1))
        begin
          f.ram[f.addr_1]=f.data_in;
          $display("outtt11 =%d",f.ram[f.addr_1]);
          //addr_1=addr_1+1
          f.data_out1=f.ram[f.addr_1];
          f.out=f.data_out1;
          //addr_1=addr_1-1
        end
      //else
        //$display("no read and write operation is performed");


    $display("temp =%d   i.data_out0=%d",temp,i.data_out0);
    if((temp==i.data_out0)||(temp==i.data_out1))
      begin
         `uvm_info(get_type_name(),$sformatf("Reading Inputs"),UVM_LOW)
        `uvm_info(get_type_name(),$sformatf("wr_en=%b",i.wr_en),UVM_LOW)
        `uvm_info(get_type_name(),$sformatf("wr=%b",i.port_0),UVM_LOW)
        `uvm_info(get_type_name(),$sformatf("wr=%b",i.port_1),UVM_LOW)
        `uvm_info(get_type_name(),$sformatf("wr=%b",i.addr_0),UVM_LOW)
        `uvm_info(get_type_name(),$sformatf("wr=%b",i.addr_1),UVM_LOW)
        
        `uvm_info(get_type_name(),$sformatf("datain=%b",i.data_in),UVM_LOW)
        `uvm_info(get_type_name(),$sformatf("actual temp=%b expected i.dataout_0=%b  i.dataout_1=%b",temp, i.data_out0,i.data_out0),UVM_LOW)
        end
      else
       begin
           `uvm_error(get_type_name(),"------ :: READ DATA MisMatch :: ------")
         `uvm_info(get_type_name(),$sformatf("actual temp=%b expected i.dataout_0=%b          i.dataout_0=%b",temp,i.data_out0,i.data_out1),UVM_LOW)
        end
    end
    
    endtask
        endclass
       
        
    