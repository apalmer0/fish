function upgrade_dep
  set -l dep $argv[1]
  set -l current $argv[2]
  set -l wanted $argv[3]

  if test -z "$current"
    if test -z "$wanted"
      print_with_color brwhite "No version numbers provided, looking them up..."
      npm outdated | grep node_modules/$dep | string split -n ' ' | read -L dep current wanted latest
    end
  end

  print_with_color brwhite "Dependency:      $dep"
  print_with_color brwhite "Current version: $current"
  print_with_color brwhite "Wanted version:  $wanted"
  
  if test $current = $wanted
    print_with_color brwhite "No upgrade needed, skipping."
  else
    string join " " Upgrade $dep from $current to $wanted | read commit_msg

    echo \n
    print_with_color brwhite "Attempting: $commit_msg"
    echo \n
    yarn upgrade $dep > /dev/null

    echo \n
    print_with_color brwhite "Upgrade finished, testing..."
    echo \n
    if not_borked
      print_with_color green "Upgraded $dep successfully, committing..."
      git add . && git commit -m $commit_msg
    else
      undo_upgrade

      if not_borked
        echo \n
        print_with_color brwhite "Reverted to working state."
        print_with_color brwhite "Upgrading $dep will require manual intervention."
      end
    end
  end
end

function not_borked
  yarn check-all; and gatsby build
end