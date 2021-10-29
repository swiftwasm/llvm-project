; RUN: opt < %s -enable-coroutines -O2 -S | FileCheck --check-prefixes=CHECK %s

target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%swift.async_func_pointer = type <{ i32, i32 }>
%swift.full_boxmetadata = type { void (%swift.refcounted*)*, i8**, %swift.type, i32, i8* }
%swift.refcounted = type { %swift.type*, i64 }
%swift.type = type { i64 }
%swift.context = type { %swift.context*, void (%swift.context*)*, i64 }
%swift.opaque = type opaque
%T9teststack4MainO1AC = type <{ %swift.refcounted, %swift.defaultactor }>
%swift.defaultactor = type { [12 x i8*] }
%TSi_Si_S3ittSg = type <{ [40 x i8], [1 x i8] }>
%TSi = type <{ i64 }>
%swift.bridge = type opaque
%Ts23_ContiguousArrayStorageCyypG = type <{ %swift.refcounted, %Ts10_ArrayBodyV }>
%Ts10_ArrayBodyV = type <{ %TSo22_SwiftArrayBodyStorageV }>
%TSo22_SwiftArrayBodyStorageV = type <{ %TSi, %TSu }>
%TSu = type <{ i64 }>
%Ts28__ContiguousArrayStorageBaseC = type <{ %swift.refcounted, %Ts10_ArrayBodyV }>
%Any = type { [24 x i8], %swift.type* }

@"$s9teststack4MainO1AC1ayySi_Si_S3ittSgyYaYbXEYaFTu" = hidden global %swift.async_func_pointer <{ i32 trunc (i64 sub (i64 ptrtoint (void (%swift.context*, i8*, %swift.opaque*, %T9teststack4MainO1AC*)* @"$s9teststack4MainO1AC1ayySi_Si_S3ittSgyYaYbXEYaF" to i64), i64 ptrtoint (%swift.async_func_pointer* @"$s9teststack4MainO1AC1ayySi_Si_S3ittSgyYaYbXEYaFTu" to i64)) to i32), i32 20 }>, section "__TEXT,__const", align 8
@0 = external hidden unnamed_addr constant [26 x i8]
@1 = external hidden unnamed_addr constant [12 x i8]
@2 = external hidden unnamed_addr constant [17 x i8]
@"$ss23_ContiguousArrayStorageCyypGMD" = external hidden global { i32, i32 }, align 8
@"$sSi_Si_S3ittMD" = external hidden global { i32, i32 }, align 8
@metadata = external hidden constant %swift.full_boxmetadata, align 8

; Function Attrs: nounwind
declare %swift.refcounted* @swift_allocObject(%swift.type*, i64, i64) #0

; Make sure we don't loose the conditional here.
; CHECK: define internal swifttailcc void @"$s9teststack4MainO1AC1ayySi_Si_S3ittSgyYaYbXEYaFTY1_"(i8* swiftasync %0)
; CHECK: entryresume.1:
; CHECK:   br i1

; CHECK: {{.*}}:
; CHECK:   load i64
; CHECK:   icmp eq
; CHECK:   br i1

; CHECK: {{.*}}:
; CHECK:   tail call swiftcc void @"$ss17_assertionFailure__4file4line5flagss5NeverOs12StaticStringV_SSAHSus6UInt32VtF"

