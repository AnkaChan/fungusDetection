clc;
clear;
I=imread('2.jpg');             %��ȡͼ��
K1=medfilt2(I(:,:,2),[10 10]);          %��ֵ�˲�
h1=ones(5,5)/25;
K2=imfilter(K1,h1);       %��ֵ�˲�
figure, imshow(K1), title('�˲����ͼ��')