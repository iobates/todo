-module(misc).
-export([nth/2]).

nth(_, [I]) -> I;
nth(_, []) -> [];
nth(2, List) -> 
	 [_|B] = List,
	 B;
nth(Pos,  List) ->
	 [_|B] = List,
	 nth(Pos-1, B).
