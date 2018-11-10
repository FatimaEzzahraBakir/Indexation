function [ V ] = CalculACP( Echantillon)

moyenne = mean(Echantillon);
Echantillon = Echantillon - moyenne;
Covariance = cov(Echantillon);
S = (size (Covariance,1)-1)*cov(Covariance);
[e,lamda]=eigs(S);
[lambdaS,indice]=sort(diag(lamda),'descend');


V=e(:,indice);

end

