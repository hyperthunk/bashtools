#!/usr/bin/env escript

main([M, F, A]) ->
	case code:which(M) of
		non_existing ->
			io:format("", []);
		BinPath ->
			process(M,F,A)
	end.

process(M,F,A) ->
	Info = M:module_info(),
	
