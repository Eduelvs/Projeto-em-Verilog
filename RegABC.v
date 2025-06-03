module RegABC (enable, clk, saida, dados, rst);

	input enable, clk, rst;
	input[3:0] dados;
	output reg[3:0] saida;
	
	
	always @(posedge clk, negedge rst)begin
		if(rst==0)
			saida <= 4'd0;
		else begin
			if(enable)
				saida[3:0] <= dados[3:0];
			else
				saida<=saida;
		end
	end

endmodule
