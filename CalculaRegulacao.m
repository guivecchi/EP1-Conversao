function regulacao = CalculaRegulacao(Vaberto, Vcarga)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    
    regulacao = (Vaberto - Vcarga) ./ (Vcarga);
    
    % Potencialmente teremos q fazer muitas mudanças nessa função por que
    % temos que usar os valores de potencia pra calculá-la

end

