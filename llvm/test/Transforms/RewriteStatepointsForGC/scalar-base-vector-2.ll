; RUN: opt < %s -rewrite-statepoints-for-gc -S | FileCheck  %s
; RUN: opt < %s -passes=rewrite-statepoints-for-gc -S | FileCheck  %s

; Assertions are almost autogenerated except for last testcase widget, which was
; updated (with -DAG instead of -NEXT) to fix buildbot failure reproducible only on two boxes.

; Uses of extractelement that are of scalar type should not have the BDV
; incorrectly identified as a vector type.
define void @widget() gc "statepoint-example" {
; CHECK-LABEL: @widget(
; CHECK-NEXT:  bb6:
; CHECK-NEXT:    [[BASE_EE:%.*]] = extractelement <2 x i8 addrspace(1)*> zeroinitializer, i32 1, !is_base_value !0
; CHECK-NEXT:    [[TMP:%.*]] = extractelement <2 x i8 addrspace(1)*> undef, i32 1
; CHECK-NEXT:    br i1 undef, label [[BB7:%.*]], label [[BB9:%.*]]
; CHECK:       bb7:
; CHECK-NEXT:    [[TMP8:%.*]] = getelementptr inbounds i8, i8 addrspace(1)* [[TMP]], i64 12
; CHECK-NEXT:    br label [[BB11:%.*]]
; CHECK:       bb9:
; CHECK-NEXT:    [[TMP10:%.*]] = getelementptr inbounds i8, i8 addrspace(1)* [[TMP]], i64 12
; CHECK-NEXT:    br i1 undef, label [[BB11]], label [[BB15:%.*]]
; CHECK:       bb11:
; CHECK-NEXT:    [[TMP12_BASE:%.*]] = phi i8 addrspace(1)* [ [[BASE_EE]], [[BB7]] ], [ [[BASE_EE]], [[BB9]] ], !is_base_value !0
; CHECK-NEXT:    [[TMP12:%.*]] = phi i8 addrspace(1)* [ [[TMP8]], [[BB7]] ], [ [[TMP10]], [[BB9]] ]
; CHECK-NEXT:    [[STATEPOINT_TOKEN:%.*]] = call token (i64, i32, void ()*, i32, i32, ...) @llvm.experimental.gc.statepoint.p0f_isVoidf(i64 2882400000, i32 0, void ()* @snork, i32 0, i32 0, i32 0, i32 1, i32 undef, i8 addrspace(1)* [[TMP12_BASE]], i8 addrspace(1)* [[TMP12]])
; CHECK-NEXT:    [[TMP12_BASE_RELOCATED:%.*]] = call coldcc i8 addrspace(1)* @llvm.experimental.gc.relocate.p1i8(token [[STATEPOINT_TOKEN]], i32 8, i32 8)
; CHECK-NEXT:    [[TMP12_RELOCATED:%.*]] = call coldcc i8 addrspace(1)* @llvm.experimental.gc.relocate.p1i8(token [[STATEPOINT_TOKEN]], i32 8, i32 9)
; CHECK-NEXT:    br label [[BB15]]
; CHECK:       bb15:
; CHECK-NEXT:    [[TMP16_BASE:%.*]] = phi i8 addrspace(1)* [ [[BASE_EE]], [[BB9]] ], [ [[TMP12_BASE_RELOCATED]], [[BB11]] ], !is_base_value !0
; CHECK-NEXT:    [[TMP16:%.*]] = phi i8 addrspace(1)* [ [[TMP10]], [[BB9]] ], [ [[TMP12_RELOCATED]], [[BB11]] ]
; CHECK-NEXT:    br i1 undef, label [[BB17:%.*]], label [[BB20:%.*]]
; CHECK:       bb17:
; CHECK-NEXT:    [[STATEPOINT_TOKEN1:%.*]] = call token (i64, i32, void ()*, i32, i32, ...) @llvm.experimental.gc.statepoint.p0f_isVoidf(i64 2882400000, i32 0, void ()* @snork, i32 0, i32 0, i32 0, i32 1, i32 undef, i8 addrspace(1)* [[TMP16_BASE]], i8 addrspace(1)* [[TMP16]])
; CHECK-NEXT:    [[TMP16_BASE_RELOCATED:%.*]] = call coldcc i8 addrspace(1)* @llvm.experimental.gc.relocate.p1i8(token [[STATEPOINT_TOKEN1]], i32 8, i32 8)
; CHECK-NEXT:    [[TMP16_RELOCATED:%.*]] = call coldcc i8 addrspace(1)* @llvm.experimental.gc.relocate.p1i8(token [[STATEPOINT_TOKEN1]], i32 8, i32 9)
; CHECK-NEXT:    br label [[BB20]]
; CHECK:       bb20:
; CHECK-DAG:    [[DOT05:%.*]] = phi i8 addrspace(1)* [ [[TMP16_BASE_RELOCATED]], [[BB17]] ], [ [[TMP16_BASE]], [[BB15]] ]
; CHECK-DAG:    [[DOT0:%.*]] = phi i8 addrspace(1)* [ [[TMP16_RELOCATED]], [[BB17]] ], [ [[TMP16]], [[BB15]] ]
; CHECK-NEXT:    [[STATEPOINT_TOKEN2:%.*]] = call token (i64, i32, void (i8 addrspace(1)*)*, i32, i32, ...) @llvm.experimental.gc.statepoint.p0f_isVoidp1i8f(i64 2882400000, i32 0, void (i8 addrspace(1)*)* @foo, i32 1, i32 0, i8 addrspace(1)* [[DOT0]], i32 0, i32 0, i8 addrspace(1)* [[DOT05]], i8 addrspace(1)* [[DOT0]])
; CHECK-NEXT:    [[TMP16_BASE_RELOCATED3:%.*]] = call coldcc i8 addrspace(1)* @llvm.experimental.gc.relocate.p1i8(token [[STATEPOINT_TOKEN2]], i32 8, i32 8)
; CHECK-NEXT:    [[TMP16_RELOCATED4:%.*]] = call coldcc i8 addrspace(1)* @llvm.experimental.gc.relocate.p1i8(token [[STATEPOINT_TOKEN2]], i32 8, i32 9)
; CHECK-NEXT:    ret void
;
bb6:                                              ; preds = %bb3
  %tmp = extractelement <2 x i8 addrspace(1)*> undef, i32 1
  br i1 undef, label %bb7, label %bb9

bb7:                                              ; preds = %bb6
  %tmp8 = getelementptr inbounds i8, i8 addrspace(1)* %tmp, i64 12
  br label %bb11

bb9:                                              ; preds = %bb6, %bb6
  %tmp10 = getelementptr inbounds i8, i8 addrspace(1)* %tmp, i64 12
  br i1 undef, label %bb11, label %bb15

bb11:                                             ; preds = %bb9, %bb7
  %tmp12 = phi i8 addrspace(1)* [ %tmp8, %bb7 ], [ %tmp10, %bb9 ]
  call void @snork() [ "deopt"(i32 undef) ]
  br label %bb15

bb15:                                             ; preds = %bb11, %bb9, %bb9
  %tmp16 = phi i8 addrspace(1)* [ %tmp10, %bb9 ], [ %tmp12, %bb11 ]
  br i1 undef, label %bb17, label %bb20

bb17:                                             ; preds = %bb15
  call void @snork() [ "deopt"(i32 undef) ]
  br label %bb20

bb20:                                             ; preds = %bb17, %bb15, %bb15
  call void @foo(i8 addrspace(1)* %tmp16)
  ret void
}

declare void @snork()
declare void @foo(i8 addrspace(1)*)
