; NOTE: Assertions have been autogenerated by utils/update_analyze_test_checks.py
; RUN: opt < %s -mtriple=x86_64-apple-darwin -cost-model -analyze -mattr=+sse2 | FileCheck %s --check-prefixes=CHECK,SSE,SSE2
; RUN: opt < %s -mtriple=x86_64-apple-darwin -cost-model -analyze -mattr=+sse4.2 | FileCheck %s --check-prefixes=CHECK,SSE,SSE42
; RUN: opt < %s -mtriple=x86_64-apple-darwin -cost-model -analyze -mattr=+avx  | FileCheck %s --check-prefixes=CHECK,AVX,AVX1
; RUN: opt < %s -mtriple=x86_64-apple-darwin -cost-model -analyze -mattr=+avx2 | FileCheck %s --check-prefixes=CHECK,AVX,AVX2
; RUN: opt < %s -mtriple=x86_64-apple-darwin -cost-model -analyze -mattr=+avx512f | FileCheck %s --check-prefixes=CHECK,AVX512,AVX512F
; RUN: opt < %s -mtriple=x86_64-apple-darwin -cost-model -analyze -mattr=+avx512f,+avx512dq | FileCheck %s --check-prefixes=CHECK,AVX512,AVX512DQ
;
; RUN: opt < %s -mtriple=x86_64-apple-darwin -cost-model -analyze -mcpu=slm | FileCheck %s --check-prefixes=CHECK,SSE,SSE42
; RUN: opt < %s -mtriple=x86_64-apple-darwin -cost-model -analyze -mcpu=goldmont | FileCheck %s --check-prefixes=CHECK,SSE,SSE42
; RUN: opt < %s -mtriple=x86_64-apple-darwin -cost-model -analyze -mcpu=btver2 | FileCheck %s --check-prefixes=CHECK,AVX,AVX1

define i32 @fptoui_double_i64(i32 %arg) {
; SSE-LABEL: 'fptoui_double_i64'
; SSE-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %I64 = fptoui double undef to i64
; SSE-NEXT:  Cost Model: Found an estimated cost of 12 for instruction: %V2I64 = fptoui <2 x double> undef to <2 x i64>
; SSE-NEXT:  Cost Model: Found an estimated cost of 25 for instruction: %V4I64 = fptoui <4 x double> undef to <4 x i64>
; SSE-NEXT:  Cost Model: Found an estimated cost of 51 for instruction: %V8I64 = fptoui <8 x double> undef to <8 x i64>
; SSE-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: ret i32 undef
;
; AVX-LABEL: 'fptoui_double_i64'
; AVX-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %I64 = fptoui double undef to i64
; AVX-NEXT:  Cost Model: Found an estimated cost of 12 for instruction: %V2I64 = fptoui <2 x double> undef to <2 x i64>
; AVX-NEXT:  Cost Model: Found an estimated cost of 24 for instruction: %V4I64 = fptoui <4 x double> undef to <4 x i64>
; AVX-NEXT:  Cost Model: Found an estimated cost of 49 for instruction: %V8I64 = fptoui <8 x double> undef to <8 x i64>
; AVX-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: ret i32 undef
;
; AVX512F-LABEL: 'fptoui_double_i64'
; AVX512F-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %I64 = fptoui double undef to i64
; AVX512F-NEXT:  Cost Model: Found an estimated cost of 6 for instruction: %V2I64 = fptoui <2 x double> undef to <2 x i64>
; AVX512F-NEXT:  Cost Model: Found an estimated cost of 12 for instruction: %V4I64 = fptoui <4 x double> undef to <4 x i64>
; AVX512F-NEXT:  Cost Model: Found an estimated cost of 24 for instruction: %V8I64 = fptoui <8 x double> undef to <8 x i64>
; AVX512F-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: ret i32 undef
;
; AVX512DQ-LABEL: 'fptoui_double_i64'
; AVX512DQ-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %I64 = fptoui double undef to i64
; AVX512DQ-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %V2I64 = fptoui <2 x double> undef to <2 x i64>
; AVX512DQ-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %V4I64 = fptoui <4 x double> undef to <4 x i64>
; AVX512DQ-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %V8I64 = fptoui <8 x double> undef to <8 x i64>
; AVX512DQ-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: ret i32 undef
;
  %I64 = fptoui double undef to i64
  %V2I64 = fptoui <2 x double> undef to <2 x i64>
  %V4I64 = fptoui <4 x double> undef to <4 x i64>
  %V8I64 = fptoui <8 x double> undef to <8 x i64>
  ret i32 undef
}

