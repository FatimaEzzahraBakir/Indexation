function [ CNError, ADError] = computeError( ResCN,ResAD)


    nbADError    = size(ResAD,1) - sum(ResAD);
    ADError = nbADError / size(ResAD,1);
    
    nbCNError = sum(ResCN) ;
    CNError = nbCNError / size(ResCN,1);
   

end

