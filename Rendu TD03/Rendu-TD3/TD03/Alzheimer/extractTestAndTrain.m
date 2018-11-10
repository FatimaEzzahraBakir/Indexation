function [ TrainCN,TestCN,TrainAD, TestAD ] = extractTestAndTrain( VTCN, VTAD, sizeTrain )


    sizeVTCN = size(VTCN,1); 
    sizeVTAD = size(VTAD, 1);
    
    TrainCNIndice = randperm(sizeVTCN,sizeTrain);
    TrainADIndice     = randperm(sizeVTAD,sizeTrain);
    
    TrainAD     = VTAD(TrainADIndice,:);
    TrainCN = VTCN(TrainCNIndice,:);
    
    
    TestAD=VTAD;   %    TestAD=VTAD(:,1);  Pour l'age seul / TestAD=VTAD(:,2); pour le volume seul
    TestCN=VTCN;
        


end

