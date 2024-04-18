function print_with_color
  set -l color $argv[1]
  set -l message $argv[2]
  set_color $color
  echo $message
  set_color normal
end