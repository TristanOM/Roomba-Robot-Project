%%
%Compare 2 images to get a threshold
A = imread('Desk1.jpg');
B = imread('Desk2.jpg');
%These images are huge so I resize them
C = imresize(A, .08);
D = imresize( B, .08);

Cdub = double(C);
Ddub = double(D);
ColorThreshold = mean(sqrt((Cdub(:) - Ddub(:)).^2))/255;

%Compare using a logical Array
%Comp = C == D;

%Convert to a double array
%Comp = double(Comp);

%Find the sum by summing together array 3x
%Comp = sum(Comp);
%Comp = sum(Comp);
%Comp = sum(Comp);

%Compare to original size of images
%Ans = Comp / numel(C);

%%
%Make images into Greyscale.
Ag = rgb2gray(C);
Bg = rgb2gray(D);

%make into doubles
Agdub = double(Ag);
Bgdub = double(Bg);

GreyThreshold = mean(sqrt((Agdub(:) - Bgdub(:)).^2))/255;


%%
%Make images into binary
Abw = im2bw(Ag, 0.4);
Bbw = im2bw(Bg, 0.4);

BinaryThreshold = mean(sqrt((Abw(:) - Bbw(:)).^2));

%BinaryComp = Abw == Bbw;
%BinaryComp = sum(BinaryComp);
%BinaryComp = sum(BinaryComp);
%BinaryAns = BinaryComp / numel(Abw);


%%
%Display all images,Binary GreyScale and regular

subplot(3,2,1), imshow(C)
subplot(3,2,2), imshow(D)
subplot(3,2,3), imshow(Ag )
subplot(3,2,4), imshow(Bg)
subplot(3,2,5), imshow(Abw)
subplot(3,2,6), imshow(Bbw)



%%
% hold images in a cell array and access with image{1} exc...



imgA = imread('pics1.png');
imgB = imread('pics2.png');
imgC = imread('pics3.png');
imgD = imread('pics4.png');
imgE = imread('pics5.png');
imgF = imread('pics6.png');
imgG = imread('pics7.png');

images = {imgA, imgB, imgC, imgD, imgE, imgD ,imgE, imgF, imgG};
imagesGrey = {rgb2gray(imgA),rgb2gray(imgB),rgb2gray(imgC),rgb2gray(imgD),rgb2gray(imgE),rgb2gray(imgF),rgb2gray(imgG)};
imagesEdge = {edge(imagesGrey{1},'sobel'),edge(imagesGrey{2},'sobel'),edge(imagesGrey{3},'sobel'),edge(imagesGrey{4},'sobel'),edge(imagesGrey{5},'sobel'),edge(imagesGrey{6},'sobel'), edge(imagesGrey{7},'sobel'),};
imgA = imresize(imgA, .08);


%ccc= {0,0,0,0,0,0,0};
ff = images{1};
ccc = Multithreshold(ff, images);
%%
%make a binary image array
binaryImages = {toBW(images{1}), toBW(images{2}), toBW(images{3}), toBW(images{4}), toBW(images{5}),toBW(images{6}),toBW(images{7})};

sumB = numel(binaryImages{1});
%sumB = sum(sumB);
%sumB = sum(sumB);
%%
%make a grey scale

%%
%take binary images and compare while whitened with another
Img = images{1};
ImgBW = toBW(images{1});
ImgEdge = edge(imagesGrey{1},'sobel');

imshow(Img);
compare = {0,0,0,0,0,0,0};
whitencompare = {0,0,0,0,0,0,0};
edgecompare = {0,0,0,0,0,0,0};
%
for n = 1:7
    whitencompare{n} = threshold(whiten(ImgBW), whiten(binaryImages{n}));
    compare{n} = threshold(Img, images{n});
    edgecompare{n} = threshold(ImgEdge, imagesEdge{n});
    
    
end



%answerT = threshold(binaryImages{1}, binaryImages{2});


%%
%Method for whitening. I had to use double(X) to get it working
%This seems to work better on binary images

