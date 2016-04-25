clear all;
close all;
clc;

img=imread('3_grey.jpg');
%img = (img(:,:,1) + img(:,:,2) + img(:,:,3))/3;
imshow(img);
[m n]=size(img);
img=double(img);

%%canny��Ե����ǰ������Բ����ӣ������Ҿ�ֱ�ӵ���ϵͳ������
%%��˹�˲�
w=fspecial('gaussian',[5 5]);
img=imfilter(img,w,'replicate');
figure;
imshow(uint8(img))

%%sobel��Ե���
w=fspecial('sobel');
img_w=imfilter(img,w,'replicate');      %����Ե
w=w';
img_h=imfilter(img,w,'replicate');      %������Ե
img=sqrt(img_w.^2+img_h.^2);        %ע�����ﲻ�Ǽ򵥵���ƽ��������ƽ�����ڿ������������ó�һ��ʱ�䶼�����
figure;
imshow(uint8(img))

%%�����ǷǼ�������
new_edge=zeros(m,n);
for i=2:m-1
    for j=2:n-1
        Mx=img_w(i,j);
        My=img_h(i,j);
        
        if My~=0
            o=atan(Mx/My);      %��Ե�ķ��߻���
        elseif My==0 && Mx>0
            o=pi/2;
        else
            o=-pi/2;            
        end
        
        %Mx����My��img���в�ֵ
        adds=get_coords(o);      %��Ե���ط���һ����õ��������꣬��ֵ��Ҫ       
        M1=My*img(i+adds(2),j+adds(1))+(Mx-My)*img(i+adds(4),j+adds(3));   %��ֵ��õ������أ��ô����غ͵�ǰ���رȽ� 
        adds=get_coords(o+pi);   %��Ե������һ����õ��������꣬��ֵ��Ҫ
        M2=My*img(i+adds(2),j+adds(1))+(Mx-My)*img(i+adds(4),j+adds(3));   %��һ���ֵ�õ������أ�ͬ���͵�ǰ���رȽ�
        
        isbigger=(Mx*img(i,j)>M1)*(Mx*img(i,j)>=M2)+(Mx*img(i,j)<M1)*(Mx*img(i,j)<=M2); %�����ǰ������ߵ㶼����1
        
        if isbigger
           new_edge(i,j)=img(i,j); 
        end        
    end
end
figure;
imshow(uint8(new_edge))

%%�������ͺ���ֵ����
up=60;     %����ֵ
low = 40;    %����ֵ
set(0,'RecursionLimit',10000);  %�������ݹ����
for i=1:m
    for j=1:n
      if new_edge(i,j)>up &&new_edge(i,j)~=255  %�ж�����ֵ
            new_edge(i,j)=255;
            new_edge=connect_1(new_edge,i,j,low);
      end
    end
end
figure;
imshow(new_edge==255)