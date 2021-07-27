% Author : Ambarish Prashant Chandurkar (BT17ECE021)
% Practical : Operations on Video
% Lab Task 1.3 : Applying Background Substraction, Frame Differencing
% Algorithm

%% Initialise
clc; close all;clearvars;

%% Import the Video and Extract Frames out of it

V = VideoReader('rouen_video.avi');
Frames = read(V);
Frames = Frames(:,:,:,1:150); %Only First 150 Frames
%% Application of Frame Difference Algorithm
Frame_Differences = [];
for idx = 1:size(Frames,4)-1
    Frame_Differences = cat(4,Frame_Differences,... %Take Difference of Consecutive Frames
        abs(Frames(:,:,:,idx+1) - Frames(:,:,:,idx)));
end
%% Convert the Frame Difference Images to a Video using im2frame

for idx = 1:size(Frame_Differences,4)
    V_Differences(idx) = im2frame(Frame_Differences(:,:,:,idx));
end
implay(V_Differences)

%% Display the Difference Frames of the Algorithm Output
for idx = 0:6:36 %Extract every 6th frame starting from 6th Frame
    if idx ~= 0 %Ignore the zeroth index
        subplot(3,2,idx/6); imshow(Frame_Differences(:,:,:,idx));
        title(strcat('Frame #',int2str(idx)));
    end
end