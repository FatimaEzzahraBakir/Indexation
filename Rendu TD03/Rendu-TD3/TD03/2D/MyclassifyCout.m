function  Res  = MyclassifyCout(test, modelBar, modelSaumon, pBar, pSaumon, mcout)

    probBar     = mvnpdf(test,modelBar.mu, modelBar.sigma)*pBar*mcout(2, 1);
    probSaumon  = mvnpdf(test,modelSaumon.mu, modelSaumon.sigma)*pSaumon*mcout(1, 2);
    
    Res=probBar>=probSaumon;

end
