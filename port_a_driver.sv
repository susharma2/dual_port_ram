class port_a_driver;

 mailbox gen_to_drv_a;
 virtual port_a_intf aintf;
  
task run;
 port_a_trans trans_a;
     forever begin
      gen_to_drv_a.get(trans_a);
     @(posedge aintf.clk_a)
      aintf.master_a.we_a      <= trans_a.we_a;
      aintf.master_a.addr_a    <= trans_a.addr_a;
      aintf.master_a.data_in_a <= trans_a.data_in_a;
      end
endtask

endclass
