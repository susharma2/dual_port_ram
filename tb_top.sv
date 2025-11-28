module tb_top;
`include "define_file.sv"
import pkg_a::*;
import pkg_b::*;
import pkg::*;

      logic                   clk_a;
      logic                   rst_a;
      logic                   we_a;
      logic [`ADDR_WIDTH-1:0] addr_a;
      logic [`DATA_WIDTH-1:0] data_in_a;
      wire  [`DATA_WIDTH-1:0] data_out_a;

      logic                   clk_b;
      logic                   rst_b;
      logic                   we_b;
      logic [`ADDR_WIDTH-1:0] addr_b;
      logic [`DATA_WIDTH-1:0] data_in_b;
      wire  [`DATA_WIDTH-1:0] data_out_b;
    
initial begin
 clk_a = 0;
     rst_a = 0;
#10; rst_a = 1;
#10; rst_a = 0;

 forever #10 clk_a = ~clk_a;

end

initial begin
 clk_b = 0;

     rst_b = 0;
#10; rst_b = 1;
#10; rst_b = 0;
 forever #10 clk_b = ~clk_b;
end

port_a_intf aintf(clk_a,rst_a);
port_b_intf bintf(clk_b,rst_b);

dual_port_ram DUT(  .clk_a(clk_a),
                    .rst_a(rst_a),
                    .addr_a(aintf.master_a.addr_a),
                    .data_in_a(aintf.master_a.data_in_a),
                    .we_a(aintf.master_a.we_a),
                    .data_out_a(aintf.master_a.data_out_a),
                    .clk_b(clk_b),
                    .rst_b(rst_b),
                    .addr_b(bintf.master_b.addr_b),
                    .data_in_b(bintf.master_b.data_in_b),
                    .we_b(bintf.master_b.we_b),
                    .data_out_b(bintf.master_b.data_out_b)                  
                   );

test tt;
initial begin
  tt = new();
  tt.env.aintf = aintf;
  tt.env.bintf = bintf;
  tt.run();  
#100; $finish;
end

endmodule
