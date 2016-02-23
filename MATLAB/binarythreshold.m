function binaryComp = binarythreshold(imgArrayx) 
%Function to get binary threshold from a matrix of compared images


binaryComp = cell(size(imgArrayx));

for n = 1:9
    %how to get size of matrix?
    if imgArrayx(n)<.5
    binaryComp{n} = 1;
    else
        binaryComp(n)=0;
    end
   
    
    
end

