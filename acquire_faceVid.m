function vid1 = acquire_faceVid

% acquire a video and save to disk
%
% created by IL 2/6/19
% IL modified 2/11/19
%
% vid1.UserData.times = timestamp for each frame acquired
% vid1.UserData.frames = corresponding frame number
%
% 
% BEFORE RUNNING:
% ---------------
%     preview the video and ensure that lighting/framing/etc look good:
%     vid1 = videoinput('gentl', 1, 'Mono8');
%     preview(vid1);
%
% AFTER RUNNING:
% -------------
%     stop the video object, print key params, and clear the video from
%     memory by running the function:
%     cleanup_faceVid(vid1);

clear all; close all; clc

% input session info
mouse = input('Mouse: ', 's');
session = input('Session: ', 's');

% configure for video acquisition
vid1 = config_faceCam(mouse,session);

% to store timestamps
D = {};
D.times = [];
D.frames = [];
vid1.UserData = D;

% configure to save frame timestamps every 20 frames
vid1.FramesAcquiredFcnCount = 20;
vid1.FramesAcquiredFcn = @get_timestamps;

% start video acquisition
start(vid1)
disp('video acquisition started:')
disp(datetime('now'))
disp('----------------------------------------')
disp('REMEMBER TO CLEAR THE VIDEO FROM MEMORY!')
disp('run cleanup_faceVid(vid1) after acquisition is complete')

end