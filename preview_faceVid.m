function vid1 = preview_faceVid

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


% configure for video acquisition
vid1 = videoinput('gentl', 1, 'Mono8');
assignin('base','facevid',vid1)

source1 = getselectedsource(vid1);
%source1.ExposureStartTriggerMode = 'On';
%source1.ExposureStartTriggerActivation = 'RisingEdge';
source1.Gain = 10.0161;
source1.ExposureTime = 20000;

figure('Name', 'My Custom Preview Window'); 
uicontrol('String', 'Stop', 'Callback', 'stopvid'); 
vidRes = vid1.VideoResolution; 
nBands = vid1.NumberOfBands; 
hImage = image( zeros(vidRes(2), vidRes(1), nBands) );
%setappdata(hImage,'UpdatePreviewWindowFcn',@sum);
preview(vid1, hImage);

% start video acquisition
%start(vid1)
disp('video acquisition started:')
disp(datetime('now'))
disp('----------------------------------------')
disp('REMEMBER TO CLEAR THE VIDEO FROM MEMORY!')
disp('run cleanup_faceVid(vid1) after acquisition is complete')

end