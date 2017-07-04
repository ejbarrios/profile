export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
export DOTNET_CLI_TELEMETRY_OPTOUT=1
export EDITOR=`which micro`

alias la='ls -GFhla'
alias ll='ls -GFhl'
alias ls='ls -GFh'

#ruby init
export PATH="$HOME/.rbenv/bin:$PATH"
if command -v rbenv > /dev/null; then
    eval "$(rbenv init -)";
fi

if command -v aws_completer; then
    eval "$(complete -C `which aws_completer` aws)";
fi

#pyenv init
export PATH="$HOME/.pyenv/bin:$PATH"
if command -v pyenv > /dev/null; then
	eval "$(pyenv init -)"
	#eval "$(pyenv virtualenv-init -)"
fi


unset file;

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;

# Append to the Bash history file, rather than overwriting it
shopt -s histappend;

# Autocorrect typos in path names when using `cd`
shopt -s cdspell;


# Add tab completion for many Bash commands
if which brew &> /dev/null && [ -f "$(brew --prefix)/share/bash-completion/bash_completion" ]; then
    source "$(brew --prefix)/share/bash-completion/bash_completion";
elif [ -f /etc/bash_completion ]; then
    source /etc/bash_completion;
fi;

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2- | tr ' ' '\n')" scp sftp ssh;
