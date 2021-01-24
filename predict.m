function [p, F1] = predict(theta, X, y)
m = size(X, 1);
p = zeros(m, 1);

p = round(sigmoid(X * theta));

predictions = (p >= 0.5);
tp = sum(predictions == 1 & y == 1);
fp = sum(predictions == 1 & y == 0);
fn = sum(predictions == 0 & y == 1);

prec = tp / (tp + fp);
rec = tp / (tp + fn);

F1 = (2 * prec * rec) / (prec + rec);

[X, Y] = perfcurve(y, p, 1);
figure; hold on;
plot(X,Y);
xlabel('FPR');
ylabel('TPR');
title('ROC CURVE');

end
