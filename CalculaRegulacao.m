function regulacao = CalculaRegulacao(Vaberto, Vcarga)
% Funcao que calcula a regulacao
    
    regulacao = (Vaberto - Vcarga) ./ (Vcarga);
    
    % Potencialmente teremos q fazer muitas mudanças nessa função por que
    % temos que usar os valores de potencia pra calculá-la

end

