; NOTE: Assertions have been autogenerated by utils/update_analyze_test_checks.py
; RUN: opt < %s  -cost-model -analyze -mtriple=thumbv8.1-m.main-none-eabi -mattr=+mve.fp | FileCheck %s --check-prefix=CHECK-MVE
; RUN: opt < %s  -cost-model -analyze -mtriple=thumbv7-apple-ios6.0.0 -mcpu=swift | FileCheck %s --check-prefix=CHECK-NEON

define void @broadcast() {
; CHECK-MVE-LABEL: 'broadcast'
; CHECK-MVE-NEXT:  Cost Model: Found an estimated cost of 3 for instruction: %v7 = shufflevector <2 x i8> undef, <2 x i8> undef, <2 x i32> zeroinitializer
; CHECK-MVE-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %v8 = shufflevector <4 x i8> undef, <4 x i8> undef, <4 x i32> zeroinitializer
; CHECK-MVE-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %v9 = shufflevector <8 x i8> undef, <8 x i8> undef, <8 x i32> zeroinitializer
; CHECK-MVE-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %v10 = shufflevector <16 x i8> undef, <16 x i8> undef, <16 x i32> zeroinitializer
; CHECK-MVE-NEXT:  Cost Model: Found an estimated cost of 3 for instruction: %v11 = shufflevector <2 x i16> undef, <2 x i16> undef, <2 x i32> zeroinitializer
; CHECK-MVE-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %v12 = shufflevector <4 x i16> undef, <4 x i16> undef, <4 x i32> zeroinitializer
; CHECK-MVE-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %v13 = shufflevector <8 x i16> undef, <8 x i16> undef, <8 x i32> zeroinitializer
; CHECK-MVE-NEXT:  Cost Model: Found an estimated cost of 3 for instruction: %v14 = shufflevector <2 x i32> undef, <2 x i32> undef, <2 x i32> zeroinitializer
; CHECK-MVE-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %v15 = shufflevector <4 x i32> undef, <4 x i32> undef, <4 x i32> zeroinitializer
; CHECK-MVE-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %v16 = shufflevector <2 x float> undef, <2 x float> undef, <2 x i32> zeroinitializer
; CHECK-MVE-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %v17 = shufflevector <4 x float> undef, <4 x float> undef, <4 x i32> zeroinitializer
; CHECK-MVE-NEXT:  Cost Model: Unknown cost for instruction: %v18 = shufflevector <8 x half> undef, <8 x half> undef, <4 x i32> zeroinitializer
; CHECK-MVE-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: ret void
;
; CHECK-NEON-LABEL: 'broadcast'
; CHECK-NEON-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %v7 = shufflevector <2 x i8> undef, <2 x i8> undef, <2 x i32> zeroinitializer
; CHECK-NEON-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %v8 = shufflevector <4 x i8> undef, <4 x i8> undef, <4 x i32> zeroinitializer
; CHECK-NEON-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %v9 = shufflevector <8 x i8> undef, <8 x i8> undef, <8 x i32> zeroinitializer
; CHECK-NEON-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %v10 = shufflevector <16 x i8> undef, <16 x i8> undef, <16 x i32> zeroinitializer
; CHECK-NEON-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %v11 = shufflevector <2 x i16> undef, <2 x i16> undef, <2 x i32> zeroinitializer
; CHECK-NEON-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %v12 = shufflevector <4 x i16> undef, <4 x i16> undef, <4 x i32> zeroinitializer
; CHECK-NEON-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %v13 = shufflevector <8 x i16> undef, <8 x i16> undef, <8 x i32> zeroinitializer
; CHECK-NEON-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %v14 = shufflevector <2 x i32> undef, <2 x i32> undef, <2 x i32> zeroinitializer
; CHECK-NEON-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %v15 = shufflevector <4 x i32> undef, <4 x i32> undef, <4 x i32> zeroinitializer
; CHECK-NEON-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %v16 = shufflevector <2 x float> undef, <2 x float> undef, <2 x i32> zeroinitializer
; CHECK-NEON-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %v17 = shufflevector <4 x float> undef, <4 x float> undef, <4 x i32> zeroinitializer
; CHECK-NEON-NEXT:  Cost Model: Unknown cost for instruction: %v18 = shufflevector <8 x half> undef, <8 x half> undef, <4 x i32> zeroinitializer
; CHECK-NEON-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: ret void
;
  %v7 = shufflevector <2 x i8> undef, <2 x i8> undef, <2 x i32> zeroinitializer
  %v8 = shufflevector <4 x i8> undef, <4 x i8> undef, <4 x i32> zeroinitializer
  %v9 = shufflevector <8 x i8> undef, <8 x i8> undef, <8 x i32> zeroinitializer
  %v10 = shufflevector <16 x i8> undef, <16 x i8> undef, <16 x i32> zeroinitializer

  %v11 = shufflevector <2 x i16> undef, <2 x i16> undef, <2 x i32> zeroinitializer
  %v12 = shufflevector <4 x i16> undef, <4 x i16> undef, <4 x i32> zeroinitializer
  %v13 = shufflevector <8 x i16> undef, <8 x i16> undef, <8 x i32> zeroinitializer

  %v14 = shufflevector <2 x i32> undef, <2 x i32> undef, <2 x i32> zeroinitializer
  %v15 = shufflevector <4 x i32> undef, <4 x i32> undef, <4 x i32> zeroinitializer

  %v16 = shufflevector <2 x float> undef, <2 x float> undef, <2 x i32> zeroinitializer
  %v17 = shufflevector <4 x float> undef, <4 x float> undef, <4 x i32> zeroinitializer
  %v18 = shufflevector <8 x half> undef, <8 x half> undef, <4 x i32> zeroinitializer

  ret void
}

