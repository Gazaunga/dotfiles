#!/bin/bash

fbterm screen fbv grub-customizer mplayer fonts-inconsolata






# 
==> To run fbterm as a non-root user, do:
sudo gpasswd -a YOUR_USERNAME video
==> To enable keyboard shortcuts for non-root users, do:
sudo setcap 'cap_sys_tty_config+ep' /usr/bin/fbterm
or
sudo chmod u+s /usr/bin/fbterm

To use a background image, Fbterm can be set to take a screen shot of the frame buffer device when it starts.
The following script (using the fbv image viewer) is recommended in the man page:

#!/bin/bash
# fbterm-bi: a wrapper script to enable background image with fbterm
# usage: fbterm-bi /path/to/image fbterm-options
echo -ne "\e[?25l" # hide cursor
fbv -ciuker "$1" << EOF
q
EOF
shift
export FBTERM_BACKGROUND_IMAGE=1
exec /bin/fbterm "$@"

# dependencies
fontconfig, libjpeg, libungif, libtiff
