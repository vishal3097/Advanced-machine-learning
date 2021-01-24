clear
close all
clc

% assume you've already learned the GMM model parameters.
mu_1 = [7, 0.3];
mu_2 = [1.5, 3];
mu_3 = [0.8, 1.2];

s_1 = [0.5, 0.1; 0.1, 0.5];
s_2 = [1.3, 0; 0, 1.9];
s_3 = [3, 2; 2, 3];

% Sample a few data from each
x_1 = mvnrnd(mu_1,s_1,100);
x_2 = mvnrnd(mu_2,s_2,100);
x_3 = mvnrnd(mu_3,s_3,100);

mu = [mu_1; mu_2; mu_3];
S = cat(3,s_1, s_2, s_3);
pi = [1/3, 1/3, 1/3];

% plot samples from each Gaussian
scatter(x_1(:,1), x_1(:,2), 'filled', 'MarkerEdgeColor',[1 0 0]);
hold on

scatter(x_2(:,1), x_2(:,2), 'filled', 'MarkerEdgeColor',[0 1 0]);
hold on

scatter(x_3(:,1), x_3(:,2), 'filled', 'MarkerEdgeColor',[0 0 1]);
hold on

% draw the level line
gm = gmdistribution(mu,S, pi);
gmPDF = @(x,y)reshape(pdf(gm,[x(:) y(:)]),size(x));
fcontour(gmPDF, [-5 10 -5 10]);

