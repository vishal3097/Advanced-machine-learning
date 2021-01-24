image = double(rgb2gray(imread('flower.bmp'));
[U,S,V]= svd(image);
EigVector = diag(S);
 Eigenvalues = Eigcolumnvector(1*10);
 plot(EigVector)