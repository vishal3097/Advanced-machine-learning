A =imread('flower.bmp');
A =rgb2gray(A);
imshow(A);
D=double(A);
[U,S,V]=svd(D);
Z = [];
W = [];
for N=10
C = S;
C(N+1:end,:)=0;
C(:,N+1:end)=0;
X=U*C*V';
figure;
buffer = sprintf('Image output using %d singular values', N)
imshow(uint8(X));
title(buffer);
error=sum(sum((inImageX-X).^2));
Z = [Z; error];
W = [W; N];
end


%%%%%%%%%%%% Your code here %%%%%%%%%%%%%%
%T = [1 0;0 1];

%%%%%%%%%%%% end of your code %%%%%%%%%%%%%%

%The code below applies the transformation to every pixel in the image, and 
%displays both images. This code takes care of some MATLAB-specific things 
%that have low educational value, and you don't need to understand it.

%adds the translation part to get a complete affine transformation matrix
%TWithTranslation = [T [0;0];0 0 1];

%MATLAB affine-transform convention is the transpose of ours, so we feed it
%the transpose of the transformation matrix
%tform = maketform('projective',TWithTranslation');
%Images are drawn with the +y axis pointing down. So flip the image before
%and after the transformation to simulate normal Cartesian coordinates
%transformed = flipud(imtransform(flipud(img), tform, 'FillValues',255));
%imshow(img)
%figure
%imshow(uint8(transformed))