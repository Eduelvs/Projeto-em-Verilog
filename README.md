# Projeto-em-Verilog

Este projeto implementa uma unidade de processamento simples em Verilog, composta por registradores, unidade lógica e aritmética (ULA), unidade de controle, seletores e displays de 7 segmentos para visualização dos resultados.

## Estrutura dos Arquivos

- **ProjetoFinal.v**: Módulo top-level que integra todos os componentes do projeto.
- **RegABC.v**: Implementação dos registradores A, B e C.
- **RegD.v**: Implementação do registrador D, com operações adicionais.
- **Ula.v**: Unidade Lógica e Aritmética (ULA) responsável por operações como soma, subtração e inversão.
- **UnidadeDeControle.v**: Unidade de controle responsável pelo sequenciamento das operações.
- **Seletor_in.v**: Seletor de entrada para os registradores.
- **SeletorReg.v**: Seletor entre os registradores B e C.
- **Display7Seg.v**: Conversor de valores binários para o display de 7 segmentos.
- **ProjetoFinal.qsf/qpf/csv/qws**: Arquivos de configuração do projeto para o Quartus Prime.

## Funcionamento

O sistema recebe dados de entrada (`Dados`), um sinal de instrução (`Instrucao`), clock (`clk`) e reset (`rst`). Os dados passam por uma sequência de operações controladas pela unidade de controle, sendo armazenados e manipulados pelos registradores e pela ULA. Os resultados intermediários e finais são exibidos em quatro displays de 7 segmentos (`Disp0` a `Disp3`). O sinal `fim` indica o término do processamento.

## Como usar

1. Importe todos os arquivos `.v` no seu projeto Quartus.
2. Compile o projeto.
3. Faça a pinagem conforme especificado no arquivo `.qsf` ou `.csv`.
4. Programe o FPGA e utilize os sinais de entrada para testar as operações.

## Observações

- O projeto foi desenvolvido para a família MAX 10 da Intel/Altera.
- Consulte os comentários nos arquivos `.v` para detalhes de cada módulo.

---