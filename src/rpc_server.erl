%% @author Abhay Kumar <abhay@opensynapse.net>
%% @copyright 2008 Abhay Kumar

%% @doc TEMPLATE.

-module(rpc_server).
-author("Abhay Kumar <abhay@opensynapse.net>").
-export([start/0, stop/0]).

ensure_started(App) ->
    case application:start(App) of
        ok ->
            ok;
        {error, {already_started, App}} ->
            ok
    end.
        
%% @spec start() -> ok
%% @doc Start the rpc_server server.
start() ->
    rpc_server_deps:ensure(),
    ensure_started(crypto),
    application:start(rpc_server).

%% @spec stop() -> ok
%% @doc Stop the rpc_server server.
stop() ->
    Res = application:stop(rpc_server),
    application:stop(crypto),
    Res.
