function [V] = CalculACI( Echantillon1, Echantillon2)


Sw = cov(Echantillon1)+cov(Echantillon2);
n1 = size(Echantillon1);
n1 = n1(1,1);

n2 = size(Echantillon2);
n2 = n2(1,1);

S = n1*transpose(mean(Echantillon1) -(mean(Echantillon1) +mean(Echantillon2))) *(mean(Echantillon1) - (mean(Echantillon1) + mean(Echantillon2)));


S = S + n2*transpose(mean(Echantillon2) - (mean(Echantillon1) + mean(Echantillon2)))*(mean(Echantillon2) - (mean(Echantillon1) + mean(Echantillon2)));

Sb=S;

S = inv(Sw)*Sb;

[VectP,ValP] = eig(S);

[lambdaS, indice]=sort(diag(ValP),'descend');

matrice = zeros(size(indice,1));

for i=1:size(indice,1)
    matrice(:,i) = VectP( :, indice (i,1) );
end
V = matrice;

end