define hidden swifttailcc void @"$s9teststack4MainO1AC1ayySi_Si_S3ittSgyYaYbXEYaF"(%swift.context* swiftasync %0, i8* %1, %swift.opaque* %2, %T9teststack4MainO1AC* swiftself %3) #1 {
entry:
  %4 = alloca %swift.context*, align 8
  %5 = alloca %TSi_Si_S3ittSg, align 8
  %6 = alloca %TSi_Si_S3ittSg, align 8
  %bitcast = alloca i64, align 8
  %bitcast10 = alloca i64, align 8
  %7 = bitcast %swift.context* %0 to <{ %swift.context*, void (%swift.context*)*, i32 }>*
  %8 = call token @llvm.coro.id.async(i32 20, i32 16, i32 0, i8* bitcast (%swift.async_func_pointer* @"$s9teststack4MainO1AC1ayySi_Si_S3ittSgyYaYbXEYaFTu" to i8*))
  %9 = call i8* @llvm.coro.begin(token %8, i8* null)
  store %swift.context* %0, %swift.context** %4, align 8
  %10 = bitcast %TSi_Si_S3ittSg* %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 41, i8* %10)
  %11 = bitcast %TSi_Si_S3ittSg* %6 to i8*
  call void @llvm.lifetime.start.p0i8(i64 41, i8* %11)
  %12 = bitcast i8* %1 to void (%TSi_Si_S3ittSg*, %swift.context*, %swift.refcounted*)*
  %13 = bitcast %swift.opaque* %2 to %swift.refcounted*
  %14 = bitcast void (%TSi_Si_S3ittSg*, %swift.context*, %swift.refcounted*)* %12 to %swift.async_func_pointer*
  %15 = getelementptr inbounds %swift.async_func_pointer, %swift.async_func_pointer* %14, i32 0, i32 0
  %16 = load i32, i32* %15, align 8
  %17 = sext i32 %16 to i64
  %18 = ptrtoint i32* %15 to i64
  %19 = add i64 %18, %17
  %20 = inttoptr i64 %19 to i8*
  %21 = bitcast i8* %20 to void (%TSi_Si_S3ittSg*, %swift.context*, %swift.refcounted*)*
  %22 = getelementptr inbounds %swift.async_func_pointer, %swift.async_func_pointer* %14, i32 0, i32 1
  %23 = load i32, i32* %22, align 8
  %24 = zext i32 %23 to i64
  %25 = call swiftcc i8* @swift_task_alloc(i64 %24) #0
  call void @llvm.lifetime.start.p0i8(i64 -1, i8* %25)
  %26 = bitcast i8* %25 to <{ %swift.context*, void (%swift.context*)*, i32 }>*
  %27 = load %swift.context*, %swift.context** %4, align 8
  %28 = getelementptr inbounds <{ %swift.context*, void (%swift.context*)*, i32 }>, <{ %swift.context*, void (%swift.context*)*, i32 }>* %26, i32 0, i32 0
  store %swift.context* %27, %swift.context** %28, align 8
  %29 = call i8* @llvm.coro.async.resume()
  %30 = bitcast i8* %29 to void (%swift.context*)*
  %31 = getelementptr inbounds <{ %swift.context*, void (%swift.context*)*, i32 }>, <{ %swift.context*, void (%swift.context*)*, i32 }>* %26, i32 0, i32 1
  store void (%swift.context*)* %30, void (%swift.context*)** %31, align 8
  %32 = bitcast i8* %25 to %swift.context*
  %33 = bitcast void (%TSi_Si_S3ittSg*, %swift.context*, %swift.refcounted*)* %21 to i8*
  %34 = call { i8* } (i32, i8*, i8*, ...) @llvm.coro.suspend.async.sl_p0i8s(i32 0, i8* %29, i8* bitcast (i8* (i8*)* @__swift_async_resume_project_context to i8*), i8* bitcast (void (i8*, %TSi_Si_S3ittSg*, %swift.context*, %swift.refcounted*)* @__swift_suspend_dispatch_3 to i8*), i8* %33, %TSi_Si_S3ittSg* %6, %swift.context* %32, %swift.refcounted* %13)
  %35 = extractvalue { i8* } %34, 0
  %36 = call i8* @__swift_async_resume_project_context(i8* %35)
  %37 = bitcast i8* %36 to %swift.context*
  store %swift.context* %37, %swift.context** %4, align 8
  call swiftcc void @swift_task_dealloc(i8* %25) #0
  call void @llvm.lifetime.end.p0i8(i64 -1, i8* %25)
  %38 = ptrtoint %T9teststack4MainO1AC* %3 to i64
  %39 = call i8* @llvm.coro.async.resume()
  %40 = load %swift.context*, %swift.context** %4, align 8
  %41 = load %swift.context*, %swift.context** %4, align 8
  %42 = call { i8* } (i32, i8*, i8*, ...) @llvm.coro.suspend.async.sl_p0i8s(i32 0, i8* %39, i8* bitcast (i8* (i8*)* @__swift_async_resume_get_context to i8*), i8* bitcast (void (i8*, i64, i64, %swift.context*)* @__swift_suspend_point to i8*), i8* %39, i64 %38, i64 0, %swift.context* %41)
  %43 = extractvalue { i8* } %42, 0
  %44 = call i8* @__swift_async_resume_get_context(i8* %43)
  %45 = bitcast i8* %44 to %swift.context*
  store %swift.context* %45, %swift.context** %4, align 8
  %46 = call %TSi_Si_S3ittSg* @"$sSi_Si_S3ittSgWOb"(%TSi_Si_S3ittSg* %6, %TSi_Si_S3ittSg* %5)
  %47 = bitcast %TSi_Si_S3ittSg* %5 to { i64, i64, i64, i64, i64 }*
  %48 = getelementptr inbounds { i64, i64, i64, i64, i64 }, { i64, i64, i64, i64, i64 }* %47, i32 0, i32 0
  %49 = load i64, i64* %48, align 8
  %50 = getelementptr inbounds { i64, i64, i64, i64, i64 }, { i64, i64, i64, i64, i64 }* %47, i32 0, i32 1
  %51 = load i64, i64* %50, align 8
  %52 = getelementptr inbounds { i64, i64, i64, i64, i64 }, { i64, i64, i64, i64, i64 }* %47, i32 0, i32 2
  %53 = load i64, i64* %52, align 8
  %54 = getelementptr inbounds { i64, i64, i64, i64, i64 }, { i64, i64, i64, i64, i64 }* %47, i32 0, i32 3
  %55 = load i64, i64* %54, align 8
  %56 = getelementptr inbounds { i64, i64, i64, i64, i64 }, { i64, i64, i64, i64, i64 }* %47, i32 0, i32 4
  %57 = load i64, i64* %56, align 8
  %58 = getelementptr inbounds %TSi_Si_S3ittSg, %TSi_Si_S3ittSg* %5, i32 0, i32 1
  %59 = bitcast [1 x i8]* %58 to i1*
  %60 = load i1, i1* %59, align 8
  br i1 %60, label %101, label %61

