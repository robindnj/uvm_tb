// or browse Examples
`include "test.sv"
`include "interface.sv"

module top;
  logic clk;
   logic wr_en;
  logic port_1,port_0;
 
  fin f(clk,port_0,port_1,wr_en);
  //reg[3:0] addr_1,addr_0,data_in;
  //wire [3:0] data_out0,data_out1;
  dualram dut1(.wr_en(f.wr_en),.clk(f.clk),.addr_1(f.addr_1),.addr_0(f.addr_0),.port_1(f.port_1),.port_0(f.port_0),.data_out0(f.data_out0),.data_out1(f.data_out1),.out(f.out),.data_in(f.data_in));
  
  initial
    begin
      uvm_config_db#(virtual fin)::set(uvm_root::get(),"*","fin",f);
    //  $dumpfile("dump.vcd"); 
   //// $dumpvars;
    end
  
  initial begin
    clk=0;
    #10;
    clk=1;
    //addr_0=0;
    //addr_1=0;
    port_1=1;
    port_0=0;
    wr_en=1;
    //#20;
    //port_0=1;
    //port_1=0;
  end 
  initial
    begin
      run_test("test");
    end
  always
   #5 clk=~clk;
  initial
  #1000 $finish;
  initial begin
    $dumpfile("dualram.vcd");
    $dumpvars();
  end
endmodule
  
  