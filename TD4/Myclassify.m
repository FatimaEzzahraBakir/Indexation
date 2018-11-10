function  Res  = Myclassify(test,modelBar,modelSaumon)
   
probBar=mvnpdf(test,modelBar.mu,modelBar.sigma);
probSaumon=mvnpdf(test,modelSaumon.mu,modelSaumon.sigma);
   


    Res =probBar >= probSaumon;
    
end

