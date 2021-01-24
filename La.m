clc
clear
close all;
addpath('/Users/vishaldholariya/Downloads/2020subjects/AdvancedMachineLearning/Assignment3/libsvm-3.11/matlab');
%[label_vector, instance_matrix] = libsvmread('Abalone.txt');
load('Abalone.mat');
%instance_matrix = normalize(instance_matrix, 1);

num_sample = length(label_vector);


scatter(instance_matrix(:,2),label_vector,'c+');
ptr= 0.7;
ptl=0.7;
traind = instance_matrix(1: round(num_sample*ptr), :);
traind = full(traind);
trainl= label_vector(1: round(num_sample*ptl));
testd = instance_matrix(round(num_sample*ptr)+1:num_sample,:);
testd = full(testd);
testl = label_vector(round(num_sample*ptl)+1:num_sample);

L = [0.0001,0.001,0.1,1,10];
bl= lasso(traind,trainl,'Lambda',L);

bar(bl)
for a = 1: length(L)
    bl_a = lasso(traind,trainl,'Lambda',L(a));
    figure;
    bar(bl_a)
    xlabel('TrainD')
    ylabel('TraL')
    title(['Lambda can be = ', num2str(L(a))])
    saveas(gcf,['Lambda',num2str(L(a)),'.jpg'])
end

Lasso_regression_result = testd * bl;
Lasso_sqr_diff = (Lasso_regression_result - repmat(testl,[1,length(L)])).^2;
Lasso_sqr_diff = sum(Lasso_sqr_diff,1)/length(testl);

disp('Mean sqr err = ');
disp(min(Lasso_sqr_diff));
disp('Lambda = ');
disp(L(3));

    
    
    

