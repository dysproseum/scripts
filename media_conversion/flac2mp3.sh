for i in *.flac ; 
do mplayer -vo null -vc dummy -af resample=44100 -ao pcm:waveheader "$i" && lame -m j -h --vbr-new -b 320 audiodump.wav -o "`basename "$i" .flac`.mp3"; 
done; 
rm -f audiodump.wav
