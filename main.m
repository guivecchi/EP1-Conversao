% Função principal do exercício-programa 1 da disciplina PEA 3306
% (Conversão Eletromecanica de Energia)

% Declaração de valores a serem utilizados
phi = 0.55481103298; % arcos(0.85) = 0.555 em radianos 

r1 = 1.3; % resistência relacionada às perdas no enrolamento do primário
x1 = 4.5; % reatância relacionada às perdas no enrolamento do primário

r2_linha = r1; % resistência relacionada às perdas no enrolamento do 
               % secundário referida à alta tensão (r2')
x2_linha = x1; % reatância relacionada às perdas no enrolamento do
               % secundário referida à alta tensão (X2')

rp_alta_tensao = 60208; % resistência relacionada às perdas no núcleo
                        % referida à alta tensão
xm_alta_tensao = 19963.75; % reatância relacionada às perdas no núcleo
                           % referida à alta tensão

% impedância relacionada às perdas no núcleo (Zcc = rp + jXm):           
z_cc = (j*rp_alta_tensao*xm_alta_tensao)/(rp_alta_tensao + j*xm_alta_tensao);

% impedância relacionada às perdas no enrolamento (Zaberto = r1 + jX1):
z_aberto = r1 + j*x1;

% tensão no secundário referida à alta tensão (V2'):
V2_linha = 11000;

% Declaração de variáveis a serem utilizadas
porcentagem_da_potencia_nominal_horizontal = length(1201); 
% O valor 1201 é o número de iterações feitas no loop subsequente.

iteracao = 0;
potencia_nominal = 250000; % potência nominal (dada em potência aparente 
                           % [VA])

for porcentagem = 0.3: 0.001: 1.5 % Vamos iterar de 30% a 150% ao passo de 0.1%
    iteracao = iteracao + 1;
    porcentagem_da_potencia_nominal_horizontal(iteracao) = porcentagem;
end

% O vetor porcentagemDaPotenciaNominal é um vetor horizontal que possui
% todos os valores de porcentagem, com separação de 0.01%, entre 30% e 150%

% Vamos converter esse vetor para vertical
porcentagem_da_potencia_nominal = porcentagem_da_potencia_nominal_horizontal';

% Criamos um vetor com todos os valores de potencia aparente S que serão utilizados
S = potencia_nominal .* porcentagem_da_potencia_nominal;

% Encontramos a potência aparente complexa a partir do ângulo de defasagem
% da carga
S_complexo = S*cos(phi) + j*S*sin(phi); 

% I2', que é a corrente no secundário referida à alta tensão, é igual ao
% conjugado da potência aparente complexa dividido pela tensão V2'
I2_linha_conjugado = S_complexo ./ V2_linha;
I2_linha = conj(I2_linha_conjugado);

% Onde E é a tensão sobre os terminais de rp e Xm
% Para o primeiro caso:
% E = Zaberto * I2' + V2'
E_alta_tensao = z_aberto .* I2_linha + V2_linha;
% Para o segundo caso:
% E = 2 * Zaberto * I2' + V2'
% E_alta_tensao = (2 * z_aberto) .* I2_linha + V2_linha;

% I0 = E/Zcc
% Onde I0 é a corrente que passa por rp e Xm
I0 = E_alta_tensao ./ z_cc;

% I1 = I0 + I2'
% Onde I1 é a corrente no primário
I1 = I0 + I2_linha;

% Onde V1 é a tensão no primário
% Para o primero caso:
% V1 = Zaberto * I1 + E
V1 = z_aberto * I1 + E_alta_tensao;
% Para o segundo caso:
% V1 = E
% V1 = E_alta_tensao;

% Onde V2aberto é a tensão no secundário quando ele está em aberto
% Para o primeiro caso:
% V2aberto = V1/(1 + Zaberto/Zcc)
V2_aberto = V1/(1 + (z_aberto/z_cc));
% Para o segundo caso:
% V2aberto = V1
% V2_aberto = V1;

real_S = real(S); % potência ativa dissipada na carga
real_V1I1 = (real(V1 .* conj(I1))); % potência ativa fornecida pela fonte

rendimento = CalculaRendimento(S_complexo, V1, I1); % cálculo dos rendimentos
regulacao = CalculaRegulacao(V2_aberto, V2_linha); % cálculo das regulações

% correção para que o valor plotado seja percentual
porcentagem_da_potencia_nominal_100 = porcentagem_da_potencia_nominal * 100;

% plotagem dos gráficos de rendimento x potência 
figure
plot(porcentagem_da_potencia_nominal_100, rendimento, '.');
title('Relação entre carga e rendimento do transformador.');
xlabel('Carregamento do transformador (em % da potência nominal)');
ylabel('Rendimento do transformador (%)');

disp('Aperte enter para exibir o próximo gráfico')
pause;

% plotagem do gráfico de regulação x potência
plot(porcentagem_da_potencia_nominal_100, regulacao, '.');
title('Relação entre carga e regulação do transformador.');
xlabel('Carregamento do transformador (em % da potência nominal)');
ylabel('Regulação do transformador (%)');
