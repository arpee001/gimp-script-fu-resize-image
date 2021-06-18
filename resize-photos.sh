#!/bin/bash
#
# resize-photos.sh
#
# Resize all jpg files in a directory named on the command-line
# Parameters:
#   1 - the directory name
#   2 - the new image width in pixels (e.g. 1024)

echo "Resizing jpg files in $1 to $2 px width"
tempdir=`date +%Y-%m-%d-%H%M%S`-resized-images
mkdir /tmp/$tempdir
cp -p $1/*.jpg /tmp/$tempdir/
find /tmp/$tempdir/ -name \*.jpg -exec gimp -i -b "(script-fu-resize-image \"{}\" $2)" -b '(gimp-quit 0)' 2>/tmp/$tempdir/log.err \; 
echo "Resized files are in /tmp/$tempdir/"
