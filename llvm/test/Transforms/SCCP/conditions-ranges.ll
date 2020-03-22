; NOTE: Assertions have been autogenerated by utils/update_test_checks.py
; RUN: opt < %s -ipsccp -S | FileCheck %s

declare void @use(i1)

define void @f1(i32 %a, i32 %b) {
; CHECK-LABEL: @f1(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[A_255:%.*]] = and i32 [[A:%.*]], 255
; CHECK-NEXT:    [[A_2:%.*]] = add i32 [[A_255]], 20
; CHECK-NEXT:    [[C_1:%.*]] = icmp ugt i32 [[B:%.*]], [[A_2]]
; CHECK-NEXT:    br i1 [[C_1]], label [[TRUE:%.*]], label [[FALSE:%.*]]
; CHECK:       true:
; CHECK-NEXT:    [[C_2:%.*]] = icmp eq i32 [[B]], 0
; CHECK-NEXT:    call void @use(i1 [[C_2]])
; CHECK-NEXT:    [[C_3:%.*]] = icmp eq i32 [[B]], 20
; CHECK-NEXT:    call void @use(i1 [[C_3]])
; CHECK-NEXT:    [[C_4:%.*]] = icmp eq i32 [[B]], 21
; CHECK-NEXT:    call void @use(i1 [[C_4]])
; CHECK-NEXT:    ret void
; CHECK:       false:
; CHECK-NEXT:    ret void
;
entry:
  %a.255 = and i32 %a, 255
  %a.2 = add i32 %a.255, 20
  %c.1 = icmp ugt i32 %b, %a.2
  br i1 %c.1, label %true, label %false

true:
  %c.2 = icmp eq i32 %b, 0
  call void @use(i1 %c.2)
  %c.3 = icmp eq i32 %b, 20
  call void @use(i1 %c.3)
  %c.4 = icmp eq i32 %b, 21
  call void @use(i1 %c.4)
  ret void

false:
  ret void
}


define void @f2(i8* %a) {
; CHECK-LABEL: @f2(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[C_1:%.*]] = icmp eq i8* [[A:%.*]], null
; CHECK-NEXT:    br i1 [[C_1]], label [[TRUE:%.*]], label [[FALSE:%.*]]
; CHECK:       true:
; CHECK-NEXT:    call void @use(i1 true)
; CHECK-NEXT:    ret void
; CHECK:       false:
; CHECK-NEXT:    ret void
;
entry:
  %c.1 = icmp eq i8* %a, null
  br i1 %c.1, label %true, label %false

true:
  %c.2 = icmp eq i8*%a, null
  call void @use(i1 %c.2)
  ret void

false:
  ret void
}

define i8* @f3(i8* %a, i8* %b, i1 %c) {
; CHECK-LABEL: @f3(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[C_1:%.*]] = icmp eq i8* [[A:%.*]], null
; CHECK-NEXT:    br i1 [[C_1]], label [[TRUE:%.*]], label [[FALSE:%.*]]
; CHECK:       true:
; CHECK-NEXT:    br i1 [[C:%.*]], label [[TRUE_2:%.*]], label [[FALSE_2:%.*]]
; CHECK:       true.2:
; CHECK-NEXT:    br label [[EXIT_2:%.*]]
; CHECK:       false.2:
; CHECK-NEXT:    br label [[EXIT_2]]
; CHECK:       exit.2:
; CHECK-NEXT:    [[P:%.*]] = phi i8* [ null, [[TRUE_2]] ], [ [[B:%.*]], [[FALSE_2]] ]
; CHECK-NEXT:    ret i8* [[P]]
; CHECK:       false:
; CHECK-NEXT:    ret i8* null
;
entry:
  %c.1 = icmp eq i8* %a, null
  br i1 %c.1, label %true, label %false

true:
  br i1 %c, label %true.2, label %false.2

true.2:
  br label %exit.2

false.2:
  br label %exit.2

exit.2:
  %p = phi i8* [ %a, %true.2 ], [ %b, %false.2 ]
  ret i8* %p

false:
  ret i8* null
}


