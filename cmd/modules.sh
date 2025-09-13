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
    conf)
      shift && cmd_conf_modules "$@" && exit 0 ;;
    *)
      help_and_exit 1 "ERROR: Unknown command: $command" ;;
    esac
}


# COMMANDS

cmd_add_modules () {
  source_src_modules
  (( $# == 0 )) && \
    help_and_exit 1 "ERROR: No modules specified to add."
  add_modules "$@"
}

cmd_rm_modules () {
  source_src_modules
  (( $# == 0 )) && \
    help_and_exit 1 "ERROR: No modules specified to remove."
  rm_modules "$@"
}

cmd_update_modules () {
  source_src_modules
  update_modules "$@"
}

cmd_run_modules () {
  source_src_modules
  run_modules "$@"
}

cmd_ls_modules () {
  (( $# > 0 )) && \
    help_and_exit 1 "ERROR: Unknown options for 'ls': $@"
  if [[ -d "./modules" ]]; then
    echo "$(ls modules)"
  else
    echo ""
  fi
}

cmd_conf_modules () {
  source_src_modules
  (( $# == 0 )) && \
    help_and_exit 1 "ERROR: No modules specified to configure."
  conf_modules "$@"
}
