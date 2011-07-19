for i in *.wav ; do lame -m j -h --vbr-new -b 128 "$i" -o "`basename "$i" .wav`.mp3"; done;
