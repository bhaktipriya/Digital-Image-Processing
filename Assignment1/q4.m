rgbImage=imread('lotus.jpg');
redChannel = rgbImage(:, :, 1);
greenChannel = rgbImage(:, :, 2);
blueChannel = rgbImage(:, :, 3);
dim = 10;
redMF = medfilt2(redChannel, [dim dim]);
greenMF = medfilt2(greenChannel, [dim dim]);
blueMF = medfilt2(blueChannel, [dim dim]);
rgbFixed = cat(3, redMF, greenMF, blueMF);
imshow(rgbFixed);

redModeF=colfilt(redChannel, [dim dim], 'sliding', @mode);
greenModeF=colfilt(greenChannel, [dim dim], 'sliding', @mode);
blueModeF=colfilt(blueChannel, [dim dim], 'sliding', @mode);
rgbFixedMode = cat(3, redModeF, greenModeF, blueModeF);
imshow(rgbFixedMode);
