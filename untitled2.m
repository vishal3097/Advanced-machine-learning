image = double(rgb2gray(imread('flower.bmp')));
image = double(rgb2gray(imread('flower.bmp')));
image = double(rgb2gray(imread('flower.bmp')));
[U,S,V]=svd(image);
for number1 = 10
S(10:end,:) = 0;
S(:,10:end) = 0;
perfect_image = U*S*V';
figure;
Output = sprintf('Output of image using %d singular values',number1)
imshow(uint8(perfect_image));
title(Output);
end
for number2 = 50
S1(50:end,:) = 0;
S1(:,50:end) = 0;
perfect_image1 = U*S1*V';
figure;
Output2 = sprintf('Output of image using %d singular values',number2)
imshow(uint8(perfect_image1));
title(Output2);
end
for number3 = 100
S2(100:end,:) = 0;
S2(:,100:end) = 0;
perfect_image2 = U*S2*V';
figure;
Output3 = sprintf('Output of image using %d singular values',number3)
imshow(uint8(perfect_image2));
title(Output3);
end
