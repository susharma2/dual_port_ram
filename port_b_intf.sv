interface port_b_intf(input bit clk_b, input bit rst_b);
`include "define_file.sv"
      logic                   we_b;
      logic [`ADDR_WIDTH-1:0] addr_b;
      logic [`DATA_WIDTH-1:0] data_in_b;
      logic [`DATA_WIDTH-1:0] data_out_b;
     
     
clocking master_b@(posedge clk_b);
input data_out_b;
output we_b, addr_b,data_in_b;
endclocking

clocking slave_b@(posedge clk_b);
output data_out_b;
input we_b, addr_b,data_in_b;
endclocking


covergroup cg_b@(posedge clk_b);
   
WEN_B:coverpoint we_b{
    bins WE_EN_PORT_B = {[0:1]};
}
ADDR_B: coverpoint addr_b{
     bins ADDR_MIN = {0};
     bins ADDR_LOW = {[0:5]};
     bins ADDR_MID = {[6:10]};
     bins ADDR_HIGH = {[11:14]};
     bins ADDR_MAX = {15};
}
DATA_IN_B:coverpoint data_in_b{
    bins DATA_MIN      = {8'h00};
    bins DATA_LOW      = {[8'h01 : 8'h40]};
    bins DATA_MID_LOW  = {[8'h41 : 8'h7F]};
    bins DATA_MID_HIGH = {[8'h80 : 8'hC0]};
    bins DATA_HIGH     = {[8'hC1 : 8'hFE]};
    bins DATA_MAX      = {8'hFF};
}

ADDR_AND_DATA_CROSS_PORT_B:cross ADDR_B,DATA_IN_B;

endgroup

cg_b inst_b = new();

/*******************************************************************************************/
// ASSERTIONS
//
/********************************************************************************************/
/*
 property p1;
@(posedge clk_b) disable iff(rst_b)

endproperty

a1: assert property(p1) else $error("FAILED....");
*/
endinterface
