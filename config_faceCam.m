function vid1 = config_faceCam(mouse,session)

% Establish a connection between MatLab and a recording camera.
% Sets camera up to acquire a single frame for each hardware trigger.
%
% created by IL 7/19/18
% IL modified 2/6/19
%
% NOTE: video is logging to disk and memory! For videos exceeding a couple
%       minutes, be sure to clear memory periodically so as not to fill up.

folder = fullfile('D:\temp', mouse);
if ~isdir(folder)
    mkdir(folder)
end
sprintf('creating video: %s \n',fullfile(folder,session))
vid1 = videoinput('gentl', 1, 'Mono8');
vid1.FramesPerTrigger = 1;
triggerconfig(vid1, 'hardware', 'DeviceSpecific', 'DeviceSpecific');
source1 = getselectedsource(vid1);
source1.TriggerSource = 'Line0';
source1.TriggerMode = 'On';
source1.TriggerActivation = 'RisingEdge';
source1.Gain = 10.0161;
source1.ExposureTime = 20000;
% save video as an MPEG-4
vid1.LoggingMode = 'disk&memory';
%vid1.DiskLogger = VideoWriter([folder session], 'Grayscale AVI');
vid1.DiskLogger = VideoWriter(fullfile(folder,session));
% use a hardware trigger to save one frame of video per trigger pulse
% check with: triggerinfo(vid1)
src.AcquisitionStatusSelector = 'AcquisitionActive';
vid1.TriggerRepeat = inf; % collect frames from multiple triggers

% set the TriggerSelector and trigger properties
%source1.TriggerSelector = 'FrameStart';
% source1.TriggerActivation = 'RisingEdge'; % trigger is the start of each pulse


end

% % to save with a manual trigger:
% triggerconfig(vid1, 'manual')
% % TO TRIGGER: use trigger(vid1)
% % to stop recording: use stop(vid1)









