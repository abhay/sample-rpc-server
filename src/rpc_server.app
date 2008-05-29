{application, rpc_server,
 [{description, "rpc_server"},
  {vsn, "0.01"},
  {modules, [
    jsonrpc,
    rpc_server,
    rpc_server_app,
    rpc_server_sup,
    rpc_server_web,
    rpc_server_deps
  ]},
  {registered, []},
  {mod, {rpc_server_app, []}},
  {env, []},
  {applications, [kernel, stdlib, crypto]}]}.
