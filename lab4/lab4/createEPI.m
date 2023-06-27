% The function to create EPI slices from video
% Empty obj for EPI slices
function [slices] = createEPI(vid, samples)
    [H, W, D, T] = size(vid);
    N = length(samples);
    NUM_SQUARES = ceil(sqrt(N));
    slices = zeros([T, W, D, N]);
    i = 0;
    % Generate EPI slices
    for y=samples
        i = i + 1;
        vid_slice = vid(y, :, :, :);
        slice = permute(vid_slice, [4, 2, 3, 1]);
        % store into slices
        slices(:, :, :, i) = slice;
        % interpolate along T axis
        RATIO = 20;
        interpSlice = zeros(T * RATIO, W, D);
        for x=1:W
            for d=1:D
                interpSlice(:, x, d) = interp1(1:T ,double(slice(:, x, d)), linspace(1, T, T * RATIO), 'linear');
            end
        end
        % show the interpolated image
        subplot(NUM_SQUARES, NUM_SQUARES, i);
        imshow(uint8(interpSlice));
    end
end