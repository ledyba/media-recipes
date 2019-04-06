#! #!/usr/bin/env zsh

function img() {
  local SCRIPT_PATH=~/repo/src/github.com/ledyba/media-recipes
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
