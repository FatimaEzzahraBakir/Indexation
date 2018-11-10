
function  Res  = MyclassifyML(test,modelBar,modelSaumon)


% ICI ON A FAIT ML:

    probBar= mvnpdf(test,modelBar.mu,modelBar.sigma);
    probSaumon= mvnpdf(test,modelSaumon.mu,modelSaumon.sigma);

    Res = probBar >= probSaumon;  


   
    
end