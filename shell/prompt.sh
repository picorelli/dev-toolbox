# Minimal zsh prompt with git branch and exit code

_git_branch() {
  git symbolic-ref --short HEAD 2>/dev/null
}

_exit_code() {
  local code=$?
  [ $code -ne 0 ] && echo " %F{red}[$code]%f"
}

setopt PROMPT_SUBST
PROMPT='%F{cyan}%~%f%F{yellow}$(_git_branch_prompt)%f$(_exit_code) %F{white}❯%f '

_git_branch_prompt() {
  local branch
  branch=$(_git_branch)
  [ -n "$branch" ] && echo " ($branch)"
}
