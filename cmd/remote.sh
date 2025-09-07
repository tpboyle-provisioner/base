#!/bin/bash


# INTERFACE

cmd_remote () {
  if (( $# == 0 )); then
    help_and_exit 1 "No subcommand provided for command 'remote': $@"
  fi
  local subcommand="$1"
  case "$subcommand" in
    ls)
      cmd_remote_ls && exit 0 ;;
    *)
      help_and_exit 1 "Unknown subcommand for 'remote': $subcommand" ;;
  esac
}


# SUBCOMMANDS

cmd_remote_ls () {
  source_src_modules
  defined_modules
}
