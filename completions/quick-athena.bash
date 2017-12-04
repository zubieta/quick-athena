_quick-athena() {
  COMPREPLY=()
  local word="${COMP_WORDS[COMP_CWORD]}"

  if [ "$COMP_CWORD" -eq 1 ]; then
    COMPREPLY=( $(compgen -W "$(quick-athena commands)" -- "$word") )
  else
    local command="${COMP_WORDS[1]}"
    local completions="$(quick-athena completions "$command")"
    COMPREPLY=( $(compgen -W "$completions" -- "$word") )
  fi
}

complete -F _quick-athena quick-athena
