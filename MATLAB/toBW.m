function y = toBW( a )
%Function to make an image Binary
%a = imresize(a, .08);
a = rgb2gray(a);
a = im2bw(a, 0.4);
%imshow(a);


y = a;
end

