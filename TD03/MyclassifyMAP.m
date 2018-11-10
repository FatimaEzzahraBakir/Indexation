function [ Res ] = MyclassifyMAP( test,modelBar,modelSaumon,pBar,pSaumon )

probBar=normpdf(test,modelBar.mu,modelBar.sigma)*pBar;
probSaumon=normpdf(test,modelSaumon.mu,modelSaumon.sigma)*pSaumon;
   
    
    Res =probBar >= probSaumon;

end

