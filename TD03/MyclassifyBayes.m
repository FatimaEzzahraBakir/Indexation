function [ Res ] = MyclassifyBayes( test,modelBar,modelSaumon,pBar,pSaumon,cout )

probBar=mvnpdf(test,modelBar.mu,modelBar.sigma)*pBar*cout(1,2);
probSaumon=mvnpdf(test,modelSaumon.mu,modelSaumon.sigma)*pSaumon*cout(2,1);
   
    
    Res =probBar >= probSaumon;


end

