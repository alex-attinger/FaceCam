function cleanup_faceVid(v)

% input session info
mouse = evalin('base','mouse_name');
session = evalin('base','session_name');

% stop video object
stoppreview(v)
stop(v)
disp('video acquisition stopped:')
disp(datetime('now'))
disp('----------------------------')

% save and display params
folder = ['D:\videos\' mouse '\'];
file = [session '_framedata.mat'];
framedata = v.UserData;
save([folder file], 'framedata')
disp(['frametimes saved at : ' folder file])
disp('number of frames acquired:')
disp(max(framedata.frames))
disp('video run time (mins):')
disp(max(framedata.times)/60)

% clear video object from memory
delete(v)

end