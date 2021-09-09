# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
