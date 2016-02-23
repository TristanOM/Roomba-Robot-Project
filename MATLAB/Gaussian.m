function [x] = Gaussian(A, b)
N = max(size(A));
for j = 2:N,
    for i = j:N,
        m = A(i,j-1)/A(j-1,j-1);
        A(i,:) = A(i,:) - A(j-1,:)*m;
        b(i) = b(i) - m*b(j-1);
    end
end

x= zeros(N,1);
x(N) = b(N)/A(N,N);

for j =N-1:-1:1,
    x(j) = (b(j)-A(j,j+1:N)*x(j+1:N))/A(j,j);
end
imfinfo(a)
a
imshow(a)
RGB = imread('frog-1.jpg');
imshow(RGB)
I = rgb2gray(RGB);
figure
imshow(I)
load frog-1.jpg
BW = im2bw(RGB,0.4);
imshow(RGB,map), figure, imshow(BW)
Undefined function or variable 'map'.
 
imshow(RGB), figure, imshow(BW)
