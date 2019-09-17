#! #!/usr/bin/env zsh

function img() {
  local SCRIPT_PATH=~/src/github.com/ledyba/media-recipes
  local dir="$2"
  if [ -n "$dir" ]; then
    dir='.'
  fi
  case "$1" in
    "hash") bash ${SCRIPT_PATH}/hash-images "${dir}" ;;
    "hash-scanned") bash ${SCRIPT_PATH}/hash-scanned-images "${dir}" ;;
    "resize") bash ${SCRIPT_PATH}/resize-images "${dir}" ;;
    *) echo "???" ;;
  esac
}
compdef _img img
function _img() {
  local -a cmds
  if (( CURRENT == 2 ));then
    cmds=('hash' 'hash-scanned' 'resize')
    _describe -t commands "subcommand" cmds
  else
    _files
  fi
  return 1;
}
################################################################################

function video() {
  local SCRIPT_PATH=~/src/github.com/ledyba/media-recipes
  local cmd=$1
  if [[ $# > 0 ]]; then
    shift
  fi
  case "${cmd}" in
    "timelapse") bash ${SCRIPT_PATH}/make-timelapse-video "$1" "$2" ;;
    "cat") bash ${SCRIPT_PATH}/cat-video "$@" ;;
    "encode-web") bash ${SCRIPT_PATH}/encode-video-web "$@";;
    *) echo "???" ;;
  esac
}
compdef _video video
function _video() {
  local -a cmds
  if (( CURRENT == 2 ));then
    cmds=('timelapse' 'cat' 'encode-web')
    _describe -t commands "subcommand" cmds
  else
    _files
  fi
  return 1;
}

################################################################################

function audio() {
  local SCRIPT_PATH=~/src/github.com/ledyba/media-recipes
  local cmd=$1
  if [[ $# > 0 ]]; then
    shift
  fi
  case "${cmd}" in
    "visualize") bash ${SCRIPT_PATH}/visualize-audio "$1" ;;
    *) echo "???" ;;
  esac
}
compdef _audio audio
function _audio() {
  local -a cmds
  if (( CURRENT == 2 ));then
    cmds=('visualize')
    _describe -t commands "subcommand" cmds
  else
    _files
  fi
  return 1;
}
