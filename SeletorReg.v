module SeletorReg (sel, entradaB, entradaC, saida );
	input [3:0] entradaB;
	input [3:0] entradaC;
	input sel;
	
	output reg [3:0] saida;
	
	always@(*)begin
			if(sel==0)
					saida<=entradaB;
			else
					saida<=entradaC;					
	end
endmodule
