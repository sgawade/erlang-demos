-module(mod_example).

-behaviour(gen_server).
-export([
         start_link/1,
         stop/0,
         update/1,
         get_current/0
        ]).

%% gen_server callbacks
-export([init/1, handle_call/3, handle_cast/2, handle_info/2, terminate/2, code_change/3]).
-record(state, {current_number}).

%%%================================================================
%%% API
%%%================================================================
start_link(Args) ->
    gen_server:start_link({local, ?MODULE}, ?MODULE, Args, []).

stop() ->
    gen_server:call(?MODULE, stop).

update(Number) when is_integer(Number) ->
    gen_server:cast(?MODULE, {update_number, Number}).

get_current() ->
    gen_server:call(?MODULE, {get_current}).

%%%===================================================================
%%% gen_server callbacks
%%%===================================================================
init(_Args) ->
    process_flag(trap_exit, true),
    {ok, #state{current_number=0}}.

handle_call({get_current}, _From, State) ->
    Reply = State#state.current_number,
    {reply, Reply, State};

handle_call(stop, _From, State) ->
    {stop, normal, stopped, State};

handle_call(Message, _From, State) ->
    {stop, {unknown_call, Message}, State}.

handle_cast({update_number, Number}, State) ->
    {noreply, State#state{current_number=Number}};

handle_cast(Message, State) ->
    {stop, {unknown_cast, Message}, State}.

handle_info(_Info, State) ->
    {noreply, State}.

terminate(_Reason, _State) ->
    ok.

code_change(_OldVsn, State, _Extra) ->
    {ok, State}.
