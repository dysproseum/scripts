#!/bin/bash

# Output incremental tally to YYYY-MM.csv file.

UP=$1
OUT="$(date +"%Y-%m-%d %H:%M:%S"),${UP}"
OUTFILE="$(date +"%Y-%m").csv"
echo $OUT >> $OUTFILE
