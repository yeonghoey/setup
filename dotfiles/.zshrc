# .localrc
if [[ -f "$HOME/.localrc" ]]; then
  source "$HOME/.localrc"
fi

if [[ -f "$HOME/.localrc.zsh" ]]; then
  source "$HOME/.localrc.zsh"
fi

# oh-my-zsh
if [[ "$ZSH" ]]; then
  # 'oh-my-zsh' configs are falsely considered unused.
  # Disable unused check.

  # shellcheck disable=SC2034
  #                      └─ unused check
  ZSH_THEME='afowler'

  # shellcheck disable=SC2034
  plugins=(
    git
    colorize
    osx
    zsh-navigation-tools
    zsh-completions
  )
  source "$ZSH/oh-my-zsh.sh"
fi

# Ensure compinit
autoload -U compinit && compinit
