function  Res  = Myclassify(test,modelBar,modelSaumon)
   
probBar=normpdf(test,modelBar.mu,modelBar.sigma);
probSaumon=normpdf(test,modelSaumon.mu,modelSaumon.sigma);
   
    
    Res =probBar >= probSaumon;
    
end

);
probSaumon=mvnpdf(test,modelSaumon.mu,modelSaumon.sigma);  

    Res =probBar >= probSaumon;
    
end

