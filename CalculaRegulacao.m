function regulacao = CalculaRegulacao(V2_aberto, V2)
% Funcao que calcula a regulacao
    
    regulacao = abs((abs(V2_aberto) - abs(V2)) ./ (abs(V2))) * 100;
    
    % Potencialmente teremos q fazer muitas mudanças nessa função por que
    % temos que usar os valores de potencia pra calculá-la

end

