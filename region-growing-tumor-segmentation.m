clear; clc; close all;

% Set up folders
input_folder = 'images/';         
output_folder = 'output/';        
if ~exist(output_folder, 'dir')
    mkdir(output_folder);
end

% Load images
image_files = dir(fullfile(input_folder, '*.jpg'));

for i = 1:length(image_files)
    % Read image
    img_name = image_files(i).name;
    img_path = fullfile(input_folder, img_name);
    img = rgb2gray(imread(img_path));

    % Preprocessing
    img = imadjust(img);           % Enhance contrast
    img = medfilt2(img, [5 5]);    % Denoise

    % Create figure for seed selection 
    fig = figure('Name', 'Select seed', 'NumberTitle', 'off');
    imshow(img);
    title('Click tumor seed');
    figure(fig); % bring to focus 

    [x, y] = ginput(1); % click on seed
    x = round(x);
    y = round(y);

    close(fig); % close this figure

    % Region growing 
    threshold = 35;
    [rows, cols] = size(img);
    region = zeros(rows, cols);    % Output mask
    visited = zeros(rows, cols);   % Visited pixels mask
    seed_intensity = double(img(y, x));

    % 8-connected neighbors
    neighbors = [-1,-1; -1,0; -1,1; 0,-1; 0,1; 1,-1; 1,0; 1,1];

    % Initialize queue with seed pixel
    queue = [y, x];
    visited(y, x) = 1;
    region(y, x) = 1;

    % Region growing loop
    while ~isempty(queue)
        current = queue(1, :);
        queue(1, :) = [];
        for j = 1:size(neighbors, 1)
            r = current(1) + neighbors(j,1);
            c = current(2) + neighbors(j,2);
            if r > 0 && r <= rows && c > 0 && c <= cols && ~visited(r,c)
                if abs(double(img(r,c)) - seed_intensity) <= threshold
                    region(r,c) = 1;
                    queue = [queue; r, c];
                end
                visited(r,c) = 1;
            end
        end
    end

    % Overlay
    tumor_overlay = img;
    tumor_overlay(region == 1) = 255;

    % Save ouput
    [~, base_name, ~] = fileparts(img_name);
    imwrite(tumor_overlay, fullfile(output_folder, base_name + "_overlay.png"));
    imwrite(uint8(region * 255), fullfile(output_folder, base_name + "_mask.png"));

    % Show output 
    figure(2); clf;
    subplot(1,3,1); imshow(img); title('Original Image');
    subplot(1,3,2); imshow(region); title('Tumor Mask');
    subplot(1,3,3); imshow(tumor_overlay); title('Tumor Highlighted in White');
    drawnow;
end