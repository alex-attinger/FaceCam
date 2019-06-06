function vid1 = acquire_faceVid(varargin)

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
%     by calling preview_faceVid
%     close video by hitting close button. Will automatically call cleanup
%     function


close all; 

% input session info
if nargin==0
mouse = input('Mouse: ', 's');
session = input('Session: ', 's');
assignin('base','mouse_name',mouse)
assignin('base','session_name',session);
else
    ff=fopen(varargin{1});
    
dat=textscan(ff,'%s','Delimiter','\n');
dat=dat{1};
fclose(ff)
mouse = extractValue(dat,'Mouse');
condition = extractValue(dat,'Condition');
stimulus = extractValue(dat,'Stimulus');
mouse = strcat(mouse,'_',datestr(now,'yymmdd'));
session = strcat(stimulus,'_',condition,'_',datestr(now,'hh-MM-ss'));
end
assignin('base','mouse_name',mouse);
assignin('base','session_name',session);

% configure for video acquisition
vid1 = config_faceCam(mouse,session);
assignin('base','facevid',vid1)
% to store timestamps
D = {};
D.times = [];
D.frames = [];
vid1.UserData = D;

% configure to save frame timestamps every 20 frames
vid1.FramesAcquiredFcnCount = 20;
vid1.FramesAcquiredFcn = @get_timestamps;

figure('Name', 'My Custom Preview Window'); 
uicontrol('String', 'Close', 'Callback', 'stop_clean_vid'); 
vidRes = vid1.VideoResolution; 
nBands = vid1.NumberOfBands; 
hImage = image( zeros(vidRes(2), vidRes(1), nBands) );
%setappdata(hImage,'UpdatePreviewWindowFcn',@sum);
preview(vid1, hImage);

% start video acquisition
start(vid1)
disp('video acquisition started:')
disp(datetime('now'))
disp('----------------------------------------')
disp('REMEMBER TO CLEAR THE VIDEO FROM MEMORY!')
disp('run cleanup_faceVid(vid1) after acquisition is complete')

end