for i in *.mp3 ; do mplayer -vo null -vc dummy -af resample=44100 -ao pcm:waveheader:file="`basename "$i" .mp3`.wav" "$i"; done;
