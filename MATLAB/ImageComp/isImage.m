function [ OZ ] = isImage( pic1, pic2 )
%Way to tell if same image(1) or not(0)pic1, pic2
%   Detailed explanation goes here

if threshold(pic1}, pic2) == 0);
    OZ = 1;
else
    OZ = 0;


end

