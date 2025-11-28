interface port_a_intf(input bit clk_a, input bit rst_a);
`include "define_file.sv"
      logic                   we_a;
      logic [`ADDR_WIDTH-1:0] addr_a;
      logic [`DATA_WIDTH-1:0] data_in_a;
      logic [`DATA_WIDTH-1:0] data_out_a;
      
clocking master_a@(posedge clk_a);
input data_out_a;
output we_a,addr_a,data_in_a;
endclocking

clocking slave_a@(posedge clk_a);
output data_out_a;
input we_a,addr_a,data_in_a;
endclocking


covergroup cg_a@(posedge clk_a);
   
WEN_A:coverpoint we_a{
    bins WE_EN_PORT_A = {[0:1]};
}
ADDR_A: coverpoint addr_a{
     bins ADDR_MIN = {0};
     bins ADDR_LOW = {[1:5]};
     bins ADDR_MID = {[6:10]};
     bins ADDR_HIGH = {[11:14]};
     bins ADDR_MAX = {15};
}
DATA_IN_A:coverpoint data_in_a{
    bins DATA_MIN      = {8'h00};
    bins DATA_LOW      = {[8'h01 : 8'h40]};
    bins DATA_MID_LOW  = {[8'h41 : 8'h7F]};
    bins DATA_MID_HIGH = {[8'h80 : 8'hC0]};
    bins DATA_HIGH     = {[8'hC1 : 8'hFE]};
    bins DATA_MAX      = {8'hFF};
}

ADDR_AND_DATA_CROSS_PORT_A:cross ADDR_A,DATA_IN_A;

endgroup

cg_a inst_a = new();

/*******************************************************************************************/
// ASSERTIONS
//
/********************************************************************************************/
/*
 property p1;
@(posedge clk_a) disable iff(rst_a)

endproperty

a1: assert property(p1) else $error("FAILED....");
*/
endinterface
