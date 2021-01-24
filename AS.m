image = double(rgb2gray(imread('flower.bmp')));
[U,S,V]=svd(image);
for number=200
S(200:end,:)=0;
S(:,200:end)=0;
perfect_image=U*S*V';
figure;
Output = sprintf('Output of image using %d singular values',number)
imshow(uint8(perfect_image));
title(Output);
end
