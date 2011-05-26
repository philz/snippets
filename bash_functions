function notify {
  "$@"
  if [[ $? -eq 0 ]]; then
    notify-send Success "$*"
  else
    notify-send Failure "$*"
  fi
}
