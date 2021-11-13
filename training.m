% Convert Video Data to frames
a=VideoReader('videoplayback.mp4');
for img = 1:a.NumberOfFrames ;
    filename=strcat('frame',num2str(img),'.jpg');
    b = read(a, img);
    imwrite(b,filename); 
end

%Convert CMYK jpg to RGB jpg
for k = 1:a.NumberOfFrames;
    jpgFilename = sprintf(filename, k);
    fullFileName = fullfile(jpgFilename);
    rgbImage = imread(fullFileName);
    % Get the dimensions of the image.  numberOfColorBands should be = 3.
    [rows, columns, numberOfColorBands] = size(rgbImage);
    % Enlarge figure to full screen.
    set(gcf, 'Position', get(0,'Screensize')); 
    % Extract the individual red, green, and blue color channels.
    redChannel = rgbImage(:, :, 1);
    greenChannel = rgbImage(:, :, 2);
    blueChannel = rgbImage(:, :, 3);
    % Generate a noisy image.  This has salt and pepper noise independently on
    % each color channel so the noise may be colored.
    noisyRGB = imnoise(rgbImage,'salt & pepper', 0.05);
    % Extract the individual red, green, and blue color channels.
    redChannel = noisyRGB(:, :, 1);
    greenChannel = noisyRGB(:, :, 2);
    blueChannel = noisyRGB(:, :, 3);
    % Median Filter the channels:
    redMF = medfilt2(redChannel, [3 3]);
    greenMF = medfilt2(greenChannel, [3 3]);
    blueMF = medfilt2(blueChannel, [3 3]);
       % Find the noise in the red.
      noiseImage = (redChannel == 0 | redChannel == 255);
    % Get rid of the noise in the red by replacing with median.
    noiseFreeRed = redChannel;
    noiseFreeRed(noiseImage) = redMF(noiseImage);
    % Find the noise in the green.
    noiseImage = (greenChannel == 0 | greenChannel == 255);
    % Get rid of the noise in the green by replacing with median.
    noiseFreeGreen = greenChannel;
    noiseFreeGreen(noiseImage) = greenMF(noiseImage);
    % Find the noise in the blue.
    noiseImage = (blueChannel == 0 | blueChannel == 255);
    % Get rid of the noise in the blue by replacing with median.
    noiseFreeBlue = blueChannel;
    noiseFreeBlue(noiseImage) = blueMF(noiseImage);
    % Reconstruct the noise free RGB image
    rgbFixed = cat(3, noiseFreeRed, noiseFreeGreen, noiseFreeBlue);
    filenames=strcat('rgbframe',num2str(img),'.jpg');
    imwrite(rgbFixed,filenames); 
end