if [[ ! -o interactive ]]; then
    return
fi

compctl -K _quick-athena quick-athena

_quick-athena() {
  local word words completions
  read -cA words
  word="${words[2]}"

  if [ "${#words}" -eq 2 ]; then
    completions="$(quick-athena commands)"
  else
    completions="$(quick-athena completions "${word}")"
  fi

  reply=("${(ps:\n:)completions}")
}
