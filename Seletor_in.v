module Seletor_in (sel, dados, ula, saida);
		input [3:0]dados;
		input [3:0]ula;
		input sel;
		
		output reg [3:0] saida;
	
		always @(*)begin
			if(sel==0)
					saida<=dados[3:0];
			else
					saida<=ula;
		end
			
endmodule
