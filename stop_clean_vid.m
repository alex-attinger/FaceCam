function stop_clean_vid

close(gcf)
vid = evalin('base','facevid');
stoppreview(vid)
stop(vid)
evalin('base','cleanup_faceVid(facevid)')
end