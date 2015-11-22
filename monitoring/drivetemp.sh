#!/bin/bash

smartctl -a /dev/sda | grep -i temp
smartctl -a /dev/sdb | grep -i temp
smartctl -a /dev/sdc | grep -i temp
smartctl -a /dev/sdd | grep -i temp
