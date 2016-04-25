function [ e ] = edgeDetect( Img, showImg  )

if nargin<2
   showImg = 0;
end

I=rgb2gray(Img);               % 转化为灰色图像
if showImg
    imshow(I);title('原图')
end
e = edge(I,'canny');  % 调用canny函数
if showImg
    figure,imshow(e);     % 显示分割后的图像，即梯度图像
    title('matlab canny');
end
end

