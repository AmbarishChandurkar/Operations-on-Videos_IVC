% Author : Ambarish Prashant Chandurkar (BT17ECE021)
% Practical : Operations on Video
% Lab Task 1.1 : Extracting Frames from Videos

%% Initialise
clc; close all;clearvars;

%% Import the Video and Extract the Frames

V = VideoReader('rouen_video.avi'); %Read the Video
for idx = 0:6:36 %Extract every 6th frame starting from 6th Frame
    if idx ~= 0 %Ignore the zeroth index
        Frame = read(V, [idx]); %Extract Frame
        subplot(3,2,idx/6); imshow(Frame); %Plot the Frame
        title(strcat('Frame #',int2str(idx)));
    end
end
implay(V, V.FrameRate)