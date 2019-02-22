function get_timestamps(vid1, ~)
% function to get timestamps for video frames

    d = vid1.UserData;
    [~, ts, meta] = getdata(vid1, vid1.FramesAvailable);

    % save timestamps
    d.times = [d.times; ts];

    % save frame numbers
    n = [];
    for i = 1:size(meta,1)
        n(end + 1) = meta(i).FrameNumber;
    end
    d.frames = [d.frames n];

    vid1.UserData = d;
end