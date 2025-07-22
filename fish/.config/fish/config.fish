if status is-interactive
    function fish_greeting
	fastfetch
    end

    # Format man pages
    set -x MANROFFOPT "-c"
    set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"

    ## Environment setup
    # Apply .profile: use this to put fish compatible .profile stuff in
    if test -f ~/.fish_profile
	source ~/.fish_profile
    end

    # Add ~/.local/bin to PATH
    if test -d ~/.local/bin
	if not contains -- ~/.local/bin $PATH
	    set -p PATH ~/.local/bin
	end
    end

    ## Functions
    # Functions needed for !! and !$ https://github.com/oh-my-fish/plugin-bang-bang
    function __history_previous_command
	switch (commandline -t)
	case "!"
	    commandline -t $history[1]; commandline -f repaint
	case "*"
	    commandline -i !
	end
    end

    function __history_previous_command_arguments
	switch (commandline -t)
	case "!"
	    commandline -t ""
	    commandline -f history-token-search-backward
	case "*"
	    commandline -i '$'
	end
    end

    # Fish command history
    function history
	builtin history --show-time='%F %T '
    end

    function backup --argument filename
	cp $filename $filename.bak
    end

    # Copy DIR1 DIR2
    function copy
	set count (count $argv | tr -d \n)
	if test "$count" = 2; and test -d "$argv[1]"
            set from (echo $argv[1] | trim-right /)
	    set to (echo $argv[2])
	    command cp -r $from $to
	else
	    command cp $argv
	end
    end

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

    alias fixpacman="sudo rm /var/lib/pacman/db.lck"
    alias tarnow='tar -acf '
    alias untar='tar -zxvf '
    alias ..='cd ..'
    alias ...='cd ../..'
    alias grep='grep --color=auto'
    alias update='sudo pacman -Syu'
    alias cleanup='sudo pacman -Rns (pacman -Qtdq)'
    alias jctl="journalctl -p 3 -xb"

    fzf --fish | source
    starship init fish | source
end
