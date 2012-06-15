%% A process whose only job is to keep a counter.
-module(counter).
-export([start/0, codeswitch/1]).

start() -> loop(0).

loop(State) ->
    receive
        {increment, Count} ->
            loop(State+Count);
        print ->
%%            io:format("Added a new line"),
            io:format("State is ~p~n", [State]),
            loop(State);
%%        reset ->
%%            loop(0);
        code_switch ->
            counter:codeswitch(State);
        _ ->
            io:format("Message not handled.~n"),
            loop(State)
    end.

codeswitch(State) -> loop(State).
