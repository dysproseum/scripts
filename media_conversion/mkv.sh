################### START OF COMMANDS ###################

test -d "/root" || mkdir -p "/root"
test -d /root/.xvidenc/xvidenc.j3Gd5gHa || mkdir -p /root/.xvidenc/xvidenc.j3Gd5gHa
test -e "/root/ypf.avi" && mv -f "/root/ypf.avi" "/root/ypf.avi.old"

mencoder "/root/in.mkv" -o /dev/null -vf softskip,harddup -oac mp3lame -lameopts abr:br=140:aq=4:vol=2.2:mode=1 -ovc xvid -xvidencopts pass=1:turbo:me_quality=6:vhq=3:threads=1:max_bframes=2:bvhq=1:nopacked:quant_type=h263:noqpel:nogmc:trellis:nointerlacing:chroma_me:chroma_opt:hq_ac:nolumi_mask:rc_reaction_delay_factor=0:rc_averaging_period=100:closed_gop:autoaspect -passlogfile /root/.xvidenc/xvidenc.j3Gd5gHa/xvid.log

mencoder "/root/in.mkv" -o "/root/ypf.avi" -vf softskip,harddup -oac mp3lame -lameopts abr:br=140:aq=4:vol=2.2:mode=1 -ovc xvid -xvidencopts pass=2:bitrate=1200:me_quality=6:vhq=3:threads=1:max_bframes=2:bvhq=1:nopacked:quant_type=h263:noqpel:nogmc:trellis:nointerlacing:chroma_me:chroma_opt:hq_ac:nolumi_mask:rc_reaction_delay_factor=0:rc_averaging_period=100:closed_gop:autoaspect -passlogfile /root/.xvidenc/xvidenc.j3Gd5gHa/xvid.log
sleep 3

rm -rf /root/.xvidenc/xvidenc.j3Gd5gHa

#################### END OF COMMANDS ####################

