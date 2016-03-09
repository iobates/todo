-module(todo_list).
-import(misc, [nth/2]).
-export([add_item/2, add_item/1, element_in_list/3, insert_item_at/3, take/2, take/3, 
			drop/2, todo/1, todo/2, main/1, present/1, first_item/0]).

-record(item, {title,
				  description}).

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

insert_item_at([], List, _) -> [List];
insert_item_at(I, [], _) -> [I];
insert_item_at(Item, List, Pos) ->
	 Nlist = drop(Pos-1, List),
	 M = take(Pos-1, List),
	 lists:flatten(lists:append([M], lists:append([Item], Nlist))).

take(N, List) ->
	 take(N,List,[]).
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

main(List) ->
	 Title = io:get_line("Please enter your Title for your Todo item: "),
	 Desc = io:get_line("Please enter your Description for your Todo item: "),
	 C = io:get_line("Enter another item?"),
	 if
		  C =:= "no\n" ->
				lists:append(List, {Title, Desc, []});
		  true ->
				main(insert_item_at({Title, Desc, []}, List, 1))
	 end.	 

present(Item) ->
	 {Title, Desc, _} = Item,
	 io:format("Title: ~p~nDescription:~n~p~n", [Title, Desc]).

first_item() ->
	 #item{title="Chess video for youtube", description="Make a video for youtube about the Ruy Lopez variation 3.-Nge7"}.

make_item(Title, Desc) ->
	 #item{title = Title, description = Desc}.
