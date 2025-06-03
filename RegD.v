module RegD (sel_r,op_reg, clk, rst,saida);
		 input [3:0]sel_r;
		 input [1:0]op_reg;
		 input clk, rst;
		 
		 output reg[3:0] saida;
		 reg[3:0] sinal;
		 
		 always @(posedge clk, negedge rst) begin
			if (rst==0)
					sinal<=4'b0;
			else begin
					case ({op_reg})
								0:sinal<=sinal;
								1:sinal<=sel_r;
								2:sinal<={1'b0,sinal[3:1]};
								3:sinal<={sinal[2:0],sinal[3]};
					endcase
		end
		saida <= sinal;
		
	end
		
endmodule
