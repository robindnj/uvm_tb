// Code your design here
module dualram(clk,wr_en,data_out1,data_out0,port_0,port_1,addr_1,addr_0,data_in,out);
  input  wr_en;
  input clk;
  input port_1;
  input port_0;
  input bit [3:0] addr_1,addr_0,data_in;
  output bit [3:0] data_out0,data_out1;
  output bit [3:0] out;
  reg [3:0] ram [7:0];
  always@(posedge clk)
    //$display("data=%d",data_in);
    begin
      if((wr_en==1)&&(port_0==1))
        begin
        ram[addr_0]=data_in;
          $display("outtt =%d",ram[addr_0]);
          //addr_0=addr_0+1
       data_out0=ram[addr_0];
          out=data_out0;
         // addr_0=addr_0-1
        end
      else if((wr_en==1)&&(port_1==1))
        begin
        ram[addr_1]=data_in;
          $display("outtt11 =%d",ram[addr_1]);
          //addr_1=addr_1+1
      data_out1=ram[addr_1];
          out=data_out1;
          //addr_1=addr_1-1
        end
      //else
        //$display("no read and write operation is performed");
    end
endmodule
      
  