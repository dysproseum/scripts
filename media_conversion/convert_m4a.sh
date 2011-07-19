for i in *.m4a ; do mplayer -vo null -vc dummy -af resample=44100 -ao pcm:waveheader "$i" && lame -m j -h --vbr-new -b 128 audiodump.wav -o "`basename "$i" .m4a`.mp3"; done; rm -f audiodump.wav
