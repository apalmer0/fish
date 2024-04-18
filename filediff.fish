function filediff
  echo File differences between head and $argv[1]
  git diff --stat $argv[1]..head
end