61:                                               ; preds = %entry
  %62 = bitcast %TSi_Si_S3ittSg* %5 to <{ %TSi, <{ %TSi, %TSi, %TSi, %TSi }> }>*
  %.elt = getelementptr inbounds <{ %TSi, <{ %TSi, %TSi, %TSi, %TSi }> }>, <{ %TSi, <{ %TSi, %TSi, %TSi, %TSi }> }>* %62, i32 0, i32 0
  %.elt._value = getelementptr inbounds %TSi, %TSi* %.elt, i32 0, i32 0
  %63 = load i64, i64* %.elt._value, align 8
  %.elt1 = getelementptr inbounds <{ %TSi, <{ %TSi, %TSi, %TSi, %TSi }> }>, <{ %TSi, <{ %TSi, %TSi, %TSi, %TSi }> }>* %62, i32 0, i32 1
  %.elt1.elt = getelementptr inbounds <{ %TSi, %TSi, %TSi, %TSi }>, <{ %TSi, %TSi, %TSi, %TSi }>* %.elt1, i32 0, i32 0
  %.elt1.elt._value = getelementptr inbounds %TSi, %TSi* %.elt1.elt, i32 0, i32 0
  %64 = load i64, i64* %.elt1.elt._value, align 8
  %.elt1.elt2 = getelementptr inbounds <{ %TSi, %TSi, %TSi, %TSi }>, <{ %TSi, %TSi, %TSi, %TSi }>* %.elt1, i32 0, i32 1
  %.elt1.elt2._value = getelementptr inbounds %TSi, %TSi* %.elt1.elt2, i32 0, i32 0
  %65 = load i64, i64* %.elt1.elt2._value, align 8
  %.elt1.elt3 = getelementptr inbounds <{ %TSi, %TSi, %TSi, %TSi }>, <{ %TSi, %TSi, %TSi, %TSi }>* %.elt1, i32 0, i32 2
  %.elt1.elt3._value = getelementptr inbounds %TSi, %TSi* %.elt1.elt3, i32 0, i32 0
  %66 = load i64, i64* %.elt1.elt3._value, align 8
  %.elt1.elt4 = getelementptr inbounds <{ %TSi, %TSi, %TSi, %TSi }>, <{ %TSi, %TSi, %TSi, %TSi }>* %.elt1, i32 0, i32 3
  %.elt1.elt4._value = getelementptr inbounds %TSi, %TSi* %.elt1.elt4, i32 0, i32 0
  %67 = load i64, i64* %.elt1.elt4._value, align 8
  %68 = icmp eq i64 %63, 0
  br i1 %68, label %79, label %69

