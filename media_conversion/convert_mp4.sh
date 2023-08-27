#!/bin/bash
#
# https://superuser.com/questions/1056599/ffmpeg-re-encode-a-video-keeping-settings-similar
# ffmpeg -i input.mp4 -c:v libx264 -crf 18 -preset slow -c:a copy output.mp4

for i in *.mp4
do
	ffmpeg -i "$i" -c:v libx264 -crf 18 -preset slow -c:a copy "$(basename "$i" .mp4).ffmpeg.mp4";
done


