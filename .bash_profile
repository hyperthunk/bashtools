source ~/.bashrc;
source ~/.bash/setenv.sh;

echo -e "Kernel Information: " `uname -smr`
echo -e "${COLOR_BROWN}`bash --version`"
echo -ne "${COLOR_GRAY}Uptime: "; uptime
echo -ne "${COLOR_GRAY}Server time is: "; date	

export TERM=xterm-color
export GREP_OPTIONS='--color=auto' GREP_COLOR='1;32'
export CLICOLOR=1;
alias ls='ls -G'

export COLOR_NC='\e[0m' # No Color
export COLOR_WHITE='\e[1;37m'
export COLOR_BLACK='\e[0;30m'
export COLOR_BLUE='\e[0;34m'
export COLOR_LIGHT_BLUE='\e[1;34m'
export COLOR_GREEN='\e[0;32m'
export COLOR_LIGHT_GREEN='\e[1;32m'
export COLOR_CYAN='\e[0;36m'
export COLOR_LIGHT_CYAN='\e[1;36m'
export COLOR_RED='\e[0;31m'
export COLOR_LIGHT_RED='\e[1;31m'
export COLOR_PURPLE='\e[0;35m'
export COLOR_LIGHT_PURPLE='\e[1;35m'
export COLOR_BROWN='\e[0;33m'
export COLOR_YELLOW='\e[1;33m'
export COLOR_GRAY='\e[0;30m'
export COLOR_LIGHT_GRAY='\e[0;37m'
alias colorslist="set | egrep 'COLOR_\w*'"  # lists all the colors

# OPEN new tab in current directory.
# nuke stale .last_cwd files.
cd
for I in .last_cwd_* ; do
    [ -r "$I" ] && ( kill -0 ${I#.last_cwd_} || rm $I ) 2> /dev/null
done

# find youngest viable last_cwd and change there
L="`ls -1tr .last_cwd_* 2> /dev/null | tail -1`"

[ ! -z "$L" -a -r "$L" ] && cd "`cat $L`"

# set up PS1
# export PS1='h:w u$ `echo w > ~/.last_cwd_$$`'

if [ ! -f ~/.dirs ]; then  # if doesn't exist, create it
	touch ~/.dirs
fi

alias show='cat ~/.dirs'
save (){
	command sed "/!$/d" ~/.dirs > ~/.dirs1; \mv ~/.dirs1 ~/.dirs; echo "$@"=\"`pwd`\" >> ~/.dirs; source ~/.dirs ; 
}
source ~/.dirs  # Initialization for the above 'save' facility: source the .sdirs file
shopt -s cdable_vars # set the bash option so that no '$' is required when using the above facility

export HISTCONTROL=ignoredups # Ignores dupes in the history
shopt -s checkwinsize # After each command, checks the windows size and changes lines and columns

# bash completion settings (actually, these are readline settings)
bind "set completion-ignore-case on" # note: bind is used instead of setting these in .inputrc.  This ignores case in bash completion
bind "set bell-style none" # No bell, because it's damn annoying
bind "set show-all-if-ambiguous On" # this allows you to automatically show completion without double tab-ing

# Turn on advanced bash completion if the file exists (get it here: http://www.caliban.org/bash/index.shtml#completion)
if [ -f /opt/local/etc/bash_completion ]; then
    . /opt/local/etc/bash_completion
fi

alias switch_java='source ~/.bash/utilities/switch_java_version '
alias git_changes='source ~/.bash/utilities/git_changes '
alias gem_proxy='--http-proxy=$HTTP_PROXY '
alias term='~/.bash/utilities/term '


##
# Your previous /Users/t4/.bash_profile file was backed up as /Users/t4/.bash_profile.macports-saved_2010-01-02_at_17:27:49
##

# MacPorts Installer addition on 2010-01-02_at_17:27:49: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

# bash completion for rebar

_rebar()
{
    local cur prev sopts lopts cmdsnvars
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    sopts="-h -c -v -V -f -j"
    lopts=" --help --commands --verbose --force --jobs= --version"
    cmdsnvars="analyze build_plt check_plt check-deps clean compile \
        create create-app create-node doc delete-deps eunit \
        get-deps generate help install int_test perf_test test \
        version xref \
        case= force=1 jobs= suite= verbose=1 appid= target= template= \
        skip_deps=1"

    if [[ ${cur} == --* ]] ; then
        COMPREPLY=( $(compgen -W "${lopts}" -- ${cur}) )
    elif [[ ${cur} == -* ]] ; then
        COMPREPLY=( $(compgen -W "${sopts}" -- ${cur}) )
    else
        COMPREPLY=( $(compgen -W "${cmdsnvars}" -- ${cur}) )
    fi

    if [ -n "$COMPREPLY" ] ; then
        # append space if matched
        COMPREPLY="${COMPREPLY} "
        # remove trailing space after equal sign
        COMPREPLY=${COMPREPLY/%= /=}
    fi
    return 0
}
complete -o nospace -F _rebar rebar

# Local variables:
# mode: shell-script
# sh-basic-offset: 4
# sh-indent-comment: t
# indent-tabs-mode: nil
# End:
# ex: ts=4 sw=4 et filetype=sh

##
# Your previous /Users/t4/.bash_profile file was backed up as /Users/t4/.bash_profile.macports-saved_2010-07-08_at_21:29:30
##

# MacPorts Installer addition on 2010-07-08_at_21:29:30: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

