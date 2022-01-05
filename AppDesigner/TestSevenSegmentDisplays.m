%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Script: TestSevenSegmentDisplays
% Goal  : Run an instance of a group of a 7-segment displays component using the
%         App Designer
% Copyright 2022 The MathWorks, Inc.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Clean session
clear variables; close all force; clc;

% Constants
NB_DISPLAYS      = 3;
UINT8_MAX        = 255;
BACKGROUND_COLOR = [127 127 0]/UINT8_MAX; % RGB
SEGMENTS_COLOR   = [131 131 0]/UINT8_MAX; % RGB
SEGMENTS_VALUES  = [0b10000110; 0b01011011; 0b01001111]; % 1 2 3

% Instanciate one 7-Segment displays component
app = SevenSegmentDisplaysApp();
% Construct a layout of several 7-segment displays
SevenSegmentDisplaysLayout(app,NB_DISPLAYS,SEGMENTS_COLOR,BACKGROUND_COLOR);

% Change segments color to black
app.SegmentsColor = [0 0 0];
% app.Endianness = 'Right';

% Write new values
for n=1:1:NB_DISPLAYS
  setSevenSegmentDisplay(app,SEGMENTS_VALUES(n,:),n);
end
