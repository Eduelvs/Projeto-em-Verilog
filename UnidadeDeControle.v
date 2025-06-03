module UnidadeDeControle (EnA,EnB,EnC,Sel_in,Sel_R,Op,Op_Reg,fim,instrucao,clk,rst);

input instrucao, clk, rst;
output reg EnA, EnB, EnC, Sel_in, fim, Sel_R;
output reg[1:0] Op, Op_Reg;

reg[3:0] estado;
parameter  S0 = 0, S1 = 1, S2 = 2, S3 = 3, S4 = 4, S5 = 5, S6 = 6, S7 =7,S8 = 8, S9 = 9, S10 =10, S11 =11, S12 =12; 

always@(posedge clk, negedge rst)begin
if(rst == 1'b0) estado <= S0;
else
	case(estado)

            S0: estado <= S1;//carrega a
				S1: estado <= S2;//carrega b
				S2: estado <= S3;//carrega c
				S3: begin
					if(instrucao)begin
						estado <= S8;//(a+b+c)/2
					end
					else begin
						estado <= S4;//a+b+b-c
					end
				end
				S3: estado <= S4;
				S4: estado <= S5;
				S5: estado <= S6;
				S6: estado <= S7;
				S7: estado <= S12;
				S8: estado <= S9;
				S9: estado <= S10;
				S10: estado <= S11;
				S11: estado <= S12;
				S12: estado <= S0;//fim
			endcase

end


	always@(estado)begin
		case(estado)
			S0: begin //carrega tudo com zero
				EnA = 0;
				EnB = 0;
				EnC = 0;
				Sel_in = 0;
				Sel_R = 0;
				Op = 2'b00;
				Op_Reg = 2'b00;
				fim = 0;
			end
			S1: begin //carrega reg_a com o valor dos dados
				EnA = 1'b1;
				EnB = 0;
				EnC = 0;
				Sel_in = 0;
				Sel_R = 0;
				Op = 2'b00;
				Op_Reg = 2'b00;
				fim = 0;
			end
			S2: begin //carrega reg_b com o valor dos dados
				EnB = 1'b1;
				EnA = 0;
				EnC = 0;
				Sel_in = 0;
				Sel_R = 0;
				Op = 2'b00;
				Op_Reg = 2'b00;
				fim = 0;
			end
			S3: begin //carrega reg_c com o valor dos dados
				EnC = 1'b1;
				EnB = 0;
				EnA = 0;
				Sel_in = 0;
				Sel_R = 0;
				Op = 2'b00;
				Op_Reg = 2'b00;
				fim = 0;
			end
			S4: begin // inicio da instrucao 0
				EnA = 1;
				EnB = 0;
				EnC = 0;
				Sel_in = 1;
				Sel_R = 0;
				Op = 2'b01; //ula faz a soma de a+b
				Op_Reg = 2'b00;
				fim = 0;
			end
			S5: begin 
				EnA = 1; //carrega registro A com a+b
				EnB = 0;
				EnC = 0;
				Sel_in = 1;
				Op = 2'b01; // Soma B com o valor do registro A - a+b+b
				Sel_R = 0;
				Op_Reg = 2'b00;
				fim = 0;
			end
			S6: begin
			   EnA = 0; // Carrega registro A com a+b+b
				EnB = 0; 
				EnC = 1; // Ativa registro C pra receber o valor da ultima operacao
				Sel_in = 1;
				Sel_R = 1;
				Op = 2'b10; // Subtrai C, a+b+b-c
				Op_Reg = 2'b00;
				fim = 0;
			end	
			S7: begin
			   EnA = 0; 
				EnB = 0; 
				EnC = 0;
				Sel_in = 1;
				Sel_R = 1;
				Op = 2'b00;
				Op_Reg = 2'b01; // Carrega os dados no registro D
				fim = 0;
			end	//fim da instrucao 0 
			S8: begin //inicio da instrucao 1
				EnA = 1; // Ativa registro A para receber a soma da ula 
				EnB = 0; 
				EnC = 0;
				Sel_R = 0;
				Sel_in = 1;
				Op = 2'b01; // faz a soma a+b
				Op_Reg = 2'b00;
				fim = 0;
			end
			S9: begin
				EnA = 0; 
				EnB = 0; 
				EnC = 1; // Ativa registro C para receber o resultado da ultima operacao 
				Sel_R = 1;
				Sel_in = 1;
				Op = 2'b01; // faz a soma a+b+c
				Op_Reg = 2'b00;
				fim = 0;
			end
			S10: begin // a+b+c é carregado no registro C
				EnA = 0;
				EnB = 0; 
				EnC = 0;  
				Sel_R = 1;
				Sel_in = 1;
				Op = 2'b00; 
				Op_Reg = 2'b01; // Carrega os dados no registro D
				fim = 0;
			end
			S11: begin
				EnA = 0;
				EnB = 0; 
				EnC = 0;
				Sel_R = 1;
				Sel_in = 1;
				Op = 2'b00; 
				Op_Reg = 2'b10; // Desloca para a direita - a+b+c/2
				fim = 0;
			end
			S12: begin //estado final ativa a flag de fim 
				EnA = 0;
				EnB = 0; 
				EnC = 0;
				Sel_R = 0;
				Sel_in = 0;
				Op = 2'b00; 
				Op_Reg = 2'b00;
				fim = 1;
			end
		endcase
	end
endmodule
