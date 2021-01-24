image = double(rgb2gray(imread('flower.bmp')));
a = sqrt(2)/2;
C = [a -a*0.5; a a*0.5];
transformed = flipud(imtransform(flipud(image), tform, 'FillValues',255));
imshow(image)
figure
imshow(uint8(transformed))