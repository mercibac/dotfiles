HOME=/c/Users/Merci_Bacman
export MSYS=winsymlinks:nativestrict
export STARSHIP_CONFIG=$HOME/.config/starship/starship-bash.toml

alias ls='ls -F --color=auto --show-control-chars'
alias ll='ls -l'
alias z='zoxide'
alias cls='clear'
alias c='clear'

eval "$(zoxide init bash)"
eval "$(starship init bash)"
