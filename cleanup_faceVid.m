function cleanup_faceVid(v)

% input session info
mouse = input('Mouse: ', 's');
session = input('Session: ', 's');

% stop video object
stop(v)
disp('video acquisition stopped:')
disp(datetime('now'))
disp('----------------------------')

% save and display params
folder = ['C:\Users\giocomolab\Desktop\Videos\RandomForage\' mouse '\'];
file = [session '_framedata.mat'];
framedata = v.UserData;
save([folder file], 'framedata')
disp('number of frames acquired:')
disp(max(framedata.frames))
disp('video run time (mins):')
disp(max(framedata.times)/60)

% clear video object from memory
delete(v)

end