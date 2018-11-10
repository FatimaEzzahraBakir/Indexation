function  Res  = MyclassifyMAP(test,modelBar,modelSaumon,pBar,pSaumon);


%ICI le MAP: on ajoute dans les arguments pBAr et pSaumon

        probBar= mvnpdf(test,modelBar.mu,modelBar.sigma)*pBar;
        probSaumon= mvnpdf(test,modelSaumon.mu,modelSaumon.sigma )*pSaumon;
        Res = probBar >= probSaumon;     

   
    
end