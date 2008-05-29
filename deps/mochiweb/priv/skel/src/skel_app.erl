%% @author Abhay Kumar <abhay@opensynapse.net>
%% @copyright 2008 Abhay Kumar

%% @doc Callbacks for the skel application.

-module(skel_app).
-author("Abhay Kumar <abhay@opensynapse.net>").

-behaviour(application).
-export([start/2,stop/1]).


%% @spec start(_Type, _StartArgs) -> ServerRet
%% @doc application start callback for skel.
start(_Type, _StartArgs) ->
    skel_deps:ensure(),
    skel_sup:start_link().

%% @spec stop(_State) -> ServerRet
%% @doc application stop callback for skel.
stop(_State) ->
    ok.
