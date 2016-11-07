#!/bin/bash

function process_device()
{
        echo -n ${device}
        /sbin/hdparm -I /dev/${device} | grep "al Number"
        /usr/sbin/smartctl --all /dev/${device} | grep -e "Capacity" -e "Reallocated_Sector_Ct" -e "Current_Pending_Sector" -e "Offline_Uncorrectable" -e "UDMA_CRC_Error_Count" -e "Hardware_ECC_Recovered" -e "Power_On_Hours"
        echo
}

for a in /dev/sd?;
do
        device=${a/\/dev\//}
        grep ${device} /proc/mdstat >> /dev/null
        if [ $? == 0 ];
        then
                process_device
        fi
done
