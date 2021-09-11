# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

unset rc

# Aliases
alias po="systemctl poweroff"
alias re="systemctl reboot"
alias te="toolbox enter"
alias tm="tmux"
alias ls="exa --classify"
alias la="exa --classify -la"
alias tree="exa --tree"
alias cat="bat"
alias grep="rg"
alias ydl="youtube-dl"

# Prompt
eval "$(starship init bash)"
