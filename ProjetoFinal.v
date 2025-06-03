module ProjetoFinal (Dados, Instrucao, clk, rst, Disp0, Disp1, Disp2, Disp3, fim);

	//Entradas do Proj
	input rst, clk, Instrucao;
	input [3:0] Dados;
	
	//Saida dos Proj
	output fim;
	output [6:0] Disp0, Disp1, Disp2, Disp3;
	
	// Variaveis para instanciar os modulos (os fios basicamente)
	wire EnA, EnB, EnC, sel_R, sel_in;
	wire [1:0] Op_Reg, Op_ULA;
   wire [3:0] Saida_reg_A, Saida_reg_B, Saida_reg_C;
	wire [3:0] saida_Seletor_in;
	wire [3:0] saidaULA;
	wire [3:0] Saida;
	wire [3:0] saida_Seletor_Reg;
	
	//Seletor_in (sel, dados, ula, saida);
	Seletor_in seletor_Entrada(sel_in, Dados, saidaULA, saida_Seletor_in);
	
	//RegABC(enable, clk, saida, dados, rst);
	RegABC regA(EnA, clk, Saida_reg_A, saida_Seletor_in, rst);
	RegABC regB(EnB, clk, Saida_reg_B, saida_Seletor_in, rst);
	RegABC regC(EnC, clk, Saida_reg_C, saida_Seletor_in, rst);
	
	//Ula(entradaA, entradasel, op, saidalu);
	Ula circuitoUla(Saida_reg_A, saida_Seletor_Reg, Op_ULA, saidaULA);
	
	//SeletorReg (sel, entradaB, entradaC, saida );
	SeletorReg seletorBC(sel_R, Saida_reg_B, Saida_reg_C, saida_Seletor_Reg);
	
	//RegD (sel_r,op_reg, clk, rst,saida);
	RegD registradorD(saida_Seletor_Reg, Op_Reg, clk, rst, Saida);
	
	//UnidadeDeControle (EnA,EnB,EnC,Sel_in,Sel_R,Op,Op_Reg,fim,Instrucao,clk,rst);
	UnidadeDeControle UDC(EnA,EnB,EnC,sel_in,sel_R,Op_ULA,Op_Reg,fim,Instrucao,clk,rst);
	
	//Display7Seg (Entrada, Hex);
	Display7Seg display1({3'b000, Saida_reg_A}, Disp0);
	Display7Seg display2({3'b000, Saida_reg_B}, Disp1);
	Display7Seg display3({3'b000, Saida_reg_C}, Disp2);
	Display7Seg display4({3'b000, Saida}, Disp3);
		
endmodule
