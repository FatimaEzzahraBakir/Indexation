function [ TrainSaumon,TestSaumon,TrainBar, TestBar] = extractTestAndTrain(VTSaumon, VTBar, sizeTrain)

    sizeVTSaumon = size(VTSaumon,1);  % VTSAumon est une colonne .. 
    sizeVTBar = size(VTBar, 1);
    
    TrainSaumonIndice = randperm(sizeVTSaumon,sizeTrain);
    TrainBarIndice     = randperm(sizeVTBar,sizeTrain);
    
    TrainBar     = VTBar(TrainBarIndice,:);
    TrainSaumon  = VTSaumon(TrainSaumonIndice,:);
    
    
    TestBar=VTBar;
    TestSaumon=VTSaumon;
        

 
end
