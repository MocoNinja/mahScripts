#! /bin/bash
find -type f -iname "*.ttf" -print0 | sudo xargs -0 mv -t /usr/share/fonts

