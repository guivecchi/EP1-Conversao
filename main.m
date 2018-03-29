% Função principal do exercício-programa 1 da disciplina PEA 3306
% (Conversão Eletromecanica de Energia)

porcentagemDaPotenciaNominalHorizontal = length(1201); % O valor 1201 é o número de iterações feitas no loop subsequente.
iteracao = 0;
potenciaNominal = 250; % [kVA] Não usaremos 250000 para simplificação dos valores mostrados nos gráficos

for porcentagem = 0.3: 0.001: 1.5 %Vamos iterar de 30% a 150% ao passo de 0.1%
    iteracao = iteracao + 1;
    porcentagemDaPotenciaNominalHorizontal(iteracao) = porcentagem;
end
% O vetor porcentagemDaPotenciaNominal é um vetor horizontal que possui
% todos os valores de porcentagem, com separação de 0.1%, entre 30% e 150%

% Vamos converter esse vetor para vertical
porcentagemDaPotenciaNominal = porcentagemDaPotenciaNominalHorizontal';

% Criamos um vetor com todos os valores de potencia que serão utilizados
valoresPotencia = potenciaNominal .* porcentagemDaPotenciaNominal;