69:                                               ; preds = %61
  %70 = call { i64, i1 } @llvm.usub.with.overflow.i64(i64 ptrtoint ([17 x i8]* @2 to i64), i64 32)
  %71 = extractvalue { i64, i1 } %70, 0
  %72 = extractvalue { i64, i1 } %70, 1
  %73 = or i64 %71, -9223372036854775808
  %74 = bitcast i64* %bitcast to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %74)
  store i64 %73, i64* %bitcast, align 8
  %75 = bitcast i64* %bitcast to %swift.bridge**
  %76 = load %swift.bridge*, %swift.bridge** %75, align 8
  %77 = bitcast i64* %bitcast to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %77)
  call swiftcc void @"$ss17_assertionFailure__4file4line5flagss5NeverOs12StaticStringV_SSAHSus6UInt32VtF"(i64 ptrtoint ([12 x i8]* @1 to i64), i64 11, i8 2, i64 -3458764513820540912, %swift.bridge* %76, i64 ptrtoint ([26 x i8]* @0 to i64), i64 25, i8 2, i64 19, i32 0)
  br label %coro.end

coro.end:                                         ; preds = %69
  %78 = call i1 (i8*, i1, ...) @llvm.coro.end.async(i8* %9, i1 false)
  unreachable

79:                                               ; preds = %61
  %80 = call %swift.type* @__swift_instantiateConcreteTypeFromMangledName({ i32, i32 }* @"$ss23_ContiguousArrayStorageCyypGMD") #10
  %81 = call noalias %swift.refcounted* @swift_allocObject(%swift.type* %80, i64 64, i64 7) #0
  %82 = bitcast %swift.refcounted* %81 to %Ts23_ContiguousArrayStorageCyypG*
  %83 = bitcast %Ts23_ContiguousArrayStorageCyypG* %82 to %Ts28__ContiguousArrayStorageBaseC*
  %84 = getelementptr inbounds %Ts28__ContiguousArrayStorageBaseC, %Ts28__ContiguousArrayStorageBaseC* %83, i32 0, i32 1
  %._storage = getelementptr inbounds %Ts10_ArrayBodyV, %Ts10_ArrayBodyV* %84, i32 0, i32 0
  %._storage.count = getelementptr inbounds %TSo22_SwiftArrayBodyStorageV, %TSo22_SwiftArrayBodyStorageV* %._storage, i32 0, i32 0
  %._storage.count._value = getelementptr inbounds %TSi, %TSi* %._storage.count, i32 0, i32 0
  store i64 1, i64* %._storage.count._value, align 8
  %._storage._capacityAndFlags = getelementptr inbounds %TSo22_SwiftArrayBodyStorageV, %TSo22_SwiftArrayBodyStorageV* %._storage, i32 0, i32 1
  %._storage._capacityAndFlags._value = getelementptr inbounds %TSu, %TSu* %._storage._capacityAndFlags, i32 0, i32 0
  store i64 2, i64* %._storage._capacityAndFlags._value, align 8
  %85 = bitcast %Ts28__ContiguousArrayStorageBaseC* %83 to i8*
  %86 = getelementptr inbounds i8, i8* %85, i64 32
  %tailaddr = bitcast i8* %86 to %Any*
  %87 = call %swift.type* @__swift_instantiateConcreteTypeFromMangledName({ i32, i32 }* @"$sSi_Si_S3ittMD") #10
  %88 = getelementptr inbounds %Any, %Any* %tailaddr, i32 0, i32 1
  store %swift.type* %87, %swift.type** %88, align 8
  %89 = getelementptr inbounds %Any, %Any* %tailaddr, i32 0, i32 0
  %90 = getelementptr inbounds %Any, %Any* %tailaddr, i32 0, i32 0
  %91 = call noalias %swift.refcounted* @swift_allocObject(%swift.type* getelementptr inbounds (%swift.full_boxmetadata, %swift.full_boxmetadata* @metadata, i32 0, i32 2), i64 56, i64 7) #0
  %92 = bitcast %swift.refcounted* %91 to <{ %swift.refcounted, [40 x i8] }>*
  %93 = getelementptr inbounds <{ %swift.refcounted, [40 x i8] }>, <{ %swift.refcounted, [40 x i8] }>* %92, i32 0, i32 1
  %94 = bitcast [40 x i8]* %93 to <{ %TSi, <{ %TSi, %TSi, %TSi, %TSi }> }>*
  %95 = bitcast [24 x i8]* %90 to %swift.refcounted**
  store %swift.refcounted* %91, %swift.refcounted** %95, align 8
  %.elt5 = getelementptr inbounds <{ %TSi, <{ %TSi, %TSi, %TSi, %TSi }> }>, <{ %TSi, <{ %TSi, %TSi, %TSi, %TSi }> }>* %94, i32 0, i32 0
  %.elt6 = getelementptr inbounds <{ %TSi, <{ %TSi, %TSi, %TSi, %TSi }> }>, <{ %TSi, <{ %TSi, %TSi, %TSi, %TSi }> }>* %94, i32 0, i32 1
  %.elt5._value = getelementptr inbounds %TSi, %TSi* %.elt5, i32 0, i32 0
  store i64 %63, i64* %.elt5._value, align 8
  %.elt6.elt = getelementptr inbounds <{ %TSi, %TSi, %TSi, %TSi }>, <{ %TSi, %TSi, %TSi, %TSi }>* %.elt6, i32 0, i32 0
  %.elt6.elt7 = getelementptr inbounds <{ %TSi, %TSi, %TSi, %TSi }>, <{ %TSi, %TSi, %TSi, %TSi }>* %.elt6, i32 0, i32 1
  %.elt6.elt8 = getelementptr inbounds <{ %TSi, %TSi, %TSi, %TSi }>, <{ %TSi, %TSi, %TSi, %TSi }>* %.elt6, i32 0, i32 2
  %.elt6.elt9 = getelementptr inbounds <{ %TSi, %TSi, %TSi, %TSi }>, <{ %TSi, %TSi, %TSi, %TSi }>* %.elt6, i32 0, i32 3
  %.elt6.elt._value = getelementptr inbounds %TSi, %TSi* %.elt6.elt, i32 0, i32 0
  store i64 %64, i64* %.elt6.elt._value, align 8
  %.elt6.elt7._value = getelementptr inbounds %TSi, %TSi* %.elt6.elt7, i32 0, i32 0
  store i64 %65, i64* %.elt6.elt7._value, align 8
  %.elt6.elt8._value = getelementptr inbounds %TSi, %TSi* %.elt6.elt8, i32 0, i32 0
  store i64 %66, i64* %.elt6.elt8._value, align 8
  %.elt6.elt9._value = getelementptr inbounds %TSi, %TSi* %.elt6.elt9, i32 0, i32 0
  store i64 %67, i64* %.elt6.elt9._value, align 8
  %96 = bitcast %Ts23_ContiguousArrayStorageCyypG* %82 to %swift.bridge*
  %97 = bitcast i64* %bitcast10 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %97)
  store i64 -2233785415175766016, i64* %bitcast10, align 8
  %98 = bitcast i64* %bitcast10 to %swift.bridge**
  %99 = load %swift.bridge*, %swift.bridge** %98, align 8
  %100 = bitcast i64* %bitcast10 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %100)
  call swiftcc void @"$ss5print_9separator10terminatoryypd_S2StF"(%swift.bridge* %96, i64 32, %swift.bridge* %99, i64 10, %swift.bridge* %99)
  call void bitcast (void (%swift.refcounted*)* @swift_release to void (%Ts23_ContiguousArrayStorageCyypG*)*)(%Ts23_ContiguousArrayStorageCyypG* %82) #0
  br label %102

