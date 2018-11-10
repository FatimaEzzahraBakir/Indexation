function Res = MyclassifyML(test,modelAD,modelCN)




% ICI ON A FAIT ML:
    probAD= mvnpdf(test,modelAD.mu,modelAD.sigma);
    probCN= mvnpdf(test,modelCN.mu,modelCN.sigma );
    Res = probAD >= probCN;  



end

