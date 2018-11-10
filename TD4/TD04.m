
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%load('VTSaumonBar2.mat')
load('VTSaumonBar3.mat')

nbIter = 20;
sizeTrain = 20;

ErreurSaumon=ones(1,20);
ErreurBar=zeros(1,20);

sizeVTBar=size(VTBar,1);
sizeVTSaumon=size(VTSaumon,1);


%visualisation des echantillons avant Projection 2D --> 1D:

%figure(1);
%scatter(VTBar(:, 1),VTBar(:,2),'blue');
%hold on;
%scatter(VTSaumon(:, 1), VTSaumon(:,2),'r');
%hold off;

%visualisation des echantillons avant Projection 3D --> 1D:

figure(1)
scatter3(VTBar(:, 1),VTBar(:,2),VTBar(:,3),'blue');
hold on
scatter3(VTSaumon(:, 1), VTSaumon(:,2),VTSaumon(:,3),'r');
hold off

%ACP 

%VBar=CalculACP(VTBar);
%VSaumon=CalculACP(VTSaumon);
%projBar=Projection(VBar,VTBar);
%projSaumon=Projection(VSaumon,VTSaumon);

%visualisation des echantillons aprés la réduction 



%ACI 2D --> 1D:
VACI=CalculACI(VTBar,VTSaumon);
%VSaumon=CalculACI(VTSaumon);
projBar=Projection(VACI,VTBar);
projSaumon=Projection(VACI,VTSaumon);

figure(2)
hold on
axis equal
plot(projSaumon,'-o');
plot(projBar,'-o');
hold off

for i=1:nbIter

%[ TrainSaumon,TestSaumon,TrainBar, TestBar] = extractTestAndTrain(VTSaumon, VTBar, sizeTrain);

[ TrainSaumon,TestSaumon,TrainBar, TestBar] = extractTestAndTrain(projSaumon, projBar, sizeTrain);


[modelBar]=TrainModel(TrainBar);
[modelSaumon]=TrainModel(TrainSaumon);



ResBar = Myclassify(TestBar,modelBar,modelSaumon);
ResSaumon = Myclassify(TestSaumon,modelBar,modelSaumon);


[SaumonError, BarError ] = ComputeError(ResSaumon, ResBar);


ErreurSaumon(i)= SaumonError*100;
ErreurBar(i)=BarError*100;


end;

ErreurSaumonT=sum(ErreurSaumon)/100
ErreurBarT=sum(ErreurBar)/100


figure(4);
plot(1:nbIter, ErreurBar,'g')
hold on
plot(1:nbIter, ErreurSaumon)