101:                                              ; preds = %entry
  br label %102

102:                                              ; preds = %101, %79
  %103 = bitcast %TSi_Si_S3ittSg* %6 to i8*
  call void @llvm.lifetime.end.p0i8(i64 41, i8* %103)
  %104 = bitcast %TSi_Si_S3ittSg* %5 to i8*
  call void @llvm.lifetime.end.p0i8(i64 41, i8* %104)
  %105 = load %swift.context*, %swift.context** %4, align 8
  %106 = bitcast %swift.context* %105 to <{ %swift.context*, void (%swift.context*)*, i32 }>*
  %107 = getelementptr inbounds <{ %swift.context*, void (%swift.context*)*, i32 }>, <{ %swift.context*, void (%swift.context*)*, i32 }>* %106, i32 0, i32 1
  %108 = load void (%swift.context*)*, void (%swift.context*)** %107, align 8
  %109 = load %swift.context*, %swift.context** %4, align 8
  %110 = bitcast void (%swift.context*)* %108 to i8*
  %111 = call i1 (i8*, i1, ...) @llvm.coro.end.async(i8* %9, i1 false, void (i8*, %swift.context*)* @__swift_suspend_dispatch_1, i8* %110, %swift.context* %109)
  unreachable
}

; Function Attrs: nounwind
declare token @llvm.coro.id.async(i32, i32, i32, i8*) #0

