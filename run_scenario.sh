#!/usr/bin/env bash

mix do clean, deps.get, deps.compile
mix release

_build/dev/rel/briefly_test/bin/briefly_test start
sleep 2
_build/dev/rel/briefly_test/bin/briefly_test stop

ls -lR /tmp/briefly-*
