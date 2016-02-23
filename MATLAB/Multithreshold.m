function compare = Multithreshold(imagex, imgArrayx) 
%Function to compare images

xx= size(imgArrayx);
compare = cell(xx);
for n = 1:size(imgArrayx)%how to get size of matrix?
    
    compare{n} = threshold(imagex, imgArrayx{n});
   
    
    
end