; Function Attrs: nounwind
declare i8* @llvm.coro.begin(token, i8* writeonly) #0

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: argmemonly nounwind
declare swiftcc i8* @swift_task_alloc(i64) #3

; Function Attrs: nounwind
declare i8* @llvm.coro.async.resume() #0

; Function Attrs: alwaysinline nounwind
define linkonce_odr hidden i8* @__swift_async_resume_project_context(i8* %0) #4 {
entry:
  %1 = bitcast i8* %0 to i8**
  %2 = load i8*, i8** %1, align 8
  %3 = call i8** @llvm.swift.async.context.addr()
  store i8* %2, i8** %3, align 8
  ret i8* %2
}

declare i8** @llvm.swift.async.context.addr() #10

; Function Attrs: nounwind
define internal swifttailcc void @__swift_suspend_dispatch_3(i8* %0, %TSi_Si_S3ittSg* %1, %swift.context* %2, %swift.refcounted* %3) #0 {
entry:
  %4 = bitcast i8* %0 to void (%TSi_Si_S3ittSg*, %swift.context*, %swift.refcounted*)*
  musttail call swifttailcc void %4(%TSi_Si_S3ittSg* noalias nocapture %1, %swift.context* swiftasync %2, %swift.refcounted* swiftself %3)
  ret void
}
; Function Attrs: nounwind
declare { i8* } @llvm.coro.suspend.async.sl_p0i8s(i32, i8*, i8*, ...) #0

; Function Attrs: argmemonly nounwind
declare swiftcc void @swift_task_dealloc(i8*) #3

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: nounwind
define linkonce_odr hidden i8* @__swift_async_resume_get_context(i8* %0) #5 {
entry:
  ret i8* %0
}

; Function Attrs: nounwind
define internal swifttailcc void @__swift_suspend_point(i8* %0, i64 %1, i64 %2, %swift.context* %3) #0 {
entry:
  musttail call swifttailcc void @swift_task_switch(%swift.context* swiftasync %3, i8* %0, i64 %1, i64 %2) #1
  ret void
}

; Function Attrs: nounwind
declare swifttailcc void @swift_task_switch(%swift.context*, i8*, i64, i64) #0


; Function Attrs: noinline nounwind
declare hidden %TSi_Si_S3ittSg* @"$sSi_Si_S3ittSgWOb"(%TSi_Si_S3ittSg*, %TSi_Si_S3ittSg*) #6

; Function Attrs: noinline nounwind readnone
declare hidden %swift.type* @__swift_instantiateConcreteTypeFromMangledName({ i32, i32 }*) #7

; Function Attrs: nounwind
define internal swifttailcc void @__swift_suspend_dispatch_1(i8* %0, %swift.context* %1) #0 {
entry:
  %2 = bitcast i8* %0 to void (%swift.context*)*
  musttail call swifttailcc void %2(%swift.context* swiftasync %1)
  ret void
}


; Function Attrs: nounwind
declare i1 @llvm.coro.end.async(i8*, i1, ...) #0

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.usub.with.overflow.i64(i64, i64) #8