define i32 @f5(i64 %sz) {
; CHECK-LABEL: @f5(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[CMP:%.*]] = icmp ugt i64 4088, [[SZ:%.*]]
; CHECK-NEXT:    br i1 [[CMP]], label [[COND_TRUE:%.*]], label [[COND_END:%.*]]
; CHECK:       cond.true:
; CHECK-NEXT:    [[DIV:%.*]] = udiv i64 4088, [[SZ]]
; CHECK-NEXT:    br label [[COND_END]]
; CHECK:       cond.end:
; CHECK-NEXT:    [[COND:%.*]] = phi i64 [ [[DIV]], [[COND_TRUE]] ], [ 1, [[ENTRY:%.*]] ]
; CHECK-NEXT:    [[CONV:%.*]] = trunc i64 [[COND]] to i32
; CHECK-NEXT:    ret i32 [[CONV]]
;
entry:
  %cmp = icmp ugt i64 4088, %sz
  br i1 %cmp, label %cond.true, label %cond.end

cond.true:                                        ; preds = %entry
  %div = udiv i64 4088, %sz
  br label %cond.end

cond.end:                                         ; preds = %entry, %cond.true
  %cond = phi i64 [ %div, %cond.true ], [ 1, %entry ]
  %conv = trunc i64 %cond to i32
  ret i32 %conv
}

define void @f6(i32 %b) {
; CHECK-LABEL: @f6(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[C_1:%.*]] = icmp ugt i32 [[B:%.*]], 20
; CHECK-NEXT:    br i1 [[C_1]], label [[TRUE:%.*]], label [[FALSE:%.*]]
; CHECK:       true:
; CHECK-NEXT:    call void @use(i1 true)
; CHECK-NEXT:    ret void
; CHECK:       false:
; CHECK-NEXT:    ret void
;
entry:
  %a = add i32 10, 10
  %c.1 = icmp ugt i32 %b, %a
  br i1 %c.1, label %true, label %false

true:
  %c.2 = icmp eq i32 %a, 20
  call void @use(i1 %c.2)
  ret void

false:
  ret void
}


define void @loop.1() {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.cond.cleanup13, %if.then
  %i.0 = phi i32 [ 0, %entry ], [ %inc27, %for.cond.cleanup13 ]
  %cmp9 = icmp sle i32 %i.0, 3
  br i1 %cmp9, label %for.body, label %for.cond.cleanup

for.cond.cleanup:                                 ; preds = %for.cond
  ret void

for.body:                                         ; preds = %for.cond
  br label %for.cond11

for.cond11:                                       ; preds = %arrayctor.cont21, %for.body
   br label %for.cond.cleanup13

for.cond.cleanup13:                               ; preds = %for.cond11
  %inc27 = add nsw i32 %i.0, 1
  br label %for.cond
}


