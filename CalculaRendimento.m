function rendimento = CalculaRendimento(S, V1, I1)
% Funcao que calcula o rendimento
% rendimento = Re{S}/Re{VI*} * 100
% Re{S} nos dá a potência ativa dissipada pela carga
% Re{V1I1*} nos dá a potência ativa fornecida pela fonte, dado que V1I1* é 
% o produto do fasor V1 pelo conjugado do fasor I1, o que nos dá a potência
% aparente complexa fornecida pela fonte.

    rendimento = ((real(S)) ./ (real(V1 .* conj(I1)))) * 100;
    
end

