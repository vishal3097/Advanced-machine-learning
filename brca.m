clear ; 
clc
close all; 

load('BreastCancer.mat');
num_sample = length(label_vector);
testd = full(instance_matrix (1: floor(num_sample*0.7), 1:10));
testl = label_vector (1: floor(num_sample*0.7));
testl = (testl == 4);

Xtest = testd; ytest = testl;

fprintf('Test set loaded...\n');


load('BreastCancer.mat');
num_sample = length(label_vector);
traind = full(instance_matrix (1: floor(num_sample*0.7), 1:10));
trainl = label_vector (1: floor(num_sample*0.7));
trainl= (trainl == 4);

X = traind; y = trainl;

fprintf('Training data loaded...');



[Xtest, mu, sigma] = normalize(Xtest);

[X_norm, mu, sigma] = normalize(X);

[U, S] = pca(X_norm);

%  Project the data onto K = 2 dimension
K = 2;
Z = projectData(X_norm, U, K);

%  Plot the normalized dataset (returned from pca)

plotData(Z, y);
xlabel('Feature projection - 1');
ylabel('Feature projection - 2');
legend('Malign', 'Benign');
title('Breast cancer ');

X = X_norm;
[m, n] = size(X);

X = [ones(m, 1) X];
initial_theta = zeros(n + 1, 1);
[cost, grad] = costFunction(initial_theta, X, y);

fprintf('\nCost at initial theta (zeros): %f\n', cost);
fprintf('Gradient at initial theta (zeros): \n');
fprintf(' %f \n', grad);

options = optimset('GradObj', 'on', 'MaxIter', 400);

[theta, cost] = fminunc(@(t)(costFunction(t, X, y)), initial_theta, options);

fprintf('\nCost at theta found by fminunc: %f\n', cost);
fprintf('theta: \n');
fprintf(' %f \n', theta);

% Plot Boundary
plotDecisionBoundary(theta, Z, y);

hold on;
xlabel('Feature projection - 1');
ylabel('Feature projection - 2');
title('Breast cancer - cell malignancy hypothesis');
hold off;


[p, F1] = predict(theta, X, y);
fprintf('\nTrain Accuracy: %f\nF1 score: %f\n', mean(double(p == y)) * 100, F1);

[mtest, ntest] = size(Xtest);
Xtest = [ones(mtest, 1) Xtest];

[ptest, F1test] = predict(theta, Xtest, ytest);
fprintf('Test Accuracy: %f\nF1 score: %f\n', mean(double(ptest == ytest)) * 100, F1test);


truepos = zeros(size(theta, 1), 1);
falseneg = zeros(size(theta, 1), 1);
for idx = 1:numel(theta)
    element = theta(idx);
    falseneg(idx) = falsePositive(theta, Xtest, ytest);
    truepos(idx) = truePositive(theta, Xtest, ytest);

end
