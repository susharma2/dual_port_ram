class port_b_trans;

rand bit we_b;
rand bit[`ADDR_WIDTH-1:0]addr_b;
rand bit[`DATA_WIDTH-1:0]data_in_b;
     bit[`DATA_WIDTH-1:0]data_out_b;

constraint addr_range_b {addr_b >=0;addr_b<=15;};
constraint data_range_b {data_in_b >=0;data_in_b<=255;};

function void print(string tag="");
    $display("T=%0t %s addr_b=%0d,data_in_b=%0d, we_b=%0b, data_out_b= %0d", $time, tag, addr_b, data_in_b,we_b,data_out_b);
endfunction

endclass
