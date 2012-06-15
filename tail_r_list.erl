-module(tail_r_list).


start() ->
    sum(L, 0).

sum([H|T], Acc) ->
    sum(T, Acc + H);

sum([], Acc) ->
    Acc.
