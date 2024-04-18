function cnamediff
  set head_commits (git log --pretty=format:'%Creset%s' $argv[1]..$argv[2])
  set base_commits (git log --pretty=format:'%Creset%s' $argv[2]..$argv[1])

  print_with_color brwhite "In $argv[2] but not in $argv[1]"
  if test (count $head_commits) -eq 0
    echo - none -
  else
    for line in $head_commits
      if not contains $line $base_commits
        print_with_color red $line
      end
    end
  end

  print_with_color brwhite "In $argv[1] but not in $argv[2]"
  if test (count $base_commits) -eq 0
    echo - none -
  else
    for line in $base_commits
      if not contains $line $head_commits
        print_with_color green $line
      end
    end
  end
end