clc;
clear;
I=imread('2.jpg');             %读取图像
K1=medfilt2(I(:,:,2),[10 10]);          %中值滤波
h1=ones(5,5)/25;
K2=imfilter(K1,h1);       %均值滤波
figure, imshow(K1), title('滤波后的图像')