define void @loop() {
; CHECK-LABEL: @loop(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    br label [[FOR_COND:%.*]]
; CHECK:       for.cond:
; CHECK-NEXT:    [[I_0:%.*]] = phi i32 [ 0, [[ENTRY:%.*]] ], [ [[INC27:%.*]], [[FOR_COND_CLEANUP13:%.*]] ]
; CHECK-NEXT:    [[CMP9:%.*]] = icmp sle i32 [[I_0]], 3
; CHECK-NEXT:    br i1 [[CMP9]], label [[FOR_BODY:%.*]], label [[FOR_COND_CLEANUP:%.*]]
; CHECK:       for.cond.cleanup:
; CHECK-NEXT:    ret void
; CHECK:       for.body:
; CHECK-NEXT:    br label [[FOR_COND11:%.*]]
; CHECK:       for.cond11:
; CHECK-NEXT:    [[J_0:%.*]] = phi i32 [ 0, [[FOR_BODY]] ], [ [[INC:%.*]], [[FOR_BODY14:%.*]] ]
; CHECK-NEXT:    [[CMP12:%.*]] = icmp slt i32 [[J_0]], 2
; CHECK-NEXT:    br i1 [[CMP12]], label [[FOR_BODY14]], label [[FOR_COND_CLEANUP13]]
; CHECK:       for.cond.cleanup13:
; CHECK-NEXT:    [[INC27]] = add nsw i32 [[I_0]], 1
; CHECK-NEXT:    br label [[FOR_COND]]
; CHECK:       for.body14:
; CHECK-NEXT:    [[INC]] = add nsw i32 [[J_0]], 1
; CHECK-NEXT:    br label [[FOR_COND11]]
;
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.cond.cleanup13, %if.then
  %i.0 = phi i32 [ 0, %entry ], [ %inc27, %for.cond.cleanup13 ]
  %cmp9 = icmp sle i32 %i.0, 3
  br i1 %cmp9, label %for.body, label %for.cond.cleanup

for.cond.cleanup:                                 ; preds = %for.cond
  ret void

for.body:                                         ; preds = %for.cond
  br label %for.cond11

for.cond11:                                       ; preds = %arrayctor.cont21, %for.body
  %j.0 = phi i32 [ 0, %for.body ], [ %inc, %for.body14 ]
  %cmp12 = icmp slt i32 %j.0, 2
  br i1 %cmp12, label %for.body14, label %for.cond.cleanup13

for.cond.cleanup13:                               ; preds = %for.cond11
  %inc27 = add nsw i32 %i.0, 1
  br label %for.cond

for.body14:
  %inc = add nsw i32 %j.0, 1
  br label %for.cond11
}

define i32 @foo(i64 %sz) {
; CHECK-LABEL: @foo(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[CMP:%.*]] = icmp ugt i64 4088, [[SZ:%.*]]
; CHECK-NEXT:    br i1 [[CMP]], label [[COND_TRUE:%.*]], label [[COND_END:%.*]]
; CHECK:       cond.true:
; CHECK-NEXT:    [[DIV:%.*]] = udiv i64 4088, [[SZ]]
; CHECK-NEXT:    br label [[COND_END]]
; CHECK:       cond.end:
; CHECK-NEXT:    [[COND:%.*]] = phi i64 [ [[DIV]], [[COND_TRUE]] ], [ 1, [[ENTRY:%.*]] ]
; CHECK-NEXT:    [[CONV:%.*]] = trunc i64 [[COND]] to i32
; CHECK-NEXT:    ret i32 [[CONV]]
;
entry:
  %cmp = icmp ugt i64 4088, %sz
  br i1 %cmp, label %cond.true, label %cond.end

cond.true:                                        ; preds = %entry
  %div = udiv i64 4088, %sz
  br label %cond.end

cond.end:                                         ; preds = %entry, %cond.true
  %cond = phi i64 [ %div, %cond.true ], [ 1, %entry ]
  %conv = trunc i64 %cond to i32
  ret i32 %conv
}

define i32 @bar(i64 %sz) {
; CHECK-LABEL: @bar(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[CMP:%.*]] = icmp ugt i64 [[SZ:%.*]], 4088
; CHECK-NEXT:    br i1 [[CMP]], label [[COND_TRUE:%.*]], label [[COND_END:%.*]]
; CHECK:       cond.true:
; CHECK-NEXT:    [[DIV:%.*]] = udiv i64 4088, [[SZ]]
; CHECK-NEXT:    br label [[COND_END]]
; CHECK:       cond.end:
; CHECK-NEXT:    [[COND:%.*]] = phi i64 [ [[DIV]], [[COND_TRUE]] ], [ 1, [[ENTRY:%.*]] ]
; CHECK-NEXT:    [[CONV:%.*]] = trunc i64 [[COND]] to i32
; CHECK-NEXT:    ret i32 [[CONV]]
;
entry:
  %cmp = icmp ugt i64 %sz, 4088
  br i1 %cmp, label %cond.true, label %cond.end

cond.true:                                        ; preds = %entry
  %div = udiv i64 4088, %sz
  br label %cond.end

cond.end:                                         ; preds = %entry, %cond.true
  %cond = phi i64 [ %div, %cond.true ], [ 1, %entry ]
  %conv = trunc i64 %cond to i32
  ret i32 %conv
}
