// NOTE: Assertions have been autogenerated by utils/update_cc_test_checks.py
// RUN: %clang_cc1 -triple thumbv8.1m.main-arm-none-eabi -target-feature +mve.fp -mfloat-abi hard -fallow-half-arguments-and-returns -O0 -disable-O0-optnone -S -emit-llvm -o - %s | opt -S -mem2reg | FileCheck %s
// RUN: %clang_cc1 -triple thumbv8.1m.main-arm-none-eabi -target-feature +mve.fp -mfloat-abi hard -fallow-half-arguments-and-returns -O0 -disable-O0-optnone -DPOLYMORPHIC -S -emit-llvm -o - %s | opt -S -mem2reg | FileCheck %s

#include <arm_mve.h>

// CHECK-LABEL: @test_vqdmulhq_s8(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[TMP0:%.*]] = call <16 x i8> @llvm.arm.mve.vqdmulh.v16i8(<16 x i8> [[A:%.*]], <16 x i8> [[B:%.*]])
// CHECK-NEXT:    ret <16 x i8> [[TMP0]]
//
int8x16_t test_vqdmulhq_s8(int8x16_t a, int8x16_t b)
{
#ifdef POLYMORPHIC
    return vqdmulhq(a, b);
#else /* POLYMORPHIC */
    return vqdmulhq_s8(a, b);
#endif /* POLYMORPHIC */
}

// CHECK-LABEL: @test_vqdmulhq_s16(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[TMP0:%.*]] = call <8 x i16> @llvm.arm.mve.vqdmulh.v8i16(<8 x i16> [[A:%.*]], <8 x i16> [[B:%.*]])
// CHECK-NEXT:    ret <8 x i16> [[TMP0]]
//
int16x8_t test_vqdmulhq_s16(int16x8_t a, int16x8_t b)
{
#ifdef POLYMORPHIC
    return vqdmulhq(a, b);
#else /* POLYMORPHIC */
    return vqdmulhq_s16(a, b);
#endif /* POLYMORPHIC */
}

// CHECK-LABEL: @test_vqdmulhq_s32(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[TMP0:%.*]] = call <4 x i32> @llvm.arm.mve.vqdmulh.v4i32(<4 x i32> [[A:%.*]], <4 x i32> [[B:%.*]])
// CHECK-NEXT:    ret <4 x i32> [[TMP0]]
//
int32x4_t test_vqdmulhq_s32(int32x4_t a, int32x4_t b)
{
#ifdef POLYMORPHIC
    return vqdmulhq(a, b);
#else /* POLYMORPHIC */
    return vqdmulhq_s32(a, b);
#endif /* POLYMORPHIC */
}

// CHECK-LABEL: @test_vqdmulhq_m_s8(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[TMP0:%.*]] = zext i16 [[P:%.*]] to i32
// CHECK-NEXT:    [[TMP1:%.*]] = call <16 x i1> @llvm.arm.mve.pred.i2v.v16i1(i32 [[TMP0]])
// CHECK-NEXT:    [[TMP2:%.*]] = call <16 x i8> @llvm.arm.mve.qdmulh.predicated.v16i8.v16i1(<16 x i8> [[A:%.*]], <16 x i8> [[B:%.*]], <16 x i1> [[TMP1]], <16 x i8> [[INACTIVE:%.*]])
// CHECK-NEXT:    ret <16 x i8> [[TMP2]]
//
int8x16_t test_vqdmulhq_m_s8(int8x16_t inactive, int8x16_t a, int8x16_t b, mve_pred16_t p)
{
#ifdef POLYMORPHIC
    return vqdmulhq_m(inactive, a, b, p);
#else /* POLYMORPHIC */
    return vqdmulhq_m_s8(inactive, a, b, p);
#endif /* POLYMORPHIC */
}

// CHECK-LABEL: @test_vqdmulhq_m_s16(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[TMP0:%.*]] = zext i16 [[P:%.*]] to i32
// CHECK-NEXT:    [[TMP1:%.*]] = call <8 x i1> @llvm.arm.mve.pred.i2v.v8i1(i32 [[TMP0]])
// CHECK-NEXT:    [[TMP2:%.*]] = call <8 x i16> @llvm.arm.mve.qdmulh.predicated.v8i16.v8i1(<8 x i16> [[A:%.*]], <8 x i16> [[B:%.*]], <8 x i1> [[TMP1]], <8 x i16> [[INACTIVE:%.*]])
// CHECK-NEXT:    ret <8 x i16> [[TMP2]]
//
int16x8_t test_vqdmulhq_m_s16(int16x8_t inactive, int16x8_t a, int16x8_t b, mve_pred16_t p)
{
#ifdef POLYMORPHIC
    return vqdmulhq_m(inactive, a, b, p);
#else /* POLYMORPHIC */
    return vqdmulhq_m_s16(inactive, a, b, p);
#endif /* POLYMORPHIC */
}

