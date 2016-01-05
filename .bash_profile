# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH"

# Add ant home...
export ANT_HOME=$HOME/was.build/apache-ant-1.8.4/
export PATH=$PATH:~/was.build/apache-ant-1.8.4/bin:/usr/share/apache-maven-3.3.3/bin
# add Mongodb
export PATH=$PATH:~/Runtimes/mongodb/bin
export PATH=$PATH:~/Library/Android/sdk/platform-tools:~/Library/Android/sdk/tools

# set java home
export JAVA_HOME=$(/usr/libexec/java_home)

set -o vi

# Load the shell dotfiles, and then some:
# * ~/.extra can be used for other settings you don’t want to commit.

for file in ~/.{bash_prompt,aliases,extra,liberty}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Append to the Bash history file, rather than overwriting it
shopt -s histappend

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
	shopt -s "$option" 2> /dev/null
done

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2 | tr ' ' '\n')" scp sftp ssh

# Add tab completion for `defaults read|write NSGlobalDomain`
# You could just use `-g` instead, but I like being explicit
complete -W "NSGlobalDomain" defaults

# Add `killall` tab completion for common apps
complete -o "nospace" -W "Contacts Calendar Dock Finder Mail Safari iTunes SystemUIServer Terminal Twitter" killall

if [ -f ~/bin/git-completion.bash ]; then
    . ~/bin/git-completion.bash
fi

# If possible, add tab completion for many more commands
[ -f /etc/bash_completion ] && source /etc/bash_completion
