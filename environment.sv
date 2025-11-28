class environment;

generator             gen;
port_a_driver         drvr_a;
port_b_driver         drvr_b;
port_a_monitor        mntr_a;
port_b_monitor        mntr_b;


virtual port_a_intf aintf;
virtual port_b_intf bintf;

mailbox gen_to_drv_a;
mailbox gen_to_drv_b;

function new();
  gen    = new();
  drvr_a = new();
  drvr_b = new();
  mntr_a = new();
  mntr_b = new();
  gen_to_drv_a = new();
  gen_to_drv_b = new();

endfunction

task run;
    drvr_a.aintf = aintf;
    drvr_b.bintf = bintf;

    mntr_a.aintf = aintf;
    mntr_b.bintf = bintf;
   
    gen.gen_to_drv_a = gen_to_drv_a; 
    gen.gen_to_drv_b = gen_to_drv_b;   

    drvr_a.gen_to_drv_a = gen_to_drv_a;
    drvr_b.gen_to_drv_b = gen_to_drv_b;
   
  fork
         gen.a_write_a_read();
         gen.b_write_b_read();
        //gen.a_write_a_read_single();
        //gen.b_write_b_read_single();
        drvr_a.run();
        drvr_b.run();
        mntr_a.run();
        mntr_b.run();
   join_any

endtask

endclass
