function regulacao = CalculaRegulacao(V2_aberto, V2)
% Funcao que calcula a regulacao
% regulação = |(|V2'aberto| - |V2'|)/|V2'|| * 100
% Os valores de tensão são utilizados em módulo por serem fasores
    
    regulacao = ((abs(V2_aberto) - abs(V2)) ./ (abs(V2))) * 100;

end

