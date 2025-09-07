#!/bin/bash


# INTERFACE

cmd_src () {
  if (( $# == 0 )); then
    help_and_exit 1 "ERROR: No subcommand provided for command 'src': $@"
  fi
  local subcommand="$1"
  case "$subcommand" in
    update)
      cmd_src_update && exit 0 ;;
    version)
      cmd_src_version && exit 0 ;;
    *)
      help_and_exit 1 "Unknown subcommand for 'src': $subcommand" ;;
  esac
}


# SUBCOMMANDS

cmd_src_update () {
  if [[ -d "$SRC_DIR" ]]; then
    echo "Updating src/ directory..."
    cd "$SRC_DIR"
    git pull
    cd - &> /dev/null
  else
    echo "Cloning '$SRC_DIR' from '$SRC_URL'..."
    git clone "$SRC_URL" "$SRC_DIR"
  fi
}

cmd_src_version () {
  if [[ -d "$SRC_DIR" ]]; then
    cd "$SRC_DIR"
    git log -1
    cd - &> /dev/null
  else
    echo "ERROR: src/ directory does not exist."
    exit 1
  fi
}
