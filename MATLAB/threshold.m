function thres = threshold(a, b) 
%Function to compare images

if std2(a)>1 || std2(b) > 1
a = toBW(a);
b = toBW(b);
thres = mean(sqrt((a(:) - b(:)).^2));
else
   thres = mean(sqrt((a(:) - b(:)).^2)); 
end


