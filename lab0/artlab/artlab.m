% Artlab is our simplest lab. All we do is read in an image and try to
% create effects by making the image different.

% Read in the picture of green mountains
im = imread('mountains.png');

% Q1: What is the size of the image? Use the function "size"
imageSize = size(im);

% Q2: Create a red, green and blue matrix of the image 
red = im(:,:,1);
green = im(:,1,:);
blue = im(1,:,:);

% Create a gray version of the image
% "double" turns the data into floating point numbers
grayim = (double(red) + double(green) + double(blue))/3; 

% Use the command "range" to find out the max and min values
%range(grayim(:))

% Q3: This is the point of the lab. We need to figure out how to quantize
% the image, using the range as a starting point. I've given one example
% here.

level1 = 50;
level2 = 100;
level3 = 150;
 
% for every color
for i = 1:3
    tmp = im(:,:,i);
    
    if i == 1
        % red quantization
        tmp(find(tmp>200)) = 100;

    elseif i == 2    
        % green quantization
        tmp(find(tmp<50)) = 40;
        tmp(find(tmp>50 & tmp<100)) = 70;
        tmp(find(tmp>100 & tmp<120)) = 100;
        tmp(find(tmp>120 & tmp<200)) = 110;
        tmp(find(tmp>200)) = 100;

    elseif i == 3
        % blue quantization 
        tmp(find(tmp>200)) = 100;
        
    end
    
    quantim(:,:,i) = tmp;
    
end
    

% Make the image into an integer type (not floating point) so we can display it
quantim = uint8(quantim);

% Show them together
imshowpair(im,quantim,'montage');