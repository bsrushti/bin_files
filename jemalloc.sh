#!/bin/sh

prefix=/usr/local/Cellar/jemalloc/5.2.1_1
exec_prefix=/usr/local/Cellar/jemalloc/5.2.1_1
libdir=${exec_prefix}/lib

DYLD_INSERT_LIBRARIES=${libdir}/libjemalloc.2.dylib
export DYLD_INSERT_LIBRARIES
exec "$@"
