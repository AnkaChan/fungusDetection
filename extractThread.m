function [ ne ] = extractThread( e )
s = size(e);
m = s(1);
n = s(2);    
ne = zeros(m,n);
%r = 4;
h = fspecial('average', 20);
filtered = imfilter(double(e), h, 255);

for i = 1:m
    for j = 1:n
        if filtered(i,j) < 0.18 && filtered(i,j) > 0.1 && e(i,j) 
            ne(i,j) = 255;
        end
    end
end


end

