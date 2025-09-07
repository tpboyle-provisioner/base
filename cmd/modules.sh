#!/bin/bash


# INTERFACE

cmd_modules () {
  local command="$1"
  case "$command" in
    help|--help)
      help_and_exit 0 ;;
    add)
      shift && cmd_add_modules "$@" && exit 0 ;;
    ls)
      shift && cmd_ls_modules "$@" && exit 0 ;;
    rm)
      shift && cmd_rm_modules "$@" && exit 0 ;;
    run)
      shift && cmd_run_modules "$@" && exit 0 ;;
    update)
      shift && cmd_update_modules "$@" && exit 0 ;;
    *)
      help_and_exit 1 "ERROR: Unknown command: $command" ;;
    esac
}


# COMMANDS

cmd_add_modules () {
  source_src_modules
  if (( $# == 0 )); then
    help_and_exit 1 "ERROR: No modules specified to add."
  fi
  add_modules "$@"
}

cmd_rm_modules () {
  source_src_modules
  if (( $# == 0 )); then
    help_and_exit 1 "ERROR: No modules specified to remove."
  fi
  rm_modules "$@"
}

cmd_update_modules () {
  source_src_modules
  if (( $# == 0 )); then
    help_and_exit 1 "ERROR: No modules specified to update."
  fi
  update_modules "$@"
}

cmd_run_modules () {
  log_header
  run_modules "$@"
  log_footer
}

cmd_ls_modules () {
  if (( $# > 0 )); then
    help_and_exit 1 "ERROR: Unknown options for 'ls': $@"
  fi
  if [[ -d "./modules" ]]; then
    echo "$(ls modules)"
  else
    echo ""
  fi
}
