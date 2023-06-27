% Over the next few weeks, we will be covering ideas about camera focus and
% defocus and projector focus and defocus.

% This project is a non-automatic, hand-crafted way of understanding some
% of these issues.

% Take an image and read it into Matlab
% try to capture an image with many different depths in it
im = imread('image.jpg');

% Apply a gaussian blur to this image. The gaussian blur has two indices:
% the size of the kernel and the standard deviation of the gaussian used.
im_blur = imfilter(im,fspecial('gaussian',10,10));

% im_blur is a blur that does not change spatially in the image. But camera
% and defocus blur change with scene depth. Let us try to simulate this.

% Using Microsoft Paint or some other such tool, create an image of the
% same size as im. By hand, color any portion of the scene ("foreground")
% white and the rest of the scene ("background") black.
mask1 = imread('mask1.jpg');
mask1 = im2bw(mask1);

mask2 = imread('mask2.jpg');
mask2 = im2bw(mask2);

mask3 = imread('mask3.jpg');
mask3 = im2bw(mask3);
% Now display the image with the background blurred
defocusim1 = im2double(im).*mask1 + im2double(im_blur).*~mask1;
imshow(defocusim1);

defocusim2 = im2double(im).*mask2 + im2double(im_blur).*~mask2;
imshow(defocusim2);

defocusim3 = im2double(im).*mask3 + im2double(im_blur).*~mask3;
imshow(defocusim3);

% Now repeat this for three or more foregrounds in the scene
% for each new experiment, name the mask as mask1, mask2, ...
% for each new experiment, name the defocused image as defocusim1,
% defocusim2, ...

% Submit a zip file with:

% a. A gif containing each of the defocused regions in sequence, giving the
% impression of changing camera focus

% b. A single image where every mask you used (mask1, mask2, ...) is shown
% together. Does this look like depth image?
% for example, if you had three masks:
overallmask = 50*mask1 + 100*mask2 + 200*mask3;
imshow(overallmask)