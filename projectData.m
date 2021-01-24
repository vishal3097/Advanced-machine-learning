function Z = projectData(X, U, K)
Z = zeros(size(X, 1), K);
U_reduced = U(:, 1:K);
Z = X * U_reduced;

end
