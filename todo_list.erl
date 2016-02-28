-module(todo_list).
-export([add_item/2, add_item/1, element_in_list/3, insert_item_at/3, take/2, take/3, drop/2, todo/1, todo/2]).

add_item(Item) ->
	 [Item].
add_item(Item, List) ->
	 lists:append([Item], List).

element_in_list(Item, List, N) ->
	 [A|B] = List,
	 if 
		  A =:= Item ->
				N+1;
		  true ->
				element_in_list(Item, B, (N+1))
	 end.

insert_item_at([], List, _) -> List;
insert_item_at(I, [], _) -> [I];
insert_item_at(Item, List, Pos) ->
	 Nlist = drop(Pos-1, List),
	 M = take(Pos-1, List),
	 lists:flatten(lists:append([M], lists:append([Item], Nlist))).

take(N, List) ->
	 take(N,List,[]).
take(_, [], L) -> L;
take(0, _, L) -> L;
take(N, List, L) ->
	 [A|B] = List,
	 take(N-1, B, lists:append(L, [A])).
	 
drop(_, []) -> [];
drop(0, List) -> List;
drop(N, List) ->
	 [_|B] = List,
	 drop(N-1, B).

todo(Item) ->
	 todo(Item, []).

todo(Item, List) ->
	 lists:append(List, [Item]).
