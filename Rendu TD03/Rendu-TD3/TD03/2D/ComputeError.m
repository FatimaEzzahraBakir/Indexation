function [SaumonError, BarError ] = ComputeError(ResSaumon, ResBar)
    
    nbBarError    = size(ResBar,1) - sum(ResBar);
    BarError = nbBarError / size(ResBar,1);
    
    nbSaumonError = sum(ResSaumon) ;
    SaumonError = nbSaumonError / size(ResSaumon,1);
    
end
