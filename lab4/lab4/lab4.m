% *=======================*
% | Yuxuan Zhang          |
% | University of Florida |
% *=======================*
close all;
% Create a video of the cube as the light source moves in the way you saw
% it in class. 
fprintf("Reading video\n");
vidObj = VideoReader('video.mp4');
vid = uint8(read(vidObj));
[H, W, D, T] = size(vid);
samples = 200:200:H-200;
fprintf("Creating EPI slices\n");
figure();
slices = createEPI(vid, samples);
% Patched video
patch_vid = vid;
patch_vid(1000:1600, 1000:1600, :) = 0;
figure();
patched_slices = createEPI(patch_vid, samples);
