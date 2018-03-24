%%%-------------------------------------------------------------------
%% @doc caffeine public API
%% @end
%%%-------------------------------------------------------------------

-module(caffeine_app).

-behaviour(application).

%% Application callbacks
-export([start/2, stop/1]).

%%====================================================================
%% API
%%====================================================================
%%
%%start(_StartType, _StartArgs) ->
%%    {ok, Pid} = 'caffeine_sup':start_link(),
%%    Routes = [ {
%%        '_',
%%        [
%%            {"/", caffeine_root, []}
%%        ]
%%    } ],
%%    Dispatch = cowboy_router:compile(Routes),
%%
%%    NumAcceptors = 10,
%%    TransOpts = [ {ip, {0,0,0,0}}, {port, 2938} ],
%%    ProtoOpts = [{env, [{dispatch, Dispatch}]}],
%%
%%    {ok, _} = cowboy:start_http(chicken_poo_poo,
%%        NumAcceptors, TransOpts, ProtoOpts),
%%
%%    {ok, Pid}.

%%start(_Type, _Args) ->
start(_StartType, _StartArgs) ->
  {ok, Pid} = 'caffeine_sup':start_link(),
  Routes = [{
    '_',
    [
      {"/", toppage_handler, []},
      {"/caffeine", caffeine_root, []}
    ]
  }],

  Dispatch = cowboy_router:compile(Routes),
  NumAcceptors = 10,
  TransOpts = [{ip, {0, 0, 0, 0}}, {port, 2938}],
  ProtoOpts = [{env, [{dispatch, Dispatch}]}],

  {ok, _} = cowboy:start_http(chicken_poo_poo,
    NumAcceptors, TransOpts, ProtoOpts),

  {ok, Pid}.


%%--------------------------------------------------------------------
stop(_State) ->
  ok.

%%====================================================================
%% Internal functions
%%====================================================================
