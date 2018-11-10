load('VTSaumonBar.mat')

nbIter = 100;
sizeTrain = 100;

errorBar= zeros(nbIter,1);
errorSaumon= zeros(nbIter, 1);


errorBarRisque = zeros(nbIter,1);
errorSaumonRisque = zeros(nbIter, 1);

sizeVTSaumon = 1000;
sizeVTBar = 500;

mcout = [0 2; 1 0];

%visualisation des échantillons 
%figure(2);
%plot(VTSaumon,'o');
%hold on
%plot(VTBar,'.g');


%Exercie 3 question 1
pBar=sizeVTBar/(sizeVTBar+sizeVTSaumon);
pSaumon=sizeVTSaumon/(sizeVTBar+sizeVTSaumon);

for i=1:nbIter

    
    [TrainSaumon,TestSaumon,TrainBar, TestBar] = extractTestAndTrain(VTSaumon, VTBar, sizeTrain);

    [modelSaumon] = TrainModel(TrainSaumon);
    [modelBar] = TrainModel(TrainBar);
    
    
            %*************************************************************************
    
    % ML:
    
          %ResBar = MyclassifyML(TestBar,modelBar,modelSaumon);
          %ResSaumon = MyclassifyML(TestSaumon,modelBar, modelSaumon);

          %[SaumonError, BarError] = ComputeError(ResSaumon, ResBar);

          %errorSaumon(i) = SaumonError*100  
                                       % on multiple chaque itération par 100 pour avoir pourcentage
          %errorBar(i) = BarError*100
          
        


        %*************************************************************************

   % MAP:

           %ResBar = MyclassifyMAP(TestBar,modelBar,modelSaumon,pBar,pSaumon);
           %ResSaumon = MyclassifyMAP(TestSaumon,modelBar, modelSaumon,pBar,pSaumon);

           %[SaumonError, BarError] = ComputeError(ResSaumon, ResBar);

           %errorSaumon(i) = SaumonError*100
           %errorBar(i) = BarError*100
       
      
      
        %*************************************************************************
        
   %  On ajoute le coût:
   
          
         ResBar    =    MyclassifyCout(TestBar,modelBar, modelSaumon, pBar, pSaumon, mcout);
         ResSaumon =    MyclassifyCout(TestSaumon,modelBar, modelSaumon, pBar, pSaumon, mcout);
        
         [SaumonError, BarError] = ComputeError(ResSaumon, ResBar);
        
         errorSaumonRisque(i) = SaumonError*100
         errorBarRisque(i) = BarError*100
  

      
   
end
% calcule de la moyenne ML:
%MoyenneErreurBar=sum(errorBar)/nbIter       
%MoyenneErreurSaumon=sum(errorSaumon)/nbIter

% Question 3 exercice 1 Affichage ML:
%figure(3)
%plot(1:nbIter,errorSaumon)
%hold on
%plot(1:nbIter,errorBar)


% calcule de la moyenne MAP:
%MoyenneErreurBar=sum(errorBar)/nbIter      
%MoyenneErreurSaumon=sum(errorSaumon)/nbIter

%Question 1 exercice 3  Affichage MAP:
%figure(4)
%plot(1:nbIter, errorSaumon)
%hold on
%plot(1:nbIter,errorBar)


% Question 2 exercice 3 : L'affichage des erreurs en fonction des itération
figure(5)
plot(1:nbIter,errorSaumonRisque)
hold on
plot(1:nbIter,errorBarRisque)


%Question 3 : calcule de la moyenne
MoyenneErreurBar=sum(errorBarRisque)/nbIter       
MoyenneErreurSaumon=sum(errorSaumonRisque)/nbIter
