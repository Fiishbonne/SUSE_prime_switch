#!/bin/bash

intel () {
  sudo prime-select intel
}
nvidia () {
  sudo prime-select nvidia
}
info () {
  glxinfo | grep 'OpenGL renderer string'
}
CHECK=$(info | awk '{print $4}')

info
if [ $CHECK = 'Mesa' ]; then
  echo "Switching to Nvidia"
  nvidia
else
  echo "Switching to Intel"
  intel
fi
