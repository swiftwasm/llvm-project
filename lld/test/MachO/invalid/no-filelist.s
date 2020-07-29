# REQUIRES: x86
# RUN: llvm-mc -filetype=obj -triple=x86_64-apple-darwin %s -o %t.o
# RUN: not lld -flavor darwinnew -Z -filelist nonexistent %t.o -o %t 2>&1 | FileCheck %s
# CHECK: cannot open nonexistent: No such file or directory

.globl _main

_main:
  ret
