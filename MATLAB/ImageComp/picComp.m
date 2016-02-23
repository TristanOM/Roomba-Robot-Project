function [ Index ] = picComp( pic1, PicCell )
%Compares a picture to a cell of pictures... somehow
%   Return the closest match as the index
Index = 1;
Comp = 0;
for i =1: length(PicCell)
    [A,B] = SiftComp(pic1, PicCell{i});
    
    %some function for the point match maybe?
    if(Comp < A)
        Index = i;
        Comp = A;
    end
end
    

