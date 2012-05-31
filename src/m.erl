-module(m).
-export([m/0]).

zip(_, [], []) -> [];
zip(Func, [Head1|Tail1], [Head2|Tail2]) ->
	[Func(Head1, Head2)|zip(Func, Tail1, Tail2)].

m() -> filter1(zip(fun(X,Y) -> {sum, X + Y} end, [1,2,3], [10,20,30])).

filter([]) -> [];
filter([{sum, N}|Tail]) when N > 20 -> [{ok, N}|filter(Tail)];
filter([_|Tail]) -> [{false}|filter(Tail)].

filter1([Head|Tail]) -> 
	case Head of
		{_, N} when N > 20 -> [{ok, N}|filter(Tail)];
		{_, N} -> [{false, N}|filter(Tail)]
	end.
