
package my_pkg;
  timeunit 1ns/1ns;

  `include "uvm_macros.svh"
  import uvm_pkg::*;
  
  typedef class agent;
  typedef class coverage;
  typedef class driver;
  typedef class environment;
  typedef class monitor;
  typedef class sequence;
  typedef class sequencer;
  typedef class scoreboard;

  `include "./tb/Tx_data.svh"
  `include "./tb/Tx_write.svh"
  `include "./tb/Tx_read.svh"
  `include "./tb/Write_sequence.svh"
  `include "./tb/Sequencer.svh"
  `include "./tb/Driver.svh"
  `include "./tb/Monitor.svh"
  `include "./tb/Agent.svh"
  `include "./tb/Coverage_collector.svh"
  `include "./tb/Environment.svh"
  `include "./tb/Scoreboard.svh"
  `include "./tb/Confg.svh"
  `include "./tb/Virtual_sequence.svh"
  `include "./tb/Test_write.svh"

endpackage: my_pkg