// CHECK-LABEL: @test_vqdmulhq_m_s32(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[TMP0:%.*]] = zext i16 [[P:%.*]] to i32
// CHECK-NEXT:    [[TMP1:%.*]] = call <4 x i1> @llvm.arm.mve.pred.i2v.v4i1(i32 [[TMP0]])
// CHECK-NEXT:    [[TMP2:%.*]] = call <4 x i32> @llvm.arm.mve.qdmulh.predicated.v4i32.v4i1(<4 x i32> [[A:%.*]], <4 x i32> [[B:%.*]], <4 x i1> [[TMP1]], <4 x i32> [[INACTIVE:%.*]])
// CHECK-NEXT:    ret <4 x i32> [[TMP2]]
//
int32x4_t test_vqdmulhq_m_s32(int32x4_t inactive, int32x4_t a, int32x4_t b, mve_pred16_t p)
{
#ifdef POLYMORPHIC
    return vqdmulhq_m(inactive, a, b, p);
#else /* POLYMORPHIC */
    return vqdmulhq_m_s32(inactive, a, b, p);
#endif /* POLYMORPHIC */
}

// CHECK-LABEL: @test_vqdmulhq_n_s8(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[DOTSPLATINSERT:%.*]] = insertelement <16 x i8> undef, i8 [[B:%.*]], i32 0
// CHECK-NEXT:    [[DOTSPLAT:%.*]] = shufflevector <16 x i8> [[DOTSPLATINSERT]], <16 x i8> undef, <16 x i32> zeroinitializer
// CHECK-NEXT:    [[TMP0:%.*]] = call <16 x i8> @llvm.arm.mve.vqdmulh.v16i8(<16 x i8> [[A:%.*]], <16 x i8> [[DOTSPLAT]])
// CHECK-NEXT:    ret <16 x i8> [[TMP0]]
//
int8x16_t test_vqdmulhq_n_s8(int8x16_t a, int8_t b)
{
#ifdef POLYMORPHIC
    return vqdmulhq(a, b);
#else /* POLYMORPHIC */
    return vqdmulhq_n_s8(a, b);
#endif /* POLYMORPHIC */
}

// CHECK-LABEL: @test_vqdmulhq_n_s16(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[DOTSPLATINSERT:%.*]] = insertelement <8 x i16> undef, i16 [[B:%.*]], i32 0
// CHECK-NEXT:    [[DOTSPLAT:%.*]] = shufflevector <8 x i16> [[DOTSPLATINSERT]], <8 x i16> undef, <8 x i32> zeroinitializer
// CHECK-NEXT:    [[TMP0:%.*]] = call <8 x i16> @llvm.arm.mve.vqdmulh.v8i16(<8 x i16> [[A:%.*]], <8 x i16> [[DOTSPLAT]])
// CHECK-NEXT:    ret <8 x i16> [[TMP0]]
//
int16x8_t test_vqdmulhq_n_s16(int16x8_t a, int16_t b)
{
#ifdef POLYMORPHIC
    return vqdmulhq(a, b);
#else /* POLYMORPHIC */
    return vqdmulhq_n_s16(a, b);
#endif /* POLYMORPHIC */
}

// CHECK-LABEL: @test_vqdmulhq_n_s32(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[DOTSPLATINSERT:%.*]] = insertelement <4 x i32> undef, i32 [[B:%.*]], i32 0
// CHECK-NEXT:    [[DOTSPLAT:%.*]] = shufflevector <4 x i32> [[DOTSPLATINSERT]], <4 x i32> undef, <4 x i32> zeroinitializer
// CHECK-NEXT:    [[TMP0:%.*]] = call <4 x i32> @llvm.arm.mve.vqdmulh.v4i32(<4 x i32> [[A:%.*]], <4 x i32> [[DOTSPLAT]])
// CHECK-NEXT:    ret <4 x i32> [[TMP0]]
//
int32x4_t test_vqdmulhq_n_s32(int32x4_t a, int32_t b)
{
#ifdef POLYMORPHIC
    return vqdmulhq(a, b);
#else /* POLYMORPHIC */
    return vqdmulhq_n_s32(a, b);
#endif /* POLYMORPHIC */
}