define i32 @fptoui_double_i32(i32 %arg) {
; SSE-LABEL: 'fptoui_double_i32'
; SSE-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %I32 = fptoui double undef to i32
; SSE-NEXT:  Cost Model: Found an estimated cost of 6 for instruction: %V2I32 = fptoui <2 x double> undef to <2 x i32>
; SSE-NEXT:  Cost Model: Found an estimated cost of 13 for instruction: %V4I32 = fptoui <4 x double> undef to <4 x i32>
; SSE-NEXT:  Cost Model: Found an estimated cost of 27 for instruction: %V8I32 = fptoui <8 x double> undef to <8 x i32>
; SSE-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: ret i32 undef
;
; AVX-LABEL: 'fptoui_double_i32'
; AVX-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %I32 = fptoui double undef to i32
; AVX-NEXT:  Cost Model: Found an estimated cost of 6 for instruction: %V2I32 = fptoui <2 x double> undef to <2 x i32>
; AVX-NEXT:  Cost Model: Found an estimated cost of 16 for instruction: %V4I32 = fptoui <4 x double> undef to <4 x i32>
; AVX-NEXT:  Cost Model: Found an estimated cost of 33 for instruction: %V8I32 = fptoui <8 x double> undef to <8 x i32>
; AVX-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: ret i32 undef
;
; AVX512F-LABEL: 'fptoui_double_i32'
; AVX512F-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %I32 = fptoui double undef to i32
; AVX512F-NEXT:  Cost Model: Found an estimated cost of 6 for instruction: %V2I32 = fptoui <2 x double> undef to <2 x i32>
; AVX512F-NEXT:  Cost Model: Found an estimated cost of 16 for instruction: %V4I32 = fptoui <4 x double> undef to <4 x i32>
; AVX512F-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %V8I32 = fptoui <8 x double> undef to <8 x i32>
; AVX512F-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: ret i32 undef
;
; AVX512DQ-LABEL: 'fptoui_double_i32'
; AVX512DQ-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %I32 = fptoui double undef to i32
; AVX512DQ-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %V2I32 = fptoui <2 x double> undef to <2 x i32>
; AVX512DQ-NEXT:  Cost Model: Found an estimated cost of 16 for instruction: %V4I32 = fptoui <4 x double> undef to <4 x i32>
; AVX512DQ-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %V8I32 = fptoui <8 x double> undef to <8 x i32>
; AVX512DQ-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: ret i32 undef
;
  %I32 = fptoui double undef to i32
  %V2I32 = fptoui <2 x double> undef to <2 x i32>
  %V4I32 = fptoui <4 x double> undef to <4 x i32>
  %V8I32 = fptoui <8 x double> undef to <8 x i32>
  ret i32 undef
}

define i32 @fptoui_double_i16(i32 %arg) {
; SSE-LABEL: 'fptoui_double_i16'
; SSE-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %I16 = fptoui double undef to i16
; SSE-NEXT:  Cost Model: Found an estimated cost of 6 for instruction: %V2I16 = fptoui <2 x double> undef to <2 x i16>
; SSE-NEXT:  Cost Model: Found an estimated cost of 13 for instruction: %V4I16 = fptoui <4 x double> undef to <4 x i16>
; SSE-NEXT:  Cost Model: Found an estimated cost of 27 for instruction: %V8I16 = fptoui <8 x double> undef to <8 x i16>
; SSE-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: ret i32 undef
;
; AVX-LABEL: 'fptoui_double_i16'
; AVX-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %I16 = fptoui double undef to i16
; AVX-NEXT:  Cost Model: Found an estimated cost of 6 for instruction: %V2I16 = fptoui <2 x double> undef to <2 x i16>
; AVX-NEXT:  Cost Model: Found an estimated cost of 12 for instruction: %V4I16 = fptoui <4 x double> undef to <4 x i16>
; AVX-NEXT:  Cost Model: Found an estimated cost of 25 for instruction: %V8I16 = fptoui <8 x double> undef to <8 x i16>
; AVX-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: ret i32 undef
;
; AVX512F-LABEL: 'fptoui_double_i16'
; AVX512F-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %I16 = fptoui double undef to i16
; AVX512F-NEXT:  Cost Model: Found an estimated cost of 6 for instruction: %V2I16 = fptoui <2 x double> undef to <2 x i16>
; AVX512F-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %V4I16 = fptoui <4 x double> undef to <4 x i16>
; AVX512F-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %V8I16 = fptoui <8 x double> undef to <8 x i16>
; AVX512F-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: ret i32 undef
;
; AVX512DQ-LABEL: 'fptoui_double_i16'
; AVX512DQ-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %I16 = fptoui double undef to i16
; AVX512DQ-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %V2I16 = fptoui <2 x double> undef to <2 x i16>
; AVX512DQ-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %V4I16 = fptoui <4 x double> undef to <4 x i16>
; AVX512DQ-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %V8I16 = fptoui <8 x double> undef to <8 x i16>
; AVX512DQ-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: ret i32 undef
;
  %I16 = fptoui double undef to i16
  %V2I16 = fptoui <2 x double> undef to <2 x i16>
  %V4I16 = fptoui <4 x double> undef to <4 x i16>
  %V8I16 = fptoui <8 x double> undef to <8 x i16>
  ret i32 undef
}

