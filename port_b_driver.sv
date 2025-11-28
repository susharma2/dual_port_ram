class port_b_driver;

 mailbox gen_to_drv_b;
 virtual port_b_intf bintf;
  
task run;
 port_b_trans trans_b;
     forever begin
      gen_to_drv_b.get(trans_b);
     @(posedge bintf.clk_b)
      bintf.master_b.we_b      <= trans_b.we_b;
      bintf.master_b.addr_b    <= trans_b.addr_b;
      bintf.master_b.data_in_b <= trans_b.data_in_b;
      end
endtask

endclass
