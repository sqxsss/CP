% Read and convert the image to monochrome
im_1 = mean(imread('L.png'), 3);
im_2 = mean(imread('R.png'), 3);
im_3 = mean(imread('T.png'), 3);
im_4 = mean(imread('B.png'), 3);
% Get the size of the images
[w, h] = size(im_1);
% Calibrate brightness
im_1 = im_1 * 128 / mean(reshape(im_1, [w * h, 1]));
im_2 = im_2 * 128 / mean(reshape(im_2, [w * h, 1]));
im_3 = im_3 * 128 / mean(reshape(im_3, [w * h, 1]));
im_4 = im_4 * 128 / mean(reshape(im_4, [w * h, 1]));
% Compute max of all samples
im_max = max(cat(3, im_1, im_2, im_3, im_4), [], 3);
% Normalize image in regard of max
r1 = im_1 ./ im_max;
r2 = im_2 ./ im_max;
r3 = im_3 ./ im_max;
r4 = im_4 ./ im_max;
% Build convolution core
conv = fspecial('sobel');
d1 = imfilter(r1, conv); d3 = imfilter(r3, conv); % vertical sobel
d2 = imfilter(r2, conv'); d4 = imfilter(r4, conv'); % horizontal sobel
% Compute confidence map
% Keep only negative transitions
silhouette_combo = cat(3, d1 .* (d1 > 0), abs(d2 .* (d2 < 0)), abs(d3 .* (d3 < 0)), d4 .* (d4 > 0));
% Pick max confidence in each direction
confidence = max(silhouette_combo, [], 3);
% Show the image
imshow(confidence>0.5)
