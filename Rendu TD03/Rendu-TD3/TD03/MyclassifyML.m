function  Res  = MyclassifyML(test,modelBar,modelSaumon);


% ICI ON A FAIT ML:
    probBar= normpdf(test,modelBar.mu,modelBar.sigma);
    probSaumon= normpdf(test,modelSaumon.mu,modelSaumon.sigma );
  Res = probBar >= probSaumon;  % Le resultat = 1 si BAr > SAumon ou  0 si BAr< SAumon 


   
    
end