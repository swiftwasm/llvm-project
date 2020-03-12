; RUN: llc < %s -asm-verbose=false | FileCheck %s

target datalayout = "e-m:e-p:32:32-i64:64-n32:64-S128"
target triple = "wasm32-unknown-unknown"

; Test indirect function call between mismatched signatures
; CHECK-LABEL: foo:
; CHECK-NEXT: .functype       foo (i32, i32, i32, i32) -> ()
define swiftcc void @foo(i32, i32) {
  ret void
}
@data = global i8* bitcast (void (i32, i32)* @foo to i8*)

; CHECK-LABEL: bar:
; CHECK-NEXT: .functype       bar (i32, i32) -> ()
; CHECK: call_indirect   (i32, i32, i32, i32) -> ()
define swiftcc void @bar() {
  %1 = load i8*, i8** @data
  %2 = bitcast i8* %1 to void (i32, i32, i32)*
  call swiftcc void %2(i32 1, i32 2, i32 swiftself 3)
  ret void
}