define i32 @fptoui_double_i8(i32 %arg) {
; SSE-LABEL: 'fptoui_double_i8'
; SSE-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %I8 = fptoui double undef to i8
; SSE-NEXT:  Cost Model: Found an estimated cost of 6 for instruction: %V2I8 = fptoui <2 x double> undef to <2 x i8>
; SSE-NEXT:  Cost Model: Found an estimated cost of 13 for instruction: %V4I8 = fptoui <4 x double> undef to <4 x i8>
; SSE-NEXT:  Cost Model: Found an estimated cost of 27 for instruction: %V8I8 = fptoui <8 x double> undef to <8 x i8>
; SSE-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: ret i32 undef
;
; AVX-LABEL: 'fptoui_double_i8'
; AVX-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %I8 = fptoui double undef to i8
; AVX-NEXT:  Cost Model: Found an estimated cost of 6 for instruction: %V2I8 = fptoui <2 x double> undef to <2 x i8>
; AVX-NEXT:  Cost Model: Found an estimated cost of 12 for instruction: %V4I8 = fptoui <4 x double> undef to <4 x i8>
; AVX-NEXT:  Cost Model: Found an estimated cost of 25 for instruction: %V8I8 = fptoui <8 x double> undef to <8 x i8>
; AVX-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: ret i32 undef
;
; AVX512F-LABEL: 'fptoui_double_i8'
; AVX512F-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %I8 = fptoui double undef to i8
; AVX512F-NEXT:  Cost Model: Found an estimated cost of 6 for instruction: %V2I8 = fptoui <2 x double> undef to <2 x i8>
; AVX512F-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %V4I8 = fptoui <4 x double> undef to <4 x i8>
; AVX512F-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %V8I8 = fptoui <8 x double> undef to <8 x i8>
; AVX512F-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: ret i32 undef
;
; AVX512DQ-LABEL: 'fptoui_double_i8'
; AVX512DQ-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %I8 = fptoui double undef to i8
; AVX512DQ-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %V2I8 = fptoui <2 x double> undef to <2 x i8>
; AVX512DQ-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %V4I8 = fptoui <4 x double> undef to <4 x i8>
; AVX512DQ-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %V8I8 = fptoui <8 x double> undef to <8 x i8>
; AVX512DQ-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: ret i32 undef
;
  %I8 = fptoui double undef to i8
  %V2I8 = fptoui <2 x double> undef to <2 x i8>
  %V4I8 = fptoui <4 x double> undef to <4 x i8>
  %V8I8 = fptoui <8 x double> undef to <8 x i8>
  ret i32 undef
}