; Function Attrs: noinline
declare swiftcc void @"$ss17_assertionFailure__4file4line5flagss5NeverOs12StaticStringV_SSAHSus6UInt32VtF"(i64, i64, i8, i64, %swift.bridge*, i64, i64, i8, i64, i32) #9

declare swiftcc void @"$ss5print_9separator10terminatoryypd_S2StF"(%swift.bridge*, i64, %swift.bridge*, i64, %swift.bridge*) #1

; Function Attrs: nounwind
declare void @swift_release(%swift.refcounted*) #0

attributes #0 = { nounwind }
attributes #1 = { "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nofree nosync nounwind willreturn }
attributes #3 = { argmemonly nounwind }
attributes #4 = { alwaysinline nounwind "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { noinline nounwind "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { noinline nounwind readnone "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #9 = { noinline "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #10 = { nounwind readnone }

!llvm.module.flags = !{!0, !1, !2, !3, !4, !5, !6, !7, !8, !9, !10, !11}
!swift.module.flags = !{!12}
!llvm.asan.globals = !{!13, !14, !15, !16, !17, !18, !19, !20, !21, !22, !23, !24, !25, !26, !27, !28, !29, !30, !31, !32, !33, !34, !35, !36, !37, !38, !39, !40}
!llvm.linker.options = !{!41, !42, !43}

!0 = !{i32 2, !"SDK Version", [3 x i32] [i32 12, i32 0, i32 0]}
!1 = !{i32 1, !"Objective-C Version", i32 2}
!2 = !{i32 1, !"Objective-C Image Info Version", i32 0}
!3 = !{i32 1, !"Objective-C Image Info Section", !"__DATA,__objc_imageinfo,regular,no_dead_strip"}
!4 = !{i32 1, !"Objective-C Garbage Collection", i8 0}
!5 = !{i32 1, !"Objective-C Class Properties", i32 64}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 1, !"Swift Version", i32 7}
!9 = !{i32 1, !"Swift ABI Version", i32 7}
!10 = !{i32 1, !"Swift Major Version", i8 5}
!11 = !{i32 1, !"Swift Minor Version", i8 6}
!12 = !{!"standard-library", i1 false}
!13 = !{%swift.async_func_pointer* @"$s9teststack4MainO1AC1ayySi_Si_S3ittSgyYaYbXEYaFTu", null, null, i1 false, i1 true}
!14 = distinct !{null, null, null, i1 false, i1 true}
!15 = distinct !{null, null, null, i1 false, i1 true}
!16 = distinct !{null, null, null, i1 false, i1 true}
!17 = distinct !{null, null, null, i1 false, i1 true}
!18 = distinct !{null, null, null, i1 false, i1 true}
!19 = distinct !{null, null, null, i1 false, i1 true}
!20 = distinct !{null, null, null, i1 false, i1 true}
!21 = distinct !{null, null, null, i1 false, i1 true}
!22 = distinct !{null, null, null, i1 false, i1 true}
!23 = distinct !{null, null, null, i1 false, i1 true}
!24 = distinct !{null, null, null, i1 false, i1 true}
!25 = distinct !{null, null, null, i1 false, i1 true}
!26 = distinct !{null, null, null, i1 false, i1 true}
!27 = distinct !{null, null, null, i1 false, i1 true}
!28 = distinct !{null, null, null, i1 false, i1 true}
!29 = distinct !{null, null, null, i1 false, i1 true}
!30 = distinct !{null, null, null, i1 false, i1 true}
!31 = distinct !{null, null, null, i1 false, i1 true}
!32 = distinct !{null, null, null, i1 false, i1 true}
!33 = distinct !{null, null, null, i1 false, i1 true}
!34 = distinct !{null, null, null, i1 false, i1 true}
!35 = distinct !{null, null, null, i1 false, i1 true}
!36 = distinct !{null, null, null, i1 false, i1 true}
!37 = distinct !{null, null, null, i1 false, i1 true}
!38 = distinct !{null, null, null, i1 false, i1 true}
!39 = distinct !{null, null, null, i1 false, i1 true}
!40 = distinct !{null, null, null, i1 false, i1 true}
!41 = !{!"-lswift_Concurrency"}
!42 = !{!"-lswiftCore"}
!43 = !{!"-lobjc"}
