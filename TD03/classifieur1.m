load('VTSaumonBar.mat')
nbIter = 100;
sizeTrain = 100;

ErreurSaumon=ones(1,100);
ErreurBar=zeros(1,100);

sizeVTBar=size(VTBar,1);
sizeVTSaumon=size(VTSaumon,1);

pBar=sizeVTBar/(sizeVTBar+sizeVTSaumon);
pSaumon=sizeVTSaumon/(sizeVTBar+sizeVTSaumon);

cout=[0 1;2 0];

for i=1:nbIter

[ TrainSaumon,TestSaumon,TrainBar, TestBar] = extractTestAndTrain(VTSaumon, VTBar, sizeTrain);



[modelBar]=TrainModel(TrainBar);
[modelSaumon]=TrainModel(TrainSaumon);



%ResBar = MyclassifyMAP(TestBar,modelBar,modelSaumon,pBar,pSaumon);
%ResSaumon = MyclassifyMAP(TestSaumon,modelBar,modelSaumon,pBar,pSaumon);

ResBar = MyclassifyBayes(TestBar,modelBar,modelSaumon,pBar,pSaumon,cout);
ResSaumon = MyclassifyBayes(TestSaumon,modelBar,modelSaumon,pBar,pSaumon,cout);

[SaumonError, BarError ] = ComputeError(ResSaumon, ResBar);

ErreurSaumon(i)= SaumonError*100;
ErreurBar(i)=BarError*100;


end;

ErreurSaumonT=sum(ErreurSaumon)/100
ErreurBarT=sum(ErreurBar)/100
 MyclassifyBayes(TestSaumon,modelBar,modelSaumon,pBar,pSaumon,cout);

[SaumonError, BarError ] = ComputeError(ResSaumon, ResBar);

ErreurSaumon(i)= SaumonError*100;
ErreurBar(i)=BarError*100;






figure(2);
plot(1:nbIter, ErreurBar, 'g')
hold on
plot(1:nbIter, ErreurSaumon)

