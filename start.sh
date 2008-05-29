#!/bin/sh
cd `dirname $0`
exec erl +Bc +K true -smp auto -pa $PWD/ebin $PWD/deps/*/ebin -boot start_sasl -name rpc_server -config conf/rpc_server -s rpc_server
