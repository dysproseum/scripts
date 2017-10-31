for i in *.flac ; 
do flac -cd "$i" | lame -b 320 - "${i%.*}".mp3;
done; 
