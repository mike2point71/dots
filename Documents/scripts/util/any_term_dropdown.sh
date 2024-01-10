#!/usr/bin/env bash
 vim: set ft=bash:ts=2:et:

# ripped off from: gotbletu https://raw.githubusercontent.com/gotbletu/shownotes/master/any_term_dropdown.sh

# DEPEND: coreutils xdotool 


# get terminal emulator pid ex: 44040485
pid=$(xdotool search --class kitty | tail -n1)


# start a new terminal if none is currently running
if [[ -z "$pid" ]]; then
    kitty &
else

    xdotool windowactivate $pid
fi
