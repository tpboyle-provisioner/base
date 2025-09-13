#!/bin/bash


# ROOT DIR

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"


# CONFIG

SRC_DIR="$ROOT_DIR/src"
SRC_URL="https://github.com/tpboyle-provisioner/src.git"


# SOURCES

source "./cmd/help.sh"
source "./cmd/modules.sh"
source "./cmd/remote.sh"
source "./cmd/src.sh"

source "./conf.sh"

source_src_modules () {
  if [[ -d "$SRC_DIR" ]]; then
    source "$SRC_DIR/modules.sh"
  else
    echo "ERROR: Could not find the src/ directory!"
    exit 1
  fi
}


# MAIN

main () {
  (( $# == 0 )) && help && exit 0
  local command="$1"
  case "$command" in
    help|--help)
      help && exit 0 ;;
    add|ls|run|rm|update|conf)
      cmd_modules "$@" && exit 0 ;;
    src)
      shift && cmd_src "$@" && exit 0 ;;
    remote)
      shift && cmd_remote "$@" && exit 0 ;;
    *)
      echo "ERROR: Unknown command: $command" && help && exit 1 ;;
    esac
}

if [[ "${BASH_SOURCE[0]}" == "$0" ]]; then
  main "$@"
fi

