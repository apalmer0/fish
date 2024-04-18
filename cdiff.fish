# Defined in /Users/andrewpalmer/.config/fish/functions/cdiff.fish @ line 1
function cdiff
  echo In $argv[2] but not in $argv[1]:
  git log --pretty=format:'%C(yellow)%h %Cred%ad %Cgreen%an | %Creset%s' --date=relative $argv[1]..$argv[2]
  echo In $argv[1] but not in $argv[2]:
  git log --pretty=format:'%C(yellow)%h %Cred%ad %Cgreen%an | %Creset%s' --date=relative $argv[2]..$argv[1]
end
