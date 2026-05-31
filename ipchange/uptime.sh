#!/bin/bash

UP=0
echo $UP;

while (true)
do
  NEW_IP=$(curl -s https://api.ipify.org/)

  # Test for nonzero return code
  if [ $? -eq 0 ]; then
    ((UP++))
  else
    UP=0
  fi

  # Log results
  OUT="$(date +"%Y-%m-%d %H:%M:%S"),${UP}"
  echo $OUT
  echo $OUT >> tally.txt

  # Update DNS
  if [[ "$IP" != "$NEW_IP" ]]; then
    echo "NEW IP: $NEW_IP"
    IP=$NEW_IP
    ./cloudflare.sh $NEW_IP
  fi
  sleep 60
done