X = x;
mX = bsxfun(@minus,double(X),mean(X)); %remove mean
fX = fft(fft(mX,[],2),[],3); %fourier transform of the images
spectr = sqrt(mean(abs(fX).^2)); %Mean spectrum
wX = ifft(ifft(bsxfun(@times,fX,1./spectr),[],2),[],3); %whitened X
wX = imcomplement(wX);
imshow(wX);

%%
whiteImg = {0,0,0,0,0};
for n = 1:5
    X = images{1};
    mX = bsxfun(@minus,double(X),mean(X)); %remove mean
    fX = fft(fft(mX,[],2),[],3); %fourier transform of the images
    spectr = sqrt(mean(abs(fX).^2)); %Mean spectrum
    wX = ifft(ifft(bsxfun(@times,fX,1./spectr),[],2),[],3); %whitened X
    whiteImg{n} = wX;
   

end
 subplot(5,1,1), imshow(whiteImg{n})
 subplot(5,1,2), imshow(whiteImg{n})
 subplot(5,1,3), imshow(whiteImg{n})
 subplot(5,1,4), imshow(whiteImg{n})
 subplot(5,1,5), imshow(whiteImg{n})
 
 %%
 x = imread('Desk1.jpg');
 %x = toBW(x);
%x = whiten(x);
imshow(x);

%%
%Look into canny/sobel edge detection
I = imread('unnamed.jpg');
F = imread('unnamed1.jpg');
I = rgb2gray(I);
F = rgb2gray(F);
BW1 = edge(I,'sobel');
%BW2 = edge(I,'canny');
BW2 = edge(F,'sobel');

BW1 = imcomplement(BW1);
BW2 = imcomplement(BW2);

imshowpair(BW1,BW2,'montage')

%%
%show with corners
C1 = corner(I);
C2 = corner(F);
%C2 = C2 + 2500;
%C2= C2+2500;
hold on
plot(C1(:,1), C1(:,2), '*', 'Color', 'c')
plot(C2(:,1), C2(:,2), '*', 'Color', 'r')

title('Maximum Corners = 200')
hold off
%%
%CornerMetric can't use this well
CI = imread('unnamed.jpg');
I = imresize(CI, .2);
I = I(1:240,1:250);
subplot(1,3,1);
imshow(I);
title('Original Image');

C = cornermetric(I);

C_adjusted = imadjust(C);
subplot(1,3,2);
imshow(C_adjusted);
title('Corner Metric');

corner_peaks = imregionalmax(C);
corner_idx = find(corner_peaks == true);
[r g b] = deal(I);
r(corner_idx) = 255;
g(corner_idx) = 255;
b(corner_idx) = 0;
RGB = cat(3,r,g,b);
subplot(1,3,3);
imshow(RGB);
title('Corner Points');

%%
%boundaries doesnt work

dim = size(BW1);
col = round(dim(2)/2)-90;
row = find(BW1(:,col,1));

boundary = bwtraceboundary(BW1,[row, col],'N');

imshow(I)
hold on;
plot(boundary(:,2),boundary(:,1),'g','LineWidth',3);

BW_filled = imfill(BW,'holes');
boundaries = bwboundaries(BW_filled);

for k=1:10
   b = boundaries{k};
   plot(b(:,2),b(:,1),'g','LineWidth',3);
end

%%
%Register Two Images Using Spatial Referencing to Enhance Display
%May be useful if i can find a way to choose reference points using edge
%detection
fixed = imread('unnamed3.jpg');
moving = imread('unnamed4.jpg');

iptsetpref('ImshowAxesVisible','on')
imshow(moving)
text(size(moving,2),size(moving,1)+30, ...
    'Image courtesy of mPower3/Emerge', ...
    'FontSize',7,'HorizontalAlignment','right');

%this take values from a file and needs to be replaced
%load westconcordpoints
movingPoints = {{3},{3}};
fixedPoints = 3;
tform = fitgeotrans(movingPoints, fixedPoints, 'projective');

registered = imwarp(moving, tform,'FillValues', 255);
figure, imshow(registered);

figure, imshowpair(fixed,registered,'blend');

Rfixed = imref2d(size(fixed));
registered1 = imwarp(moving,tform,'FillValues', 255,'OutputView',Rfixed);
figure, imshowpair(fixed,registered1,'blend');




%%
% Read the first image from the image set.
imgFolder = fullfile('imageSets');
imgSets = imageSet(imgFolder);
I = read(buildingScene, 1);


% Initialize features for I(1)
grayImage = rgb2gray(I);
points = detectSURFFeatures(grayImage);
[features, points] = extractFeatures(grayImage, points);

% Initialize all the transforms to the identity matrix. Note that the
% projective transform is used here because the building images are fairly
% close to the camera. Had the scene been captured from a further distance,
% an affine transform would suffice.
tforms(buildingScene.Count) = projective2d(eye(3));

% Iterate over remaining image pairs
for n = 2:buildingScene.Count

    % Store points and features for I(n-1).
    pointsPrevious = points;
    featuresPrevious = features;

    % Read I(n).
    I = read(buildingScene, n);

    % Detect and extract SURF features for I(n).
    grayImage = rgb2gray(I);
    points = detectSURFFeatures(grayImage);
    [features, points] = extractFeatures(grayImage, points);

    % Find correspondences between I(n) and I(n-1).
    indexPairs = matchFeatures(features, featuresPrevious, 'Unique', true);

    matchedPoints = points(indexPairs(:,1), :);
    matchedPointsPrev = pointsPrevious(indexPairs(:,2), :);

    % Estimate the transformation between I(n) and I(n-1).
    tforms(n) = estimateGeometricTransform(matchedPoints, matchedPointsPrev,...
        'projective', 'Confidence', 99.9, 'MaxNumTrials', 2000);

    % Compute T(1) * ... * T(n-1) * T(n)
    tforms(n).T = tforms(n-1).T * tforms(n).T;
end
imageSize = size(I);  % all the images are the same size

% Compute the output limits  for each transform
for i = 1:numel(tforms)
    [xlim(i,:), ylim(i,:)] = outputLimits(tforms(i), [1 imageSize(2)], [1 imageSize(1)]);
end

avgXLim = mean(xlim, 2);

[~, idx] = sort(avgXLim);

centerIdx = floor((numel(tforms)+1)/2);

centerImageIdx = idx(centerIdx);

Tinv = invert(tforms(centerImageIdx));

for i = 1:numel(tforms)
    tforms(i).T = Tinv.T * tforms(i).T;
end

for i = 1:numel(tforms)
    [xlim(i,:), ylim(i,:)] = outputLimits(tforms(i), [1 imageSize(2)], [1 imageSize(1)]);
end

% Find the minimum and maximum output limits
xMin = min([1; xlim(:)]);
xMax = max([imageSize(2); xlim(:)]);

yMin = min([1; ylim(:)]);
yMax = max([imageSize(1); ylim(:)]);

% Width and height of panorama.
width  = round(xMax - xMin);
height = round(yMax - yMin);

% Initialize the "empty" panorama.
panorama = zeros([height width 3], 'like', I);

blender = vision.AlphaBlender('Operation', 'Binary mask', ...
    'MaskSource', 'Input port');

% Create a 2-D spatial reference object defining the size of the panorama.
xLimits = [xMin xMax];
yLimits = [yMin yMax];
panoramaView = imref2d([height width], xLimits, yLimits);

% Create the panorama.
for i = 1:buildingScene.Count

    I = read(buildingScene, i);

    % Transform I into the panorama.
    warpedImage = imwarp(I, tforms(i), 'OutputView', panoramaView);

    % Create an mask for the overlay operation.
    warpedMask = imwarp(ones(size(I(:,:,1))), tforms(i), 'OutputView', panoramaView);

    % Clean up edge artifacts in the mask and convert to a binary image.
    warpedMask = warpedMask >= 1;

    % Overlay the warpedImage onto the panorama.
    panorama = step(blender, panorama, warpedImage, warpedMask);
end

figure
imshow(panorama)

%%
imagesc(im1)
hold on
plot(pts1(:,1),pts1(:,2),'ro')
plot(pts1(:,1),pts2(:,2),'ro')
