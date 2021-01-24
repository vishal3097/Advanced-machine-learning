image = double(rgb2gray(imread('flower.bmp')));
[U,S,V] = svd(image);
EigenColumnVector = diag(S);
FirstTenEigenValues = EigenColumnVector(1:10);
x = linspace(1,10,10);
disp(FirstTenEigenValues);
plot(x,FirstTenEigenValues)
figure;
plot(EigenColumnVector)