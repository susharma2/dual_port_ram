class port_a_monitor;

virtual port_a_intf aintf;

task run;
     port_a_trans trans_a;
     forever begin 
      trans_a = new();
     @(posedge aintf.clk_a)
     if(aintf.slave_a.we_a == 1) begin
      trans_a.we_a         = aintf.slave_a.we_a;
      trans_a.addr_a       = aintf.slave_a.addr_a;
      trans_a.data_in_a    = aintf.slave_a.data_in_a;
      trans_a.data_out_a   = aintf.master_a.data_out_a;
      $display("[PORT_A]--T=%0t->Write=%0d, Read=%0d,addr=%0d", $time,trans_a.data_in_a,trans_a.data_out_a,trans_a.addr_a);
     end
     end
endtask

endclass
