-module(tail_r_list).


sum() ->
    L = [1,2,3,4,5,6],
    sum(L, 0).

sum([], Acc) ->
    Acc;

sum([H|T], Acc) ->
    sum(T, Acc + H).
