%% @author Abhay Kumar <abhay@opensynapse.net>
%% @copyright 2008 Abhay Kumar

%% @doc Callbacks for the rpc_server application.

-module(rpc_server_app).
-author("Abhay Kumar <abhay@opensynapse.net>").

-behaviour(application).
-export([start/2,stop/1]).


%% @spec start(_Type, _StartArgs) -> ServerRet
%% @doc application start callback for rpc_server.
start(_Type, _StartArgs) ->
    rpc_server_deps:ensure(),
    rpc_server_sup:start_link().

%% @spec stop(_State) -> ServerRet
%% @doc application stop callback for rpc_server.
stop(_State) ->
    ok.
