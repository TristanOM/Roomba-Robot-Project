%%
im1 = imread('pics1.png');
 im2 = imread('pics2.png');
 
fshowA=figure;
set(fshowA, 'Visible', 'off');
subA1=subplot(2,2,1); imshow(im1);
subA2=subplot(2,2,2); imshow(im2);
movegui(fshowA, 'northwest');
%%
fshowH=figure;
set(fshowH, 'Visible', 'off');
subH1=subplot(2,2,1); imshow(im1);
subH2=subplot(2,2,2); imshow(im2);
movegui(fshowH, 'northeast');

%%
 figure(fshowA); figure(fshowH);
[pts1, pts2] = SIFTmatch( im1, im2, 0, false );

%%
imagesc(im1)
hold on
plot(pts1(:,1),pts1(:,2),'ro')
plot(pts1(:,1),pts2(:,2),'go')

%%
%plot lines
X = [pts1(:,1) pts2(:,1)];
Y = [pts1(:,2) pts2(:,2)];
line(X,Y, 'Color','r','LineWidth',4)
plot(line);

%%
%Checks the difference in point based on x, y and average
PointComp = mean(sqrt((pts1(:) - pts2(:)).^2)); 
PointCompx = mean(sqrt((pts1(:,1) - pts2(:,1)).^2)); 
PointCompy = mean(sqrt((pts1(:,2) - pts2(:,2)).^2)); 

%%
%checks number of point matches 
matches = size(pts1,1);

%%
%This gets the test images for the linear image testing
file = dir('Linear2');
NF = length('Linear2');
images = cell(19,1);
for j = 1:19
        images{j} = imread(strcat(strcat('picsLine',num2str(j)) ,'.png'));
end

%%
%This uses the SiftComp method to return the number of matches between
%images and the average differenc of the matches

G= cell(19,1);
TableA = cell(19,1);

for j =1:19
    for i = 1:19
     [A, B] = SiftComp(images{j},images{i});
     G{i}={A, B};
     
    end
    TableA{j} = G;
end
%%
%This compares the linear images using the threshold method.
%This proved to be less accurate than basing it on number of matches
Tres= cell(19,1);
TableB = cell(19,1);

for j =1:19
    for i = 1:19
       AV = threshold(images{j}, images{i});
  
     Tres{i}=AV;
     
    end
    TableB{j} = Tres;
end

%%
%View the result
for j =1:19
    for i = 1:19
        aaa = TableA{j}{i}{1};
        bbb = TableA{j}{i}{2} ;
        %need to changed this
        ab = TableB{j}{i};
fprintf('Image(%i) comp with  Image(%i) (%i matches) (%i Avg Diff) (%i Threshold)\n',j,i, aaa,bbb, ab);
    end
end

%% 
%This will be a test of the first images 1 2 3 4 6 7 8 9 compared with
%image 5 which should be closest to either 4 or 6 
testimages = cell(9,1);
for j =1:9
    testimages{j} = images{j};
end
testimages{8} = testimages{1};

ClosestMatch = picComp(images{8}, testimages);

%%
%this gives an idea of the matching points trend
a = cell(9,1);
for j =1:9
    
     a{j} = SiftComp(images{8}, testimages{j});
    
end

%%
% testing with plain ol threshold
%This proves to be less accurate.
b = cell(19,1);


for j =1:19
%b{j} = threshold(images{i}, images{j})*1000;
b{j} = thresComp(images{i}, images);
end



sum = 0;

