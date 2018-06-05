-module(test_foo).
-include_lib("eunit/include/eunit.hrl").

it_test() ->
    ?assertEqual(true, foo:it()).
