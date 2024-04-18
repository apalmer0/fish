function upgrade_by_line
  set -l line $argv[1]

  string split -n ' ' $line | read -L dep current wanted latest

  upgrade_dep $dep $current $wanted
end