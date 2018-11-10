function  Res  = MyclassifyMAP(test,modelBar,modelSaumon,pBar,pSaumon);


%ICI le MAP: on ajoute dans les arguments pBAr et pSaumon

        probBar= normpdf(test,modelBar.mu,modelBar.sigma)*pBar;
        probSaumon= normpdf(test,modelSaumon.mu,modelSaumon.sigma )*pSaumon;
        Res = probBar >= probSaumon;      % Le resultat = 1 si BAr > SAumon ou  0 si BAr< SAumon 

   
    
end