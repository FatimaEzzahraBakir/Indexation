load('VTAlzheimer2(1).mat')

nbIter = 50;
sizeTrain = 50;
sizeVT = 183;

errorAD = zeros(nbIter,1);
errorCN = zeros(nbIter, 1);




for i=1:nbIter

    
    [TrainCN,TestCN,TrainAD, TestAD] = extractTestAndTrain(VTCN, VTAD, sizeTrain);

    [modelCN] = TrainModel(TrainCN);
    [modelAD] = TrainModel(TrainAD);
    
          ResAD = MyclassifyML(TestAD,modelAD,modelCN);
          ResCN = MyclassifyML(TestCN,modelAD, modelCN);

          [CNError, ADError] = computeError(ResCN, ResAD);

          errorCN(i)= CNError*100
                                       % on multiple chaque itération par 100 pour avoir des erreurs pourcentage
         errorAD(i)= ADError*100
          
  
end

% Question 3 : L'affichage des erreurs en fonction des itération
figure(2)
plot(1:nbIter,errorCN)
hold on
plot(1:nbIter,errorAD)


%Question 3 : calcule de la moyenne
MoyenneErreurAD=sum(errorAD)/nbIter     
MoyenneErreurCN=sum(errorCN)/nbIter
