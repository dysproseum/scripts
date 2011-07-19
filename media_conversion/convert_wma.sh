for i in *.wma ; do mplayer -vo null -vc dummy -af resample=44100 -ao pcm:waveheader "$i" && lame -m j -h --vbr-new -b 128 audiodump.wav -o "`basename "$i" .wma`.mp3"; done; rm -f audiodump.wav
