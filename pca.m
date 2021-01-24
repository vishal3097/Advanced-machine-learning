function [U, S] = pca(X)
[m, n] = size(X);

U = zeros(n);
S = zeros(n);

covariance = (X' * X) / m;
[U,S,V] = svd(covariance);
end
