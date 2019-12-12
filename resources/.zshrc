autoload -Uz compinit
compinit

# enable autocorrect
setopt correct


# key bindings
bindkey "^[[3~" delete-char


# set powerlevel10k theme and associated config
source ~/.zsh/themes/powerlevel10k/powerlevel10k.zsh-theme
# run `p10k configure` or edit ~/.p10k.zsh
[[ ! -f ~/.zsh/themes/powerlevel10k/.p10k.zsh ]] || source ~/.zsh/themes/powerlevel10k/.p10k.zsh


# enable autocomplete
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh


# enable iTerm2 shell integration
source ~/.iterm2_shell_integration.zsh


# exports
export PATH=/usr/local/bin:$PATH

export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=50000
export SAVEHIST=10000

export GOPATH="${HOME}/go"
export GOROOT="$(brew --prefix golang)/libexec"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"

export GPG_TTY=$(tty)

# autocomplete
source <(kubectl completion zsh)

# aliases
alias kctl=kubectl

