-module(case_ex).
-export([test/1, test1/1]).

test(Var) ->
    case Var of
       [hello] -> 
           "its a list";
       {hello} ->
           "its a tuple";
       _ ->
           "Not matched"
    end.

test1(Var) ->
    case Var of
        V when is_list(V) ->
           "its a list";
        V when is_tuple(V) ->
           "its a tuple";
        _ ->
           "Not matched"
    end.
