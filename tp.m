function [rec] = truePositive(theta,X, y)
p = round(sigmoid(X * theta));

predictions = (p >= 0.5);
tp = sum(predictions == 1 & y == 1);
fn = sum(predictions == 0 & y == 1);

rec = tp / (tp + fn);
end

