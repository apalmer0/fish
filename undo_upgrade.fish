function undo_upgrade
  print_with_color red "Upgrade failed, rolling back..."
  echo \n

  print_with_color red "Cleaning gatsby files..."
  gatsby clean > /dev/null
  print_with_color white "Done."
  echo \n

  print_with_color red "Reverting changes to lockfile..."
  git co -- yarn.lock
  print_with_color white "Done."
  echo \n 

  print_with_color red "Deleting node_modules..."
  rm -rf node_modules/
  print_with_color white "Done."
  echo \n

  print_with_color red "Reinstalling dependencies..."
  yarn > /dev/null
  print_with_color white "Done."
  echo \n
end