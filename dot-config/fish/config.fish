if status is-interactive
    # Commands to run in interactive sessions can go here
    # Aliases
    #alias ls='ls --color'
    #alias ll='ls -l'
    #alias la='ls -la'
    alias ls='lsd'
    alias ll='ls -l'
    alias la='ls -a'
    alias lla='ls -la'
    alias lt='ls --tree'
    alias rm='rm -i'
    alias fzf="fzf --style full --color=dark --preview='bat -n --color=always {}'"

    fzf --fish | source
    starship init fish | source
end
