function  Res  = MyclassifyCout(test, modelBar, modelSaumon, pBar, pSaumon, mcout)

    probBar     = normpdf(test,modelBar.mu, modelBar.sigma)*pBar*mcout(2, 1);
    probSaumon  = normpdf(test,modelSaumon.mu, modelSaumon.sigma)*pSaumon*mcout(1, 2);
        
    Res = probBar >= probSaumon; 
    

end
