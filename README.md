## `make` works fine

```
roger@roger-pc:~/Source/rlipscombe/erlang-mk-eunit-bug [master] $ make
make[1]: Entering directory '/home/roger/Source/rlipscombe/erlang-mk-eunit-bug/apps/foo'
 GEN    clean-app
 GEN    clean-test-dir
 GEN    coverdata-clean
 DEPEND foo.d
 ERLC   foo.erl
 APP    foo
make[1]: Leaving directory '/home/roger/Source/rlipscombe/erlang-mk-eunit-bug/apps/foo'
make[1]: Entering directory '/home/roger/Source/rlipscombe/erlang-mk-eunit-bug/apps/helpers'
make[1]: Leaving directory '/home/roger/Source/rlipscombe/erlang-mk-eunit-bug/apps/helpers'
```

## `make eunit` works fine

```
roger@roger-pc:~/Source/rlipscombe/erlang-mk-eunit-bug [master] $ make eunit
make[1]: Entering directory '/home/roger/Source/rlipscombe/erlang-mk-eunit-bug/apps/foo'
 GEN    clean-app
 GEN    coverdata-clean
make[1]: Leaving directory '/home/roger/Source/rlipscombe/erlang-mk-eunit-bug/apps/foo'
make[1]: Entering directory '/home/roger/Source/rlipscombe/erlang-mk-eunit-bug/apps/helpers'
 GEN    coverdata-clean
make[1]: Leaving directory '/home/roger/Source/rlipscombe/erlang-mk-eunit-bug/apps/helpers'
 GEN    coverdata-clean
make[1]: Entering directory '/home/roger/Source/rlipscombe/erlang-mk-eunit-bug/apps/foo'
 DEPEND foo.d
 ERLC   foo.erl
 APP    foo
make[1]: Leaving directory '/home/roger/Source/rlipscombe/erlang-mk-eunit-bug/apps/foo'
make[1]: Entering directory '/home/roger/Source/rlipscombe/erlang-mk-eunit-bug/apps/helpers'
make[1]: Leaving directory '/home/roger/Source/rlipscombe/erlang-mk-eunit-bug/apps/helpers'
make[1]: Nothing to be done for 'test-dir'.
make[1]: Entering directory '/home/roger/Source/rlipscombe/erlang-mk-eunit-bug/apps/foo'
 GEN    clean-app
 GEN    coverdata-clean
 DEPEND foo.d
 ERLC   foo.erl
 APP    foo
 GEN    test-dir
 GEN    test-build
 GEN    eunit
test_foo: it_test (module 'test_foo')...*failed*
in function test_foo:'-it_test/0-fun-0-'/0 (test/test_foo.erl, line 6)
**error:{assertEqual,[{module,test_foo},
              {line,6},
              {expression,"foo : it ( )"},
              {expected,true},
              {value,false}]}
  output:<<"">>

=======================================================
  Failed: 1.  Skipped: 0.  Passed: 0.
../../erlang.mk:6632: recipe for target 'eunit' failed
make[1]: *** [eunit] Error 2
make[1]: Leaving directory '/home/roger/Source/rlipscombe/erlang-mk-eunit-bug/apps/foo'
make[1]: Entering directory '/home/roger/Source/rlipscombe/erlang-mk-eunit-bug/apps/helpers'
 GEN    coverdata-clean
make[2]: Nothing to be done for 'test-dir'.
 GEN    eunit
  There were no tests to run.
make[1]: Leaving directory '/home/roger/Source/rlipscombe/erlang-mk-eunit-bug/apps/helpers'
erlang.mk:6636: recipe for target 'apps-eunit' failed
make: *** [apps-eunit] Error 1
```

## `make -C apps/foo eunit` can't find the include file

```
roger@roger-pc:~/Source/rlipscombe/erlang-mk-eunit-bug [master] $ make -C apps/foo/ eunit
make: Entering directory '/home/roger/Source/rlipscombe/erlang-mk-eunit-bug/apps/foo'
 GEN    test-dir
test/test_foo.erl:3: can't find include lib "helpers/include/helpers.hrl"
../../erlang.mk:5325: recipe for target 'test-dir' failed
make[1]: *** [test-dir] Error 1
../../erlang.mk:5342: recipe for target 'test-build' failed
make: *** [test-build] Error 2
make: Leaving directory '/home/roger/Source/rlipscombe/erlang-mk-eunit-bug/apps/foo'
```
