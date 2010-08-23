export ERL_ROOT=$ERL_TOP/Current
export ERL_LIBS=$ERL_TOP/Site
export MANPATH=$ERL_ROOT/man:$MANPATH
export PATH=$ERL_ROOT/bin:$PATH
alias rebar='env ERL_LIBS="./deps:$ERL_LIBS" $HOME/bin/rebar.escript skip_deps=true $1'

