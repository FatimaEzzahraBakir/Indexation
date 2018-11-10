function [ CoefDeriv ] = DerivPoly( coeff )

l=length(coeff);
puissance = 0:l-1;
CoefDeriv=coeff.*puissance;
CoefDeriv(1)=[];
end

