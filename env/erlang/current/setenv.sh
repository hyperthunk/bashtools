
export ERL_ROOT=$ERL_TOP/Current
export ERL_LIBS=$ERL_TOP/Site
export MANPATH=$ERL_ROOT/man:$MANPATH
export PARSE_TRANS_ROOT="$ERL_LIBS/parse_trans"
alias erl_pp='escript $PARSE_TRANS_ROOT/ebin/parse_trans_pp.beam'
