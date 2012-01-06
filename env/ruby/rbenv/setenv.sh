export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="/Users/t4/.rbenv/shims:${PATH}"
source "/Users/t4/.rbenv/libexec/../completions/rbenv.bash"
rbenv rehash 2>/dev/null
rbenv() {
  command="$1"
  if [ "$#" -gt 0 ]; then
    shift
  fi

  case "$command" in
  shell)
    eval `rbenv "sh-$command" "$@"`;;
  *)
    command rbenv "$command" "$@";;
  esac
}
