interface intf(input logic clk,port_1,port_0,wr_en);
 // logic wr_en;
 // logic port_1;
 // logic port_0;
  logic [3:0] addr_1;
  logic [3:0] addr_0;
  logic [3:0] data_in;
  logic [3:0] data_out0;
  logic [3:0] data_out1;
  logic [3:0] ram [7:0];
  logic [3:0] out;
endinterface
  