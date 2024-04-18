function upgrade_outdated_deps
  print_with_color brwhite "Attempting to upgrade dependencies..."
  set deps (npm outdated)
  set lines (count $deps)
  set total (math $lines - 1)
  set number_finshed 0

  print_with_color brwhite "$total outdated dependencies."

  for line in $deps[2..]
    upgrade_by_line $line
    set number_finshed (math $number_finshed + 1)
    set percent_complete (math --scale=0 $number_finshed / (math $total / 100))
    print_with_color brwhite "$percent_complete% complete"
    echo \n
  end

  print_upgrade_report
end
