module Display7Seg (Entrada, Hex);
	//entradas
	input wire[6:0] Entrada;
	//saidas
	output reg [6:0] Hex;
	// Digitos e simbolos
	localparam espaco = 7'b1111111; //7F
	localparam menos  = 7'b0111111; //3F
	localparam zero   = 7'b1000000; //40
	localparam um 	   = 7'b1111001; //79
	localparam dois   = 7'b0100100; //24
	localparam tres 	= 7'b0110000; //30
	localparam quatro = 7'b0011001; //19
	localparam cinco  = 7'b0010010; //12
	localparam seis 	= 7'b0000010; //02
	localparam sete 	= 7'b1111000; //78
	localparam oito 	= 7'b0000000; //00
	localparam nove 	= 7'b0011000; //18
	localparam A 	   = 7'b0001000; //08
	localparam B 	   = 7'b0000011; //03
	localparam C 	   = 7'b1000110; //46
	localparam D   	= 7'b0100001; //21
	localparam E 	   = 7'b0000110; //06
	localparam F 	   = 7'b0001110; //0E


	always @ (Entrada) 
	case (Entrada)
		 6'b000000: Hex <= zero;
		 6'b000001: Hex <= um;
		 6'b000010: Hex <= dois;
		 6'b000011: Hex <= tres;
		 6'b000100: Hex <= quatro;
		 6'b000101: Hex <= cinco;
		 6'b000110: Hex <= seis;
		 6'b000111: Hex <= sete;
		 6'b001000: Hex <= oito;
		 6'b001001: Hex <= nove;
		 6'b001010: Hex <= A;
		 6'b001011: Hex <= B;
		 6'b001100: Hex <= C;
		 6'b001101: Hex <= D;
		 6'b001110: Hex <= E;
		 6'b001111: Hex <= F;
		 default: Hex <= menos;
	  endcase
endmodule
