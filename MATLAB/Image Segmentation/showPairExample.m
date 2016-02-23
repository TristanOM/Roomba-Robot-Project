%%
%imshow creates a visualization of the differences between two images
A = imread('Toys_Candy.jpg');
B = imrotate(A,5,'bicubic','crop');
imshowpair(A, B,'diff');

%%
%imfuse method creates a composite file of two images
C = imread('Toys_Candy.jpg');
D = imrotate(A,5,'bicubic','crop');
E = imfuse(C, D, 'blend','Scaling', 'joint');
%Save as png and view
imwrite(E,'blendOverlay.png');
imshow(E);