-module(tail_r_list).


sum() ->
    L = lists:seq(1, 10),
    sum(L, 0).

sum([H|T], Acc) ->
    sum(T, Acc + H);

sum([], Acc) ->
    Acc.
