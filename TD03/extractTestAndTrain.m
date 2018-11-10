function [ TrainSaumon,TestSaumon,TrainBar, TestBar] = extractTestAndTrain(VTSaumon, VTBar, sizeTrain)

sizeVTSaumon=size(VTSaumon,1);
sizeVTBar=size(VTBar,1);

TrainSaumonIndice = randperm(sizeVTSaumon, sizeTrain);
TrainBarIndice = randperm(sizeVTBar,sizeTrain);

TrainSaumon = VTSaumon(TrainSaumonIndice,:);
TrainBar = VTBar(TrainBarIndice,:);

TestBar = VTBar;
TestSaumon = VTSaumon;
    
end