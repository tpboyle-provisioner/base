#!/bin/bash


# SOURCES

[ -f "./conf.sh" ] && source "./conf.sh"
source "src/logger.sh"


# HELPERS

log_header () {
  info "main" "---- Starting provisioning... ----"
}

log_footer () {
  info "main" "---- ...provisioning complete. ----"
}

run_each_modules_provisioner () {
  for dir in ./modules/*; do
    if [ -d "$dir" ]; then
      "$dir/provision.sh"
    fi
  done
}


# INTERFACE

provision () {
  run_each_modules_provisioner
}




# MAIN

main () {
  log_header
  provision
  log_footer
}

if [[ "${BASH_SOURCE[0]}" == "$0" ]]; then
  main "$@"
fi

