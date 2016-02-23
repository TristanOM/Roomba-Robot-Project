%%
truecolor = multibandread('bird_1.jpg', [512, 512, 7], 'uint8->uint8', ...
                        128, 'bil', 'ieee-le', {'Band', 'Direct',[3 2 1]}

%%
figure
imshow(truecolor);
title('Turecolor')
text(size(truecolor, 2), size(truecolor,1)+ 15,...
    'Image', 7, 'lll ','ttt ')

%%
r = truecolor(:,:,1);
g = truecolor(:,:,2);
b = truecolor(:,;,3);
figure
plot3(r(:),g(:),b(:),',')
grid('on')
xlabel('Red (Band 3)')
ylabel('Green (Band 2)')
zlabel('Blue (band 1)')
title('Scatterplot of stuff')