// CHECK-LABEL: @test_vqdmulhq_m_n_s8(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[DOTSPLATINSERT:%.*]] = insertelement <16 x i8> undef, i8 [[B:%.*]], i32 0
// CHECK-NEXT:    [[DOTSPLAT:%.*]] = shufflevector <16 x i8> [[DOTSPLATINSERT]], <16 x i8> undef, <16 x i32> zeroinitializer
// CHECK-NEXT:    [[TMP0:%.*]] = zext i16 [[P:%.*]] to i32
// CHECK-NEXT:    [[TMP1:%.*]] = call <16 x i1> @llvm.arm.mve.pred.i2v.v16i1(i32 [[TMP0]])
// CHECK-NEXT:    [[TMP2:%.*]] = call <16 x i8> @llvm.arm.mve.qdmulh.predicated.v16i8.v16i1(<16 x i8> [[A:%.*]], <16 x i8> [[DOTSPLAT]], <16 x i1> [[TMP1]], <16 x i8> [[INACTIVE:%.*]])
// CHECK-NEXT:    ret <16 x i8> [[TMP2]]
//
int8x16_t test_vqdmulhq_m_n_s8(int8x16_t inactive, int8x16_t a, int8_t b, mve_pred16_t p)
{
#ifdef POLYMORPHIC
    return vqdmulhq_m(inactive, a, b, p);
#else /* POLYMORPHIC */
    return vqdmulhq_m_n_s8(inactive, a, b, p);
#endif /* POLYMORPHIC */
}

// CHECK-LABEL: @test_vqdmulhq_m_n_s16(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[DOTSPLATINSERT:%.*]] = insertelement <8 x i16> undef, i16 [[B:%.*]], i32 0
// CHECK-NEXT:    [[DOTSPLAT:%.*]] = shufflevector <8 x i16> [[DOTSPLATINSERT]], <8 x i16> undef, <8 x i32> zeroinitializer
// CHECK-NEXT:    [[TMP0:%.*]] = zext i16 [[P:%.*]] to i32
// CHECK-NEXT:    [[TMP1:%.*]] = call <8 x i1> @llvm.arm.mve.pred.i2v.v8i1(i32 [[TMP0]])
// CHECK-NEXT:    [[TMP2:%.*]] = call <8 x i16> @llvm.arm.mve.qdmulh.predicated.v8i16.v8i1(<8 x i16> [[A:%.*]], <8 x i16> [[DOTSPLAT]], <8 x i1> [[TMP1]], <8 x i16> [[INACTIVE:%.*]])
// CHECK-NEXT:    ret <8 x i16> [[TMP2]]
//
int16x8_t test_vqdmulhq_m_n_s16(int16x8_t inactive, int16x8_t a, int16_t b, mve_pred16_t p)
{
#ifdef POLYMORPHIC
    return vqdmulhq_m(inactive, a, b, p);
#else /* POLYMORPHIC */
    return vqdmulhq_m_n_s16(inactive, a, b, p);
#endif /* POLYMORPHIC */
}

// CHECK-LABEL: @test_vqdmulhq_m_n_s32(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[DOTSPLATINSERT:%.*]] = insertelement <4 x i32> undef, i32 [[B:%.*]], i32 0
// CHECK-NEXT:    [[DOTSPLAT:%.*]] = shufflevector <4 x i32> [[DOTSPLATINSERT]], <4 x i32> undef, <4 x i32> zeroinitializer
// CHECK-NEXT:    [[TMP0:%.*]] = zext i16 [[P:%.*]] to i32
// CHECK-NEXT:    [[TMP1:%.*]] = call <4 x i1> @llvm.arm.mve.pred.i2v.v4i1(i32 [[TMP0]])
// CHECK-NEXT:    [[TMP2:%.*]] = call <4 x i32> @llvm.arm.mve.qdmulh.predicated.v4i32.v4i1(<4 x i32> [[A:%.*]], <4 x i32> [[DOTSPLAT]], <4 x i1> [[TMP1]], <4 x i32> [[INACTIVE:%.*]])
// CHECK-NEXT:    ret <4 x i32> [[TMP2]]
//
int32x4_t test_vqdmulhq_m_n_s32(int32x4_t inactive, int32x4_t a, int32_t b, mve_pred16_t p)
{
#ifdef POLYMORPHIC
    return vqdmulhq_m(inactive, a, b, p);
#else /* POLYMORPHIC */
    return vqdmulhq_m_n_s32(inactive, a, b, p);
#endif /* POLYMORPHIC */
}
