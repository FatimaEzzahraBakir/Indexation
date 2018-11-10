
mu1 = [0 0];
sigma1 = [1 1.5 ; 1.5 3];
X1 = mvnrnd(mu1,sigma1,200); 



mu2 = [1 1];
sigma2 = [2 3 ; 3 6];
X2 = mvnrnd(mu2,sigma2,200); 

nbIter = 150;
sizeTrain = 150;

ErreurX2=ones(1,150);
ErreurX1=zeros(1,150);

sizeX1=size(X1,1);
sizeX2=size(X2,1);


figure(1);
axis equal;
hold on;
scatter(X1(:,1), X1(:,2));
scatter(X2(:,1), X2(:,2));
hold off;

VX1=CalculACP(X1);
VX2=CalculACP(X2);
projX1=Projection(VX1,X1);
projX2=Projection(VX2,X2);

%visualisation des echantillons aprés la réduction 

figure(2)
hold on
axis equal
plot(projX2,'-');
plot(projX1,'-o');
hold off

for i=1:nbIter

%[ TrainX2,TestX2,TrainX1, TestX1] = extractTestAndTrain(X2, X1, sizeTrain);

[ TrainX2,TestX2,TrainX1, TestX1] = extractTestAndTrain(projX2,projX1, sizeTrain);


[modelX1]=TrainModel(TrainX1);
[modelX2]=TrainModel(TrainX2);



ResX1 = Myclassify(TestX1,modelX1,modelX2);
ResX2 = Myclassify(TestX2,modelX1,modelX2);


[X2Error, X1Error ] = ComputeError(ResX2, ResX1);


ErreurX1(i)= X1Error*100;
ErreurX2(i)=X2Error*100;


end;

ErreurX1=sum(ErreurX1)/100
ErreurX2=sum(ErreurX2)/100


figure(4);
plot(1:nbIter, ErreurX1, 'g')
hold on
plot(1:nbIter, ErreurX2)
