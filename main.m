% Função principal do exercício-programa 1 da disciplina PEA 3306
% (Conversão Eletromecanica de Energia)

% Declaração de valores a serem utilizados
phi = 0.55481103298; % arcos (0.85) = 0.555 em radianos 

r1 = 1.3;
x1 = 4.5;

r2_linha = r1;
x2_linha = x1;

rp_alta_tensao = 60208;
xm_alta_tensao = 19963.75;

z_cc = (j*rp_alta_tensao*xm_alta_tensao)/(rp_alta_tensao + j*xm_alta_tensao);
z_aberto = r1 + j*x1;

V2_linha = 11000;

% Declaração de variáveis a serem utilizadas
porcentagem_da_potencia_nominal_horizontal = length(1201); % O valor 1201 é o número de iterações feitas no loop subsequente.
iteracao = 0;
potencia_nominal = 250000; % [VA]

for porcentagem = 0.3: 0.001: 1.5 %Vamos iterar de 30% a 150% ao passo de 0.1%
    iteracao = iteracao + 1;
    porcentagem_da_potencia_nominal_horizontal(iteracao) = porcentagem;
end

% O vetor porcentagemDaPotenciaNominal é um vetor horizontal que possui
% todos os valores de porcentagem, com separação de 0.01%, entre 30% e 150%

% Vamos converter esse vetor para vertical
porcentagem_da_potencia_nominal = porcentagem_da_potencia_nominal_horizontal';

% Criamos um vetor com todos os valores de potencia aparente S que serão utilizados
S = potencia_nominal .* porcentagem_da_potencia_nominal;

S_complexo = S*cos(phi) + j*S*sin(phi); 

I2_linha_conjugado = S_complexo ./ V2_linha;
I2_linha = conj(I2_linha_conjugado);

E_alta_tensao = z_aberto .* I2_linha + V2_linha;

I0 = E_alta_tensao ./ z_cc;
I1 = I0 + I2_linha;

V1 = z_aberto * I1 + E_alta_tensao;

V2_aberto = V1/(1 + (z_aberto/z_cc));

real_S = real(S);
real_V1I1 = (real(V1 .* conj(I1)));

rendimento = CalculaRendimento(S_complexo, V1, I1);
regulacao = CalculaRegulacao(V2_aberto, V2_linha);

porcentagem_da_potencia_nominal_100 = porcentagem_da_potencia_nominal * 100;

figure
plot(porcentagem_da_potencia_nominal_100, rendimento, '.');
title('Relação entre carregamento e rendimento do transformador, mantendo tensão no secundário constante.');
xlabel('Carregamento do transformador (em % da potência nominal)');
ylabel('Rendimento do transformador (%)');

pause;

plot(porcentagem_da_potencia_nominal_100, regulacao, '.');
title('Relação entre carregamento e regulação do transformador, mantendo tensão no secundário constante.');
xlabel('Carregamento do transformador (em % da potência nominal)');
ylabel('Regulação do transformador (%)');
