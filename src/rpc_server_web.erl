%% @author Abhay Kumar <abhay@opensynapse.net>
%% @copyright 2008 Abhay Kumar

%% @doc Web server for rpc_server.

-module(rpc_server_web).
-author("Abhay Kumar <abhay@opensynapse.net>").

-export([start/1, stop/0, loop/2]).
-export([rpc_handler/2]).
%% External API

start(Options) ->
    {DocRoot, Options1} = get_option(docroot, Options),
    Loop = fun (Req) ->
                   ?MODULE:loop(Req, DocRoot)
           end,
    mochiweb_http:start([{name, ?MODULE}, {loop, Loop} | Options1]).

stop() ->
    mochiweb_http:stop(?MODULE).

loop(Req, DocRoot) ->
    "/" ++ Path = Req:get(path),
    case {Path, Req:get(method), Req:get_header_value('Content-Type')} of
      {"rpc", 'POST', "application/json"} ->
        mochiweb_rpc:handler(Req, {?MODULE, rpc_handler});
      {_, Method, _} when Method =:= 'GET'; Method =:= 'HEAD' ->
        Req:serve_file(Path, DocRoot);
      {_, 'POST', _} ->
        Req:not_found();
      {_, _, _} ->
        Req:respond({501, [], []})
    end.

%% Internal API

rpc_handler(_Req, {call, Method, Params}) ->
  case Method of
    echo ->
      {array, [Message]} = Params,
      {result, Message};
    _ ->
      {error, "method not implemented."}
  end.

get_option(Option, Options) ->
    {proplists:get_value(Option, Options), proplists:delete(Option, Options)}.
