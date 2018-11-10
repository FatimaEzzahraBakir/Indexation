
function [model] = TrainModel (Train)

model.mu = mean(Train);
model.sigma = cov(Train);

end