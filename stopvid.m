function stopvid

close(gcf)
vid = evalin('base','facevid');
stoppreview(vid)
stop(vid)
end