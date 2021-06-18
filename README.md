# gimp-script-fu-resize-image


A simple GIMP script written in Scheme to resize all images in a named directory, given the required width of the resized images. It calculates the height proportionally from the current image width and new required width, and saves resized images in a /tmp directory.

The script will register in the GIMP script add-ins and has a simple GUI. A bash script is also provided to automate the use of the script from the command-line.

To use this, the scm file should be put into the GIMP scripts directory:
* On Linux, this will be something like ~/.config/GIMP/2.10/scripts/    (the version may be different for you)
