% Author : Ambarish Prashant Chandurkar (BT17ECE021)
% Practical : Operations on Video
% Lab Task 1.2 : Playing Video in Reverse

%% Initialise
clc; close all;clearvars;

%% Import the Video and save the Reverse of it

V = VideoReader('rouen_video.avi');
Frames = read(V);
Reversed_Frames = Frames(:,:,:,size(Frames,4):-1:1);
%Reverse the Indexing

%% Display the Reversed Frames

for idx = 0:6:36 %Extract every 6th frame starting from 6th Frame
    if idx ~= 0 %Ignore the zeroth index
        subplot(3,2,idx/6); imshow(Reversed_Frames(:,:,:,idx));
        title(strcat('Frame #',int2str(idx)));
    end
end
implay(Reversed_Frames, V.FrameRate)