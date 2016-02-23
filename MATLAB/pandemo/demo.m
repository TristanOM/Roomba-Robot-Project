%% Demo start

% This pair takes about 1 second to run
 im1 = imread('pics1.png');
 im2 = imread('pics2.png');

% This pair takes about 40 seconds to run
% im1 = imread('demoimages/MFineTest1.jpg');
 %im2 = imread('demoimages/MFineTest2.jpg');

% This pair takes about 8 seconds to run
%im1 = imread('demoimages/SFineTest1.jpg');
%im2 = imread('demoimages/SFineTest2.jpg');

% This pair takes about 6.5 seconds to run
% im1 = imread('demoimages/SCoarseTest1.jpg');
% im2 = imread('demoimages/SCoarseTest2.jpg');

fshowA=figure;
set(fshowA, 'Visible', 'off');
subA1=subplot(2,2,1); imshow(im1);
subA2=subplot(2,2,2); imshow(im2);
movegui(fshowA, 'northwest');

fshowH=figure;
set(fshowH, 'Visible', 'off');
subH1=subplot(2,2,1); imshow(im1);
subH2=subplot(2,2,2); imshow(im2);
movegui(fshowH, 'northeast');

%% sift features
 figure(fshowA); figure(fshowH);
[pts1, pts2] = SIFTmatch( im1, im2, 0, false );

%% ransac affine
[im2_TA, best_ptsA] = ransac( pts2, pts1, 'aff_lsq', 3 );
showbestpts(subA2, subA1, best_ptsA);
 figure(fshowA);

%% ransac homography
 figure(fshowA);
[im2_TH, best_ptsH] = ransac( pts2, pts1, 'proj_svd', 5 );
showbestpts(subH2, subH1, best_ptsH);
 figure(fshowH);

%% stitch affine
[im_stitchedA, stitched_maskA, im1TA, im2TA] = stitch(im1, im2, im2_TA);
 figure(fshowA);
subplot(2,2,3); imshow(im1TA);
subplot(2,2,4); imshow(im2TA);

 fA=figure;
 axis off;
 movegui(fA, 'west');
 imshow(im_stitchedA);

%% stitch homography
[im_stitchedH, stitched_maskH, im1TH, im2TH] = stitch(im1, im2, im2_TH);
 figure(fshowH);
 subplot(2,2,3); imshow(im1TH);
 subplot(2,2,4); imshow(im2TH);

% Following four lines were added by me, show original two images
orig=figure;
subA1=subplot(1,2,1); imshow(im1);
subA2=subplot(1,2,2); imshow(im2);
movegui(orig, 'northwest');

fH=figure;
axis off;
movegui(fH, 'northeast');
imshow(im_stitchedH);
