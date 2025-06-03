module Ula (entradaA, entradasel, op, saidalu);

	input[3:0] entradaA;
	input[3:0] entradasel;
	input[1:0] op;
	
	output reg [3:0]saidalu;
	
	always @(*)begin
		case(op)
			0: saidalu<= entradaA;
			1: saidalu<= entradaA+entradasel;
		   2: saidalu<= entradaA-entradasel;
			3: saidalu<= ~entradaA;
		
		endcase
	end
	
endmodule	