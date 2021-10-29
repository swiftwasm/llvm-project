// RUN: %clangxx_asan -O0 %s -o %t && not %run %t 2>&1 | FileCheck %s

// Test the frexp() interceptor.
// we are choosing not to cherry pick the fix for this test to this branch rdar://81224953
// fix is this commit: https://github.com/apple/llvm-project/commit/cfa4d112da8d
// UNSUPPORTED: ios

#include <math.h>
#include <stdio.h>
#include <stdlib.h>
int main() {
  double x = 3.14;
  int *exp = (int*)malloc(sizeof(int));
  free(exp);
  double y = frexp(x, exp);
  // CHECK: use-after-free
  // CHECK: SUMMARY
  return 0;
}
