function [ matches, PointCompB ] = SiftComp( pic1, pic2 )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

im1 = pic1;
 im2 = pic2;
 
%%figure(fshowA); figure(fshowH);
[pts1, pts2] = SIFTmatch( im1, im2, 0, false );


%Checks the diff in point based on x, y and average
PointCompB = mean(sqrt((pts1(:) - pts2(:)).^2)); 
PointCompx = mean(sqrt((pts1(:,1) - pts2(:,1)).^2)); 
PointCompy = mean(sqrt((pts1(:,2) - pts2(:,2)).^2)); 

%checks number of point matches 
matches = size(pts1,1);

end

%[ ]

