#!/bin/bash


# INTERFACE

cmd_remote () {
  if [[ $# -eq 0 ]]; then
    help_and_exit "No subcommand provided for command 'remote': $@"
  fi
  subcommand="$1"
  case "$subcommand" in
    ls)
      cmd_remote_ls
      exit 0
      ;;
    *)
      help_and_exit "Unknown subcommand for 'remote': $subcommand"
      ;;
  esac
}


# SUBCOMMANDS

cmd_remote_ls () {
  source_src_modules
  defined_modules
}