define i32 @fptoui_float_i64(i32 %arg) {
; SSE-LABEL: 'fptoui_float_i64'
; SSE-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %I64 = fptoui float undef to i64
; SSE-NEXT:  Cost Model: Found an estimated cost of 12 for instruction: %V2I64 = fptoui <2 x float> undef to <2 x i64>
; SSE-NEXT:  Cost Model: Found an estimated cost of 25 for instruction: %V4I64 = fptoui <4 x float> undef to <4 x i64>
; SSE-NEXT:  Cost Model: Found an estimated cost of 51 for instruction: %V8I64 = fptoui <8 x float> undef to <8 x i64>
; SSE-NEXT:  Cost Model: Found an estimated cost of 103 for instruction: %V16I64 = fptoui <16 x float> undef to <16 x i64>
; SSE-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: ret i32 undef
;
; AVX-LABEL: 'fptoui_float_i64'
; AVX-NEXT:  Cost Model: Found an estimated cost of 4 for instruction: %I64 = fptoui float undef to i64
; AVX-NEXT:  Cost Model: Found an estimated cost of 12 for instruction: %V2I64 = fptoui <2 x float> undef to <2 x i64>
; AVX-NEXT:  Cost Model: Found an estimated cost of 24 for instruction: %V4I64 = fptoui <4 x float> undef to <4 x i64>
; AVX-NEXT:  Cost Model: Found an estimated cost of 49 for instruction: %V8I64 = fptoui <8 x float> undef to <8 x i64>
; AVX-NEXT:  Cost Model: Found an estimated cost of 99 for instruction: %V16I64 = fptoui <16 x float> undef to <16 x i64>
; AVX-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: ret i32 undef
;
; AVX512F-LABEL: 'fptoui_float_i64'
; AVX512F-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %I64 = fptoui float undef to i64
; AVX512F-NEXT:  Cost Model: Found an estimated cost of 6 for instruction: %V2I64 = fptoui <2 x float> undef to <2 x i64>
; AVX512F-NEXT:  Cost Model: Found an estimated cost of 12 for instruction: %V4I64 = fptoui <4 x float> undef to <4 x i64>
; AVX512F-NEXT:  Cost Model: Found an estimated cost of 24 for instruction: %V8I64 = fptoui <8 x float> undef to <8 x i64>
; AVX512F-NEXT:  Cost Model: Found an estimated cost of 49 for instruction: %V16I64 = fptoui <16 x float> undef to <16 x i64>
; AVX512F-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: ret i32 undef
;
; AVX512DQ-LABEL: 'fptoui_float_i64'
; AVX512DQ-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %I64 = fptoui float undef to i64
; AVX512DQ-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %V2I64 = fptoui <2 x float> undef to <2 x i64>
; AVX512DQ-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %V4I64 = fptoui <4 x float> undef to <4 x i64>
; AVX512DQ-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %V8I64 = fptoui <8 x float> undef to <8 x i64>
; AVX512DQ-NEXT:  Cost Model: Found an estimated cost of 3 for instruction: %V16I64 = fptoui <16 x float> undef to <16 x i64>
; AVX512DQ-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: ret i32 undef
;
  %I64 = fptoui float undef to i64
  %V2I64 = fptoui <2 x float> undef to <2 x i64>
  %V4I64 = fptoui <4 x float> undef to <4 x i64>
  %V8I64 = fptoui <8 x float> undef to <8 x i64>
  %V16I64 = fptoui <16 x float> undef to <16 x i64>
  ret i32 undef
}

define i32 @fptoui_float_i32(i32 %arg) {
; SSE-LABEL: 'fptoui_float_i32'
; SSE-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %I32 = fptoui float undef to i32
; SSE-NEXT:  Cost Model: Found an estimated cost of 12 for instruction: %V4I32 = fptoui <4 x float> undef to <4 x i32>
; SSE-NEXT:  Cost Model: Found an estimated cost of 25 for instruction: %V8I32 = fptoui <8 x float> undef to <8 x i32>
; SSE-NEXT:  Cost Model: Found an estimated cost of 51 for instruction: %V16I32 = fptoui <16 x float> undef to <16 x i32>
; SSE-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: ret i32 undef
;
; AVX-LABEL: 'fptoui_float_i32'
; AVX-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %I32 = fptoui float undef to i32
; AVX-NEXT:  Cost Model: Found an estimated cost of 12 for instruction: %V4I32 = fptoui <4 x float> undef to <4 x i32>
; AVX-NEXT:  Cost Model: Found an estimated cost of 32 for instruction: %V8I32 = fptoui <8 x float> undef to <8 x i32>
; AVX-NEXT:  Cost Model: Found an estimated cost of 65 for instruction: %V16I32 = fptoui <16 x float> undef to <16 x i32>
; AVX-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: ret i32 undef
;
; AVX512-LABEL: 'fptoui_float_i32'
; AVX512-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %I32 = fptoui float undef to i32
; AVX512-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %V4I32 = fptoui <4 x float> undef to <4 x i32>
; AVX512-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %V8I32 = fptoui <8 x float> undef to <8 x i32>
; AVX512-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %V16I32 = fptoui <16 x float> undef to <16 x i32>
; AVX512-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: ret i32 undef
;
  %I32 = fptoui float undef to i32
  %V4I32 = fptoui <4 x float> undef to <4 x i32>
  %V8I32 = fptoui <8 x float> undef to <8 x i32>
  %V16I32 = fptoui <16 x float> undef to <16 x i32>
  ret i32 undef
}

