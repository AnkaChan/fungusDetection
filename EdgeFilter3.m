I = imread('.\fig\Image0204_.tif');  % ����ͼ��
I=rgb2gray(I);               % ת��Ϊ��ɫͼ��
imshow(I);title('ԭͼ')
BW1 = edge(I,'canny');  % ����canny����
figure,imshow(BW1);     % ��ʾ�ָ���ͼ�񣬼��ݶ�ͼ��
title('matlab canny')