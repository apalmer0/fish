function cdiff
  set added (git log --pretty=format:'%C(yellow)%h %Cred%ad %Cgreen%an | %Creset%s' --date=relative $argv[1]..$argv[2])
  set missing (git log --pretty=format:'%C(yellow)%h %Cred%ad %Cgreen%an | %Creset%s' --date=relative $argv[2]..$argv[1])
  print_with_color brwhite "In $argv[2] but not in $argv[1]"

  if test (count $added) -eq 0
    echo - none -
  else
    # echo $added
    git log --pretty=format:'%C(yellow)%h %Cred%ad %Cgreen%an | %Creset%s' --date=relative $argv[1]..$argv[2]
  end

  print_with_color brwhite "In $argv[1] but not in $argv[2]"
  if test (count $missing) -eq 0
    echo - none -
  else
    # echo $missing
    git log --pretty=format:'%C(yellow)%h %Cred%ad %Cgreen%an | %Creset%s' --date=relative $argv[2]..$argv[1]
  end
end
