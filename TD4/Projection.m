function [ proj ] = Projection( W,Echantillon)

%3D --->1D  et 2D --->1D  
W1=transpose(W(:,1));

%3D --->2D
%W1=transpose(W(:,1:2));

proj=transpose(W1*Echantillon');

end

