#!/bin/bash


# INTERFACE

cmd_modules () {
  command="$1"
  case "$command" in
    help|--help)
      help && exit 0 ;;
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
      echo "ERROR: Unknown command: $command" && help && exit 1 ;;
    esac
}


# COMMANDS

cmd_add_modules () {
  source_src_modules
  if [[ $# -eq 0 ]]; then
    echo "ERROR: No modules specified to add."
    help
    exit 1
  fi
  add_modules "$@"
}

cmd_rm_modules () {
  source_src_modules
  if [[ $# -eq 0 ]]; then
    echo "ERROR: No modules specified to remove."
    help
    exit 1
  fi
  rm_modules "$@"
}

cmd_update_modules () {
  source_src_modules
  if [[ $# -eq 0 ]]; then
    echo "ERROR: No modules specified to update."
    help
    exit 1
  fi
  update_modules "$@"
}

cmd_run_modules () {
  log_header
  run_modules "$@"
  log_footer
}

cmd_ls_modules () {
  if [[ $# -gt 0 ]]; then
    echo "ERROR: Unknown options for 'ls': $@"
    help
    exit 1
  fi
  if [[ -d "./modules" ]]; then
    echo "$(ls modules)"
  else
    echo ""
  fi
}
