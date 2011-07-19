#!/bin/sh

for i in *.wav; do flac $i -o $i.flac; done;
