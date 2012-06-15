-module(fact_t).
-export([fact/1]).

fact(N) ->
    fact(N, 1).

fact(0, Acc) ->
    Acc;

fact(N, Acc) when N > 0 ->
    NewAcc = N * Acc,
    fact(N-1, NewAcc).
