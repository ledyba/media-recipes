#! #!/usr/bin/env zsh

function pdf() {
  local SCRIPT_PATH=~/src/github.com/ledyba/media-recipes
  local cmd="$1"
  if [[ $# > 0 ]]; then
    shift
  fi
  case "$cmd" in
    "from-images") bash ${SCRIPT_PATH}/pdf-from-images "$@" ;;
    *) echo "???" ;;
  esac
}
compdef _pdf pdf
function _pdf() {
  local -a cmds
  if (( CURRENT == 2 ));then
    cmds=('from-images')
    _describe -t commands "subcommand" cmds
  else
    _files
  fi
  return 1;
}
################################################################################

function img() {
  local SCRIPT_PATH=~/src/github.com/ledyba/media-recipes
  local cmd="$1"
  if [[ $# > 0 ]]; then
    shift
  fi
  case "$cmd" in
    "hash") bash ${SCRIPT_PATH}/img-hash "$@" ;;
    "rename-scan") bash ${SCRIPT_PATH}/img-rename-scan "$@" ;;
    "minify") bash ${SCRIPT_PATH}/img-minify "$@" ;;
    *) echo "???" ;;
  esac
}
compdef _img img
function _img() {
  local -a cmds
  if (( CURRENT == 2 ));then
    cmds=('hash' 'rename-scan' 'minify')
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
    "cat") bash ${SCRIPT_PATH}/video-cat "$@" ;;
    "make-timelapse") bash ${SCRIPT_PATH}/video-make-timelapse "$@";;
    "encode-web") bash ${SCRIPT_PATH}/video-encode-web "$@";;
    *) echo "???" ;;
  esac
}
compdef _video video
function _video() {
  local -a cmds
  if (( CURRENT == 2 ));then
    cmds=('cat' 'make-timelapse' 'encode-web')
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
    "visualize") bash ${SCRIPT_PATH}/audio-visualize "$@" ;;
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
