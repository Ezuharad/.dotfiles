#!/bin/sh
#Script to disable middle mouse paste; Dependencies: xsel, wl-clipboard

if [ "$XDG_SESSION_TYPE" == "wayland" ]; then
    wl-paste -p --watch wl-copy -p '' # Usually works.
    #wl-paste -p --watch wl-copy -cp  # 100% Effective, may cause issues selecting text in GTK applications.
fi

while [ "$XDG_SESSION_TYPE" == "x11" ]; do
    xsel -fin </dev/null    # 100% Effective, May cause issues selecting text in GTK applications.
done
