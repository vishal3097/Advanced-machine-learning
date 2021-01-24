img = double(rgb2gray(imread('flower.bmp')));
[U,S,V] = svd(img);
Vprime = V';
plot(1,5,1)
imshow(uint8(img))
title("Original Image")
plot(1,5,2)
reconstruct_image = imshow(uint8(U * S * v'));
title("Reconstructed Image")
plot(1,5,3)
K10 = imshow(uint8(U(:,1:10)* S(1:10,1:10) * V'(1:10,:)));
title("When k = 10")
plot(1,5,4)
K50 = imshow(uint8(U(:,1:50)* S(1:50,1:50) * V'(1:50,:)));
title("When k = 50")
plot(1,5,5)
K100 = imshow(uint8(U(:,1:100)* S(1:100,1:100) *
V'(1:100,:)));
title("When k = 100")