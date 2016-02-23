
%%
%get images from a file
file = dir('Linear2');
NF = length('Linear2');
images = cell(19,1);
for j = 1:19
        images{j} = imread(strcat(strcat('picsLine',num2str(j)) ,'.png'));
end





%% 
%this will be a test of the first images 1 2 3 4 6 7 8 9 compared with
%image 5 which should be closest to either 4 or 6 
testimages = cell(9,1);
for j =1:9
    testimages{j} = images{j};
end
testimages{5} = testimages{1};

ClosestMatch = picComp(images{5}, testimages);

%%
%this gives a cell with the number of point matches compared to the image

a = cell(19,1);
for j =1:19
    
     a{j} = SiftComp(images{5}, images{j});
    
end


