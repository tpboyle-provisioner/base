#!/bin/bash

# ROOT DIR

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"


# CONFIG

SRC_DIR="$ROOT_DIR/src"
SRC_URL="https://github.com/tpboyle-provisioner/src.git"


# SOURCES

source "./conf.sh"
source "$SRC_DIR/logger.sh"
source "$SRC_DIR/modules.sh"


# HELPERS

log_header () {
  info "main" "---- Starting provisioning... ----"
}

log_footer () {
  info "main" "---- ...provisioning complete. ----"
}

update_src () {
  if [[ -d "$SRC_DIR" ]]; then
    cd "$SRC_DIR"
    git pull &> /dev/null
    cd - &> /dev/null
  else
    git clone "$SRC_URL" "$SRC_DIR"
  fi
}

run_each_modules_provisioner () {
  for dir in ./modules/*; do
    if [ -f "$dir/provision.sh" ]; then
      info "main" "Running provisioner for module: $(basename "$dir")"
      "$dir/provision.sh"
    else
      warn "main" "No provisioner found for module: $(basename "$dir")"
      continue
    fi
  done
}


# INTERFACE

provision () {
  update_modules "$@"
  run_each_modules_provisioner
}


# MAIN

main () {
  update_src
  if [[ ! -d "$SRC_DIR" || ! -f "$SRC_DIR/modules.sh" ]]; then
    echo "Could not find the src/ directory!"
    return 1
  fi
  log_header
  provision "$@"
  log_footer
}

if [[ "${BASH_SOURCE[0]}" == "$0" ]]; then
  main "$@"
fi

