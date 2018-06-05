-module(test_foo).
-include_lib("eunit/include/eunit.hrl").
-include_lib("helpers/include/helpers.hrl").

it_test() ->
    ?assertEqual(true, foo:it()).
