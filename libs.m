clc
close all
clear
addpath('/Users/vishaldholariya/Downloads/2020subjects/AdvancedMachineLearning/Assignment3/libsvm-3.11/matlab');
[label_vector, instance_matrix] = libsvmread('Abalone.txt');
%instance_matrix = normalize(instance_matrix, 1);
num_sample = length(label_vector);
subplot(1,1,1);
scatter(instance_matrix(:,2),label_vector,'m+');
xlabel = ('Inst Matrix');
ylabel = ('ft');
ptr= 0.7;
ptl=0.7;
traind = instance_matrix(1: round(num_sample*ptr), :);
trainl= label_vector(1: round(num_sample*ptl));
testd = instance_matrix(round(num_sample*ptr)+1:num_sample,:);
testl = label_vector(round(num_sample*ptl)+1:num_sample);

Lr = LinearModel.fit(traind,trainl);
yp = predict(Lr, testd);

Lsqd = (yp - repmat(testl, [1,7])).^2;
Lsqd = sum(Lsqd,1)/length(testl);

disp('Mean sqr err = ');
disp(Lsqd(1));

%[label_vector, instance_matrix] = libsvmread('/Users/vishaldholariya/downloads/2020subjects/AdvancedMachineLearning/Assignment3/Abalone.txt');

