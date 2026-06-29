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

  # Auxiliary scripts
  for script in scripts-enabled/uptime*.sh; do
    # Skip if no .sh files exist (glob didn't match)
    [ -e "$script" ] || continue

    # Skip the current script itself to avoid recursion
    [ "$script" = "$0" ] && continue

    # Ensure the file is executable
    if [ -x "$script" ]; then
        "./$script" "$UP"
    fi
  done

  # Update DNS
  if [[ "$IP" != "$NEW_IP" ]]; then
    echo "NEW IP: $NEW_IP"
    IP=$NEW_IP

    for script in scripts-enabled/ipchange*.sh; do
      [ -e "$script" ] || continue
      [ "$script" = "$0" ] && continue
      if [ -x "$script" ]; then
        "./$script" "$NEW_IP"
      fi
    done
  fi

  sleep 60
done
