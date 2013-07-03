
export ERL_ROOT=$ERL_TOP/Current
export ERL_LIBS=$ERL_TOP/Site
export MANPATH=$ERL_ROOT/man:$MANPATH
export PARSE_TRANS_ROOT="$ERL_LIBS/parse_trans"

# evm environment
EVM_HOME="$HOME/Library/Erlang"
test -e "$HOME/.evmrc" && source "$HOME/.evmrc"
export PATH="$EVM_HOME/Current/tools/bin:$EVM_HOME/Current/erl_interface/bin:$PATH"

alias erl_pp='escript $PARSE_TRANS_ROOT/ebin/parse_trans_pp.beam'
