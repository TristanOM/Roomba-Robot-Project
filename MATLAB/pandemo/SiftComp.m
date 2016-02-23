%This function uses the SIFTmatch function to return the number of matches
%that two images make as well as the average difference between matching
%points.
function [ matches, PointComp ] = SiftComp( pic1, pic2 )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

im1 = pic1;
 im2 = pic2;
 
%This is the method to get the 
[pts1, pts2] = SIFTmatch( im1, im2, 0, false );


%Checks the difference in matching points based on x, y and average
%The number of matches was used instead of this since it was more
%accurate.
PointComp = mean(sqrt((pts1(:) - pts2(:)).^2)); 
%PointCompx = mean(sqrt((pts1(:,1) - pts2(:,1)).^2)); 
%PointCompy = mean(sqrt((pts1(:,2) - pts2(:,2)).^2)); 

%checks number of point matches. A higher number mean more matches.
%Usually ranges from 100 to 200. 200 is a very close match while 260
%matches indicates that it is the exact same image.
matches = size(pts1,1);

end

%[ ]

