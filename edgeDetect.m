function [ e ] = edgeDetect( Img, showImg  )

if nargin<2
   showImg = 0;
end

I=rgb2gray(Img);               % ת��Ϊ��ɫͼ��
if showImg
    imshow(I);title('ԭͼ')
end
e = edge(I,'canny');  % ����canny����
if showImg
    figure,imshow(e);     % ��ʾ�ָ���ͼ�񣬼��ݶ�ͼ��
    title('matlab canny');
end
end

