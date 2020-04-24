%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Script: ImportMaskImage
% Goal  : Take a 7-segment display image as a reference to create a labeled mask
% Copyright 2020 The MathWorks, Inc.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear variables; clc

% Select the tilted version of the 7-segment (true) or the normal one (false)
TILT = false;
if (TILT) %#ok<*UNRCH>
  maskImage = 'SevenSegmentDisplayTilted.png';
else
  maskImage = 'SevenSegmentDisplay.png';
end

% Convert the mask image into Black and White representation
BW = logical(rgb2gray(imread(maskImage)));
% Identify all areas from the mask
[~,labels] = bwboundaries(BW,'noholes');
% Assign right labels values to the area to match the 7 segment display layout
if (~TILT)
  labels(labels == 1) = -6;
  labels(labels == 2) = -5;
  labels(labels == 3) = -7;
  labels(labels == 4) = -1;
  labels(labels == 5) = -4;
  labels(labels == 6) = -2;
  labels(labels == 7) = -3;
  labels(labels == 8) = -8;
else
  labels(labels == 1) = -5;
  labels(labels == 2) = -6;
  labels(labels == 3) = -4;
  labels(labels == 4) = -7;
  labels(labels == 5) = -1;
  labels(labels == 6) = -3;
  labels(labels == 7) = -2;
  labels(labels == 8) = -8;
end
labels = -labels;
% Save labelled mask
save('..\UIClass\SevenSegmentMask.mat','labels');
