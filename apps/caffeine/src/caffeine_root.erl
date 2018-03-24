%%%-------------------------------------------------------------------
%%% @author mukthara
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 21. Mar 2018 3:53 PM
%%%-------------------------------------------------------------------
-module(caffeine_root).
-author("mukthara").

%% API
-export([init/2]).


init(Req, Opts) ->
  Req2 = cowboy_req:reply(200,
    [{<<"content-type">>, <<"text/plain">>}],
    <<"Hello Erlang!">>,
    Req),
  {ok, Req2, Opts}.