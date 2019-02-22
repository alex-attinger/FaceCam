function vid1 = config_faceCam(mouse,session)

% Establish a connection between MatLab and a recording camera.
% Sets camera up to acquire a single frame for each hardware trigger.
%
% created by IL 7/19/18
% IL modified 2/6/19
%
% NOTE: video is logging to disk and memory! For videos exceeding a couple
%       minutes, be sure to clear memory periodically so as not to fill up.

close all
vid1 = videoinput('gentl', 1, 'Mono8');
folder = ['C:\Users\giocomolab\Desktop\Videos\RandomForage\' mouse '\'];

% save video as an MPEG-4
vid1.LoggingMode = 'disk&memory';
vid1.DiskLogger = VideoWriter([folder session], 'MPEG-4');

% use a hardware trigger to save one frame of video per trigger pulse
% check with: triggerinfo(vid1)
vid1.FramesPerTrigger = 1; % one frame is acquired for each external signal pulse
vid1.TriggerRepeat = inf; % collect frames from multiple triggers
triggerconfig(vid1, 'hardware', 'DeviceSpecific', 'DeviceSpecific');

% set the TriggerSelector and trigger properties
source1 = getselectedsource(vid1);
source1.TriggerSelector = 'ExposureStart';
source1.TriggerActivation = 'RisingEdge'; % trigger is the start of each pulse
source1.TriggerMode = 'on';

end

% % to save with a manual trigger:
% triggerconfig(vid1, 'manual')
% % TO TRIGGER: use trigger(vid1)
% % to stop recording: use stop(vid1)









