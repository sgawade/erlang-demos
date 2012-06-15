-module(process_ex).
-export([start/0, loop/0]).

start() ->
    Pid = spawn(process_ex, loop, []),
    Pid.

loop() ->
    receive
    {From, write, Text} ->
        From ! io:format("Write Text: ~p~n", [Text]),
        loop();
    {From, sum, N1, N2} ->
        From ! io:format("Sum: ~p~n", [N1 + N2]),
        loop();
    _ ->
        io:format("Error in Pattern Matching~n"),
        loop()
    end. 
