class port_a_trans;

rand bit                 we_a;
rand bit[`ADDR_WIDTH-1:0]addr_a;
rand bit[`DATA_WIDTH-1:0]data_in_a;
     bit[`DATA_WIDTH-1:0]data_out_a;

constraint addr_range_a {addr_a >=0;addr_a<=15;};
constraint data_range_a {data_in_a >=0;data_in_a<=255;};

function void print(string tag="");
    $display("T=%0t %s addr_a=%0d,data_in_a=%0d, we_a=%0b, data_out_a= %0d", $time, tag, addr_a, data_in_a,we_a,data_out_a);
endfunction

endclass
