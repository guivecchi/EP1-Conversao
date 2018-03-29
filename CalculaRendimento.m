function rendimento = CalculaRendimento(potenciaPrimario, potenciaSecundario)
% Funcao que calcula o rendimento

% Se formos utilizar a fração das potencias, teremos:
rendimento = potenciaSecundario / potenciaPrimario;

% Se formos utilizar a formula mais completa teriamos:
% function rendimento = CalculaRendimento(V2, I2, phi2, perdasFerro, perdasJoule)
% rendimento = (V2*I2*cos(phi2))/(V2*I2*cos(phi2)+perdasFerro+perdasJoule)

% Possiveis mudanças: Vetorização

end

