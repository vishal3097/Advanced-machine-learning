function [frec] = falsePositive(theta, X, y)
p = round(sigmoid(X * theta));

predictions = (p >= 0.5);
fp = sum(predictions == 1 & y == 0);
tn = sum(predictions == 0 & y == 0);

frec = fp / (fp + tn);
end

