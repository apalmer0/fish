function print_upgrade_report
  set deps (npm outdated)
  set -l names

  for line in $deps[2..]
    string split -n ' ' $line | read -L dep current wanted latest
    set -a names $dep
  end

  if test (count $names) -eq 0
    print_with_color brwhite "All dependecies successfully upgraded."
  else
    print_with_color brwhite "Failed to update the following dependencies:"
    for name in $names
      print_with_color red $name
    end
  end
end
