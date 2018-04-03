function rendimento = CalculaRendimento(S, V1, I1)
% Funcao que calcula o rendimento

    rendimento = ((real(S)) ./ (real(V1 .* conj(I1)))) * 100;
    
end

