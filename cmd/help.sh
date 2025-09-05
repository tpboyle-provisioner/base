
help () {
  cat << EOF

USAGE:
    $0 [COMMAND] [MODULES]

COMMANDS:
    help|--help               Show this message
    add <MODULES>             Add one or more modules
    rm <MODULES>              Remove one or more modules
    update [MODULES]          Update one or more modules
                                (omit to update all modules)
    run [MODULES]             Run provisioner for one or more modules
                                (omit to run all modules)
    ls                        List all available modules
    remote
      ls                      List all available remote modules
    src
      update                  Update the src/ directory
      version                 Show the current version of the src/ directory
EOF
}

help_and_exit () {
  msg="$1"
  echo "$msg"
  help
  exit 1
}