define i32 @fptoui_float_i16(i32 %arg) {
; SSE-LABEL: 'fptoui_float_i16'
; SSE-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %I16 = fptoui float undef to i16
; SSE-NEXT:  Cost Model: Found an estimated cost of 12 for instruction: %V4I16 = fptoui <4 x float> undef to <4 x i16>
; SSE-NEXT:  Cost Model: Found an estimated cost of 25 for instruction: %V8I16 = fptoui <8 x float> undef to <8 x i16>
; SSE-NEXT:  Cost Model: Found an estimated cost of 51 for instruction: %V16I16 = fptoui <16 x float> undef to <16 x i16>
; SSE-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: ret i32 undef
;
; AVX-LABEL: 'fptoui_float_i16'
; AVX-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %I16 = fptoui float undef to i16
; AVX-NEXT:  Cost Model: Found an estimated cost of 12 for instruction: %V4I16 = fptoui <4 x float> undef to <4 x i16>
; AVX-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %V8I16 = fptoui <8 x float> undef to <8 x i16>
; AVX-NEXT:  Cost Model: Found an estimated cost of 3 for instruction: %V16I16 = fptoui <16 x float> undef to <16 x i16>
; AVX-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: ret i32 undef
;
; AVX512-LABEL: 'fptoui_float_i16'
; AVX512-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %I16 = fptoui float undef to i16
; AVX512-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %V4I16 = fptoui <4 x float> undef to <4 x i16>
; AVX512-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %V8I16 = fptoui <8 x float> undef to <8 x i16>
; AVX512-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %V16I16 = fptoui <16 x float> undef to <16 x i16>
; AVX512-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: ret i32 undef
;
  %I16 = fptoui float undef to i16
  %V4I16 = fptoui <4 x float> undef to <4 x i16>
  %V8I16 = fptoui <8 x float> undef to <8 x i16>
  %V16I16 = fptoui <16 x float> undef to <16 x i16>
  ret i32 undef
}

define i32 @fptoui_float_i8(i32 %arg) {
; SSE-LABEL: 'fptoui_float_i8'
; SSE-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %I8 = fptoui float undef to i8
; SSE-NEXT:  Cost Model: Found an estimated cost of 12 for instruction: %V4I8 = fptoui <4 x float> undef to <4 x i8>
; SSE-NEXT:  Cost Model: Found an estimated cost of 25 for instruction: %V8I8 = fptoui <8 x float> undef to <8 x i8>
; SSE-NEXT:  Cost Model: Found an estimated cost of 51 for instruction: %V16I8 = fptoui <16 x float> undef to <16 x i8>
; SSE-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: ret i32 undef
;
; AVX-LABEL: 'fptoui_float_i8'
; AVX-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %I8 = fptoui float undef to i8
; AVX-NEXT:  Cost Model: Found an estimated cost of 12 for instruction: %V4I8 = fptoui <4 x float> undef to <4 x i8>
; AVX-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %V8I8 = fptoui <8 x float> undef to <8 x i8>
; AVX-NEXT:  Cost Model: Found an estimated cost of 3 for instruction: %V16I8 = fptoui <16 x float> undef to <16 x i8>
; AVX-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: ret i32 undef
;
; AVX512-LABEL: 'fptoui_float_i8'
; AVX512-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %I8 = fptoui float undef to i8
; AVX512-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %V4I8 = fptoui <4 x float> undef to <4 x i8>
; AVX512-NEXT:  Cost Model: Found an estimated cost of 1 for instruction: %V8I8 = fptoui <8 x float> undef to <8 x i8>
; AVX512-NEXT:  Cost Model: Found an estimated cost of 2 for instruction: %V16I8 = fptoui <16 x float> undef to <16 x i8>
; AVX512-NEXT:  Cost Model: Found an estimated cost of 0 for instruction: ret i32 undef
;
  %I8 = fptoui float undef to i8
  %V4I8 = fptoui <4 x float> undef to <4 x i8>
  %V8I8 = fptoui <8 x float> undef to <8 x i8>
  %V16I8 = fptoui <16 x float> undef to <16 x i8>
  ret i32 undef
}
