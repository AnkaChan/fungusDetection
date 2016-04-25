showImg = 0;
saveEdge = 1;

Files = dir(fullfile('.\fig\','*.jpg'));
Files = [Files ; dir(fullfile('.\fig\','*.tif'))];
LengthFiles = length(Files);
for i = 1:LengthFiles;
    Img = imread(strcat('.\fig\',Files(i).name));
    edge = edgeDetect(Img,showImg);
    if saveEdge
        imwrite(edge, strcat('.\fig\edge\', Files(i).name), 'jpg');
    end
end