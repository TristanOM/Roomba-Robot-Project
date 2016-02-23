function [ Index ] = thresComp( pic1, PicCell )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

Index = 1;
CheckIndex = 1;
Comp = {0,0};%should see if near values are also low
for i =1: length(PicCell)
    thres = threshold(pic1, PicCell{i});
    
    %some function for the point match maybe?
    if(Comp{1} < thres)
        CheckIndex = Index;
        Index = i;
        Comp{2} = Comp{1};
        Comp{1} = thres;
        
    end
end
CheckIndexA = CheckIndex - 1;
CheckIndexB = CheckIndex + 1;
if (CheckIndexA ~= Index && CheckIndexB ~= Index)
    Index = -1;
end
    


end