;; Reverse shuffles should be lowered to vrev and possibly a vext (for quadwords, on neon)
define void @reverse() {
; CHECK-MVE-LABEL: 'reverse'
; CHECK-MVE-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %v7 = shufflevector <2 x i8> undef, <2 x i8> undef, <2 x i32> <i32 1, i32 0>
; CHECK-MVE-NEXT:  Cost Model: Found an estimated cost of 8 for instruction: %v8 = shufflevector <4 x i8> undef, <4 x i8> undef, <4 x i32> <i32 3, i32 2, i32 1, i32 0>
; CHECK-MVE-NEXT:  Cost Model: Found an estimated cost of 16 for instruction: %v9 = shufflevector <8 x i8> undef, <8 x i8> undef, <8 x i32> <i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0>
; CHECK-MVE-NEXT:  Cost Model: Found an estimated cost of 32 for instruction: %v10 = shufflevector <16 x i8> undef, <16 x i8> undef, <16 x i32> <i32 15, i32 14, i32 13, i32 12, i32 11, i32 10, i32 9, i32 8, i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0>
; CHECK-MVE-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %v11 = shufflevector <2 x i16> undef, <2 x i16> undef, <2 x i32> <i32 1, i32 0>
; CHECK-MVE-NEXT:  Cost Model: Found an estimated cost of 8 for instruction: %v12 = shufflevector <4 x i16> undef, <4 x i16> undef, <4 x i32> <i32 3, i32 2, i32 1, i32 0>
; CHECK-MVE-NEXT:  Cost Model: Found an estimated cost of 16 for instruction: %v13 = shufflevector <8 x i16> undef, <8 x i16> undef, <8 x i32> <i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0>
; CHECK-MVE-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %v14 = shufflevector <2 x i32> undef, <2 x i32> undef, <2 x i32> <i32 1, i32 0>
; CHECK-MVE-NEXT:  Cost Model: Found an estimated cost of 8 for instruction: %v15 = shufflevector <4 x i32> undef, <4 x i32> undef, <4 x i32> <i32 3, i32 2, i32 1, i32 0>
; CHECK-MVE-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %v16 = shufflevector <2 x float> undef, <2 x float> undef, <2 x i32> <i32 1, i32 0>
; CHECK-MVE-NEXT:  Cost Model: Found an estimated cost of 8 for instruction: %v17 = shufflevector <4 x float> undef, <4 x float> undef, <4 x i32> <i32 3, i32 2, i32 1, i32 0>
; CHECK-MVE-NEXT:  Cost Model: Found an estimated cost of 16 for instruction: %v18 = shufflevector <8 x half> undef, <8 x half> undef, <8 x i32> <i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0>
; CHECK-MVE-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: ret void
;
; CHECK-NEON-LABEL: 'reverse'
; CHECK-NEON-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %v7 = shufflevector <2 x i8> undef, <2 x i8> undef, <2 x i32> <i32 1, i32 0>
; CHECK-NEON-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %v8 = shufflevector <4 x i8> undef, <4 x i8> undef, <4 x i32> <i32 3, i32 2, i32 1, i32 0>
; CHECK-NEON-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %v9 = shufflevector <8 x i8> undef, <8 x i8> undef, <8 x i32> <i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0>
; CHECK-NEON-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %v10 = shufflevector <16 x i8> undef, <16 x i8> undef, <16 x i32> <i32 15, i32 14, i32 13, i32 12, i32 11, i32 10, i32 9, i32 8, i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0>
; CHECK-NEON-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %v11 = shufflevector <2 x i16> undef, <2 x i16> undef, <2 x i32> <i32 1, i32 0>
; CHECK-NEON-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %v12 = shufflevector <4 x i16> undef, <4 x i16> undef, <4 x i32> <i32 3, i32 2, i32 1, i32 0>
; CHECK-NEON-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %v13 = shufflevector <8 x i16> undef, <8 x i16> undef, <8 x i32> <i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0>
; CHECK-NEON-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %v14 = shufflevector <2 x i32> undef, <2 x i32> undef, <2 x i32> <i32 1, i32 0>
; CHECK-NEON-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %v15 = shufflevector <4 x i32> undef, <4 x i32> undef, <4 x i32> <i32 3, i32 2, i32 1, i32 0>
; CHECK-NEON-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %v16 = shufflevector <2 x float> undef, <2 x float> undef, <2 x i32> <i32 1, i32 0>
; CHECK-NEON-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %v17 = shufflevector <4 x float> undef, <4 x float> undef, <4 x i32> <i32 3, i32 2, i32 1, i32 0>
; CHECK-NEON-NEXT:  Cost Model: Found an estimated cost of 40 for instruction: %v18 = shufflevector <8 x half> undef, <8 x half> undef, <8 x i32> <i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0>
; CHECK-NEON-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: ret void
;
  %v7 = shufflevector <2 x i8> undef, <2 x i8> undef, <2 x i32> <i32 1, i32 0>
  %v8 = shufflevector <4 x i8> undef, <4 x i8> undef, <4 x i32> <i32 3, i32 2, i32 1, i32 0>
  %v9 = shufflevector <8 x i8> undef, <8 x i8> undef, <8 x i32> <i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0>
  %v10 = shufflevector <16 x i8> undef, <16 x i8> undef, <16 x i32> <i32 15, i32 14, i32 13, i32 12, i32 11, i32 10, i32 9, i32 8, i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0>

  %v11 = shufflevector <2 x i16> undef, <2 x i16> undef, <2 x i32> <i32 1, i32 0>
  %v12 = shufflevector <4 x i16> undef, <4 x i16> undef, <4 x i32> <i32 3, i32 2, i32 1, i32 0>
  %v13 = shufflevector <8 x i16> undef, <8 x i16> undef, <8 x i32> <i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0>

  %v14 = shufflevector <2 x i32> undef, <2 x i32> undef, <2 x i32> <i32 1, i32 0>
  %v15 = shufflevector <4 x i32> undef, <4 x i32> undef, <4 x i32> <i32 3, i32 2, i32 1, i32 0>

  %v16 = shufflevector <2 x float> undef, <2 x float> undef, <2 x i32> <i32 1, i32 0>
  %v17 = shufflevector <4 x float> undef, <4 x float> undef, <4 x i32> <i32 3, i32 2, i32 1, i32 0>
  %v18 = shufflevector <8 x half> undef, <8 x half> undef, <8 x i32> <i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0>

  ret void
}
