clc
clear
close all

addpath('/Users/vishaldholariya/Downloads/2020subjects/AdvancedMachineLearning/Assignment3/libsvm-3.11/matlab');
load('USPS_sub.mat');

% data normalization to make the length of each sample be 1
data = NormalizeFea(data, 1);

num_class = 10;
num_train = 15;
num_per_class = 100;

% make training and testing data and labels
[testIdx, trainIdx] = GenerateIdx(num_class, num_per_class, num_train);
train_label = label(trainIdx);
test_label = label(testIdx);
train_data = data(trainIdx, :);
test_data = data(testIdx, :);

% training SVM model and use 5-fold cross valiadation
% 0 -- linear: u'*v
% 1 -- polynomial: (gamma*u'*v + coef0)^degree
% 2 -- radial basis function: exp(-gamma*|u-v|^2)
% see https://www.csie.ntu.edu.tw/~cjlin/libsvm/

% generate a few values for c and gamma
c_arr = [0.01 0.1 1 10 100];
g_arr = [0.01 0.1 1 10 100];
grid_size = length(c_arr);

% in cross-validation we may try different gamma and c for RBF kernel
% -v 5 means 5 fold
% -t 2 means RBF kernel
for i = 1: grid_size
    for ii = 1: grid_size
        cv_acc(i,ii) = svmtrain(train_label, train_data, ['-t 2 -c ', num2str(c_arr(i)), ' -g ', num2str(g_arr(ii)),' -v 5']);
    end
end
max_acc = max(cv_acc(:));

% find the best c and gamma
[row, col] = find(cv_acc==max_acc);
best_c = c_arr(row);
best_g = g_arr(col);

% use the best model parameters to retrain on the training dataset
model = svmtrain(train_label, train_data, ['-t 2 -c ', num2str(best_c), ' -g ', num2str(best_g)]);
% testing
[predict_label, accuracy, dec_values] = svmpredict(test_label, test_data, model);