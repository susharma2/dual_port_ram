class port_b_monitor;

virtual port_b_intf bintf;

task run;
     port_b_trans trans_b;
     forever begin 
      trans_b = new();
     @(posedge bintf.clk_b)
     if(bintf.slave_b.we_b == 1) begin
      trans_b.we_b         = bintf.slave_b.we_b;
      trans_b.addr_b       = bintf.slave_b.addr_b;
      trans_b.data_in_b    = bintf.slave_b.data_in_b;
      trans_b.data_out_b   = bintf.master_b.data_out_b;
      $display("[PORT_B]--T=%0t->Write=%0d,Read=%0d,addr=%0d", $time,trans_b.data_in_b,trans_b.data_out_b,trans_b.addr_b);
     end
     end
endtask

endclass
