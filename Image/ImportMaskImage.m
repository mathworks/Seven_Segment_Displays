%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Script: ImportMaskImage
% Goal  : Take a 7-segment display image as a reference to create a labeled mask
% Copyright 2022 The MathWorks, Inc.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear variables; clc

% Select the straight '1', tilted '2' or rounded '3' version of the 7-segment
TYPE = 1;
switch (TYPE)
  case 1
    maskImage = 'SevenSegmentDisplayStraight.png';
  case 2
    maskImage = 'SevenSegmentDisplayTilted.png';
  case 3
    maskImage = 'SevenSegmentDisplayRounded.png';
  otherwise
    maskImage = '';
end

if ~isempty(maskImage)
  % Convert the mask image into Black and White representation
  BW = logical(rgb2gray(imread(maskImage)));
  % Identify all areas from the mask
  [~,labels] = bwboundaries(BW,'noholes');
  % Assign right labels values to the area to match the 7 segment display layout
  switch (TYPE)
    case 1
      labels(labels == 1) = -6;
      labels(labels == 2) = -5;
      labels(labels == 3) = -7;
      labels(labels == 4) = -1;
      labels(labels == 5) = -4;
      labels(labels == 6) = -2;
      labels(labels == 7) = -3;
      labels(labels == 8) = -8;
    case 2
      labels(labels == 1) = -5;
      labels(labels == 2) = -6;
      labels(labels == 3) = -4;
      labels(labels == 4) = -7;
      labels(labels == 5) = -1;
      labels(labels == 6) = -3;
      labels(labels == 7) = -2;
      labels(labels == 8) = -8;
    case 3
      labels(labels == 1) = -5;
      labels(labels == 2) = -4;
      labels(labels == 3) = -6;
      labels(labels == 4) = -1;
      labels(labels == 5) = -7;
      labels(labels == 6) = -3;
      labels(labels == 7) = -2;
      labels(labels == 8) = -8;
    otherwise
      % Should not get here
  end
  labels = -labels;
  % Save labelled mask
  save('..\UIClass\SevenSegmentMask.mat','labels');
else
  disp('Wrong type of mask selected.');
end
