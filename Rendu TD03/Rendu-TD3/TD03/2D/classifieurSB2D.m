load('VTSaumonBar2.mat')

nbIter = 100;
sizeTrain = 100;


errorBar = zeros(nbIter,1);
errorSaumon = zeros(nbIter, 1);


errorBarRisque = zeros(nbIter,1);
errorSaumonRisque = zeros(nbIter, 1);

sizeVTSaumon = 1000;
sizeVTBar = 500;

%Exercie 3 question 1
pBar=sizeVTBar/(sizeVTBar+sizeVTSaumon);
pSaumon=sizeVTSaumon/(sizeVTBar+sizeVTSaumon);


mcout = [0 2; 1 0];


for i=1:nbIter

    
    [TrainSaumon,TestSaumon,TrainBar, TestBar] = extractTestAndTrain(VTSaumon, VTBar, sizeTrain);

    [modelSaumon] = TrainModel(TrainSaumon);
    [modelBar] = TrainModel(TrainBar);
    
    
    
            %*************************************************************************
    
    % ML:
    
          ResBar = MyclassifyML(TestBar,modelBar,modelSaumon);
          ResSaumon = MyclassifyML(TestSaumon,modelBar, modelSaumon);

          [SaumonError, BarError] = ComputeError(ResSaumon, ResBar);

          errorSaumon(i) = SaumonError*100  
                                       % on multiple chaque itération par 100 pour avoir des erreurs entre
                                       % 0 et 100 càd pourcentage
         errorBar(i) = BarError*100
          
        
     

        %*************************************************************************

   % MAP:

           %ResBar = MyclassifyMAP(TestBar,modelBar,modelSaumon,pBar,pSaumon);
          % ResSaumon = MyclassifyMAP(TestSaumon,modelBar, modelSaumon,pBar,pSaumon);

          % [SaumonError, BarError] = ComputeError(ResSaumon, ResBar);

           %errorSaumon(i) = SaumonError*100
          % errorBar(i) = BarError*100
       
      
      
        %*************************************************************************
        
   %  On ajoute le coût:
   
          
         %ResBar    =    MyclassifyCout(TestBar,modelBar, modelSaumon, pBar, pSaumon, mcout);
        % ResSaumon =    MyclassifyCout(TestSaumon,modelBar, modelSaumon, pBar, pSaumon, mcout);
        
        % [SaumonError, BarError] = ComputeError(ResSaumon, ResBar);
        
         %errorSaumonRisque(i) = SaumonError*100;
        % errorBarRisque(i) = BarError*100;
  

      
   
end

% Question 3 : L'affichage des erreurs en fonction des itération
figure(1)
plot(1:nbIter,errorSaumon)
hold on
plot(1:nbIter,errorBar)

%Question 3 : calcule de la moyenne
MoyenneErreurBar=sum(errorBar)/nbIter      
MoyenneErreurSaumon=sum(errorSaumon)/nbIter


% calcule de la moyenne MAP:
%MoyenneErreurBar=sum(errorBar)/nbIter       
%MoyenneErreurSaumon=sum(errorSaumon)/nbIter

%Affichage MAP:
%figure(2)
%plot(1:nbIter, errorSaumon)
%hold on
%plot(1:nbIter,errorBar)


