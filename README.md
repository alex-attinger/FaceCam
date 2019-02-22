# FaceVid
Code for acquiring and synchronizing face video

Main script is acquire_faceVid. This script calls additional functions to configure a GiGE camera to take one frame per external trigger and set up a matlab video object (config_faceCam), as well as to save timestamps for each acquired frame during video acquisition (get_timestamps). Also includes a script (cleanup_faceVid) to save the vector of timestamps and clear the video object from memory and workspace after recording is complete, which should always be run after recording is complete.
