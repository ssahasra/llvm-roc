; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; REQUIRES: asserts
; RUN: llc < %s -mtriple=powerpc64le -debug-only=isel -o /dev/null 2>&1                        | FileCheck %s --check-prefix=FMFDEBUG
; RUN: llc < %s -mtriple=powerpc64le                                                           | FileCheck %s --check-prefix=FMF
; RUN: llc < %s -mtriple=powerpc64le -debug-only=isel -o /dev/null 2>&1 -enable-unsafe-fp-math | FileCheck %s --check-prefix=GLOBALDEBUG
; RUN: llc < %s -mtriple=powerpc64le -enable-unsafe-fp-math                                    | FileCheck %s --check-prefix=GLOBAL

; Test FP transforms using instruction/node-level fast-math-flags.
; We're also checking debug output to verify that FMF is propagated to the newly created nodes.
; The run with the global unsafe param tests the pre-FMF behavior using regular instructions/nodes.

declare float @llvm.fma.f32(float, float, float)
declare float @llvm.sqrt.f32(float)

; X * Y + Z --> fma(X, Y, Z)

; FMFDEBUG-LABEL: Optimized lowered selection DAG: %bb.0 'fmul_fadd_contract1:'
; FMFDEBUG:         fmul {{t[0-9]+}}, {{t[0-9]+}}
; FMFDEBUG:         fadd contract {{t[0-9]+}}, {{t[0-9]+}}
; FMFDEBUG:       Type-legalized selection DAG: %bb.0 'fmul_fadd_contract1:'

define float @fmul_fadd_contract1(float %x, float %y, float %z) {
; FMF-LABEL: fmul_fadd_contract1:
; FMF:       # %bb.0:
; FMF-NEXT:    xsmulsp 0, 1, 2
; FMF-NEXT:    xsaddsp 1, 0, 3
; FMF-NEXT:    blr
;
; GLOBAL-LABEL: fmul_fadd_contract1:
; GLOBAL:       # %bb.0:
; GLOBAL-NEXT:    xsmaddasp 3, 1, 2
; GLOBAL-NEXT:    fmr 1, 3
; GLOBAL-NEXT:    blr
  %mul = fmul float %x, %y
  %add = fadd contract float %mul, %z
  ret float %add
}

; This shouldn't change anything - the intermediate fmul result is now also flagged.

; FMFDEBUG-LABEL: Optimized lowered selection DAG: %bb.0 'fmul_fadd_contract2:'
; FMFDEBUG:         fma {{t[0-9]+}}, {{t[0-9]+}}, {{t[0-9]+}}
; FMFDEBUG:       Type-legalized selection DAG: %bb.0 'fmul_fadd_contract2:'

define float @fmul_fadd_contract2(float %x, float %y, float %z) {
; FMF-LABEL: fmul_fadd_contract2:
; FMF:       # %bb.0:
; FMF-NEXT:    xsmaddasp 3, 1, 2
; FMF-NEXT:    fmr 1, 3
; FMF-NEXT:    blr
;
; GLOBAL-LABEL: fmul_fadd_contract2:
; GLOBAL:       # %bb.0:
; GLOBAL-NEXT:    xsmaddasp 3, 1, 2
; GLOBAL-NEXT:    fmr 1, 3
; GLOBAL-NEXT:    blr
  %mul = fmul contract float %x, %y
  %add = fadd contract float %mul, %z
  ret float %add
}

; Reassociation implies that FMA contraction is allowed.

; FMFDEBUG-LABEL: Optimized lowered selection DAG: %bb.0 'fmul_fadd_reassoc1:'
; FMFDEBUG:         fmul {{t[0-9]+}}, {{t[0-9]+}}
; FMFDEBUG:         fadd reassoc {{t[0-9]+}}, {{t[0-9]+}}
; FMFDEBUG:       Type-legalized selection DAG: %bb.0 'fmul_fadd_reassoc1:'

define float @fmul_fadd_reassoc1(float %x, float %y, float %z) {
; FMF-LABEL: fmul_fadd_reassoc1:
; FMF:       # %bb.0:
; FMF-NEXT:    xsmulsp 0, 1, 2
; FMF-NEXT:    xsaddsp 1, 0, 3
; FMF-NEXT:    blr
;
; GLOBAL-LABEL: fmul_fadd_reassoc1:
; GLOBAL:       # %bb.0:
; GLOBAL-NEXT:    xsmaddasp 3, 1, 2
; GLOBAL-NEXT:    fmr 1, 3
; GLOBAL-NEXT:    blr
  %mul = fmul float %x, %y
  %add = fadd reassoc float %mul, %z
  ret float %add
}

; This shouldn't change anything - the intermediate fmul result is now also flagged.

; FMFDEBUG-LABEL: Optimized lowered selection DAG: %bb.0 'fmul_fadd_reassoc2:'
; FMFDEBUG:         fma {{t[0-9]+}}, {{t[0-9]+}}
; FMFDEBUG:       Type-legalized selection DAG: %bb.0 'fmul_fadd_reassoc2:'

define float @fmul_fadd_reassoc2(float %x, float %y, float %z) {
; FMF-LABEL: fmul_fadd_reassoc2:
; FMF:       # %bb.0:
; FMF-NEXT:    xsmaddasp 3, 1, 2
; FMF-NEXT:    fmr 1, 3
; FMF-NEXT:    blr
;
; GLOBAL-LABEL: fmul_fadd_reassoc2:
; GLOBAL:       # %bb.0:
; GLOBAL-NEXT:    xsmaddasp 3, 1, 2
; GLOBAL-NEXT:    fmr 1, 3
; GLOBAL-NEXT:    blr
  %mul = fmul reassoc float %x, %y
  %add = fadd reassoc float %mul, %z
  ret float %add
}

; The fadd is now fully 'fast'. This implies that contraction is allowed.

; FMFDEBUG-LABEL: Optimized lowered selection DAG: %bb.0 'fmul_fadd_fast1:'
; FMFDEBUG:         fma {{t[0-9]+}}, {{t[0-9]+}}, {{t[0-9]+}}
; FMFDEBUG:       Type-legalized selection DAG: %bb.0 'fmul_fadd_fast1:'

define float @fmul_fadd_fast1(float %x, float %y, float %z) {
; FMF-LABEL: fmul_fadd_fast1:
; FMF:       # %bb.0:
; FMF-NEXT:    xsmaddasp 3, 1, 2
; FMF-NEXT:    fmr 1, 3
; FMF-NEXT:    blr
;
; GLOBAL-LABEL: fmul_fadd_fast1:
; GLOBAL:       # %bb.0:
; GLOBAL-NEXT:    xsmaddasp 3, 1, 2
; GLOBAL-NEXT:    fmr 1, 3
; GLOBAL-NEXT:    blr
  %mul = fmul fast float %x, %y
  %add = fadd fast float %mul, %z
  ret float %add
}

; This shouldn't change anything - the intermediate fmul result is now also flagged.

; FMFDEBUG-LABEL: Optimized lowered selection DAG: %bb.0 'fmul_fadd_fast2:'
; FMFDEBUG:         fma {{t[0-9]+}}, {{t[0-9]+}}, {{t[0-9]+}}
; FMFDEBUG:       Type-legalized selection DAG: %bb.0 'fmul_fadd_fast2:'

define float @fmul_fadd_fast2(float %x, float %y, float %z) {
; FMF-LABEL: fmul_fadd_fast2:
; FMF:       # %bb.0:
; FMF-NEXT:    xsmaddasp 3, 1, 2
; FMF-NEXT:    fmr 1, 3
; FMF-NEXT:    blr
;
; GLOBAL-LABEL: fmul_fadd_fast2:
; GLOBAL:       # %bb.0:
; GLOBAL-NEXT:    xsmaddasp 3, 1, 2
; GLOBAL-NEXT:    fmr 1, 3
; GLOBAL-NEXT:    blr
  %mul = fmul fast float %x, %y
  %add = fadd fast float %mul, %z
  ret float %add
}

; fma(X, 7.0, X * 42.0) --> X * 49.0
; This is the minimum FMF needed for this transform - the FMA allows reassociation.

; FMFDEBUG-LABEL: Optimized lowered selection DAG: %bb.0 'fmul_fma_reassoc1:'
; FMFDEBUG:         fma {{t[0-9]+}}
; FMFDEBUG:       Type-legalized selection DAG: %bb.0 'fmul_fma_reassoc1:'

; GLOBALDEBUG-LABEL: Optimized lowered selection DAG: %bb.0 'fmul_fma_reassoc1:'
; GLOBALDEBUG:         fmul reassoc {{t[0-9]+}}
; GLOBALDEBUG:       Type-legalized selection DAG: %bb.0 'fmul_fma_reassoc1:'

define float @fmul_fma_reassoc1(float %x) {
; FMF-LABEL: fmul_fma_reassoc1:
; FMF:       # %bb.0:
; FMF-NEXT:    addis 3, 2, .LCPI6_0@toc@ha
; FMF-NEXT:    addi 3, 3, .LCPI6_0@toc@l
; FMF-NEXT:    lfsx 0, 0, 3
; FMF-NEXT:    addis 3, 2, .LCPI6_1@toc@ha
; FMF-NEXT:    addi 3, 3, .LCPI6_1@toc@l
; FMF-NEXT:    lfsx 2, 0, 3
; FMF-NEXT:    xsmulsp 0, 1, 0
; FMF-NEXT:    xsmaddasp 0, 1, 2
; FMF-NEXT:    fmr 1, 0
; FMF-NEXT:    blr
;
; GLOBAL-LABEL: fmul_fma_reassoc1:
; GLOBAL:       # %bb.0:
; GLOBAL-NEXT:    addis 3, 2, .LCPI6_0@toc@ha
; GLOBAL-NEXT:    addi 3, 3, .LCPI6_0@toc@l
; GLOBAL-NEXT:    lfsx 0, 0, 3
; GLOBAL-NEXT:    xsmulsp 1, 1, 0
; GLOBAL-NEXT:    blr
  %mul = fmul float %x, 42.0
  %fma = call reassoc float @llvm.fma.f32(float %x, float 7.0, float %mul)
  ret float %fma
}

; This shouldn't change anything - the intermediate fmul result is now also flagged.

; FMFDEBUG-LABEL: Optimized lowered selection DAG: %bb.0 'fmul_fma_reassoc2:'
; FMFDEBUG:         fma {{t[0-9]+}}
; FMFDEBUG:       Type-legalized selection DAG: %bb.0 'fmul_fma_reassoc2:'

; GLOBALDEBUG-LABEL: Optimized lowered selection DAG: %bb.0 'fmul_fma_reassoc2:'
; GLOBALDEBUG:         fmul reassoc {{t[0-9]+}}
; GLOBALDEBUG:       Type-legalized selection DAG: %bb.0 'fmul_fma_reassoc2:'

define float @fmul_fma_reassoc2(float %x) {
; FMF-LABEL: fmul_fma_reassoc2:
; FMF:       # %bb.0:
; FMF-NEXT:    addis 3, 2, .LCPI7_0@toc@ha
; FMF-NEXT:    addi 3, 3, .LCPI7_0@toc@l
; FMF-NEXT:    lfsx 0, 0, 3
; FMF-NEXT:    addis 3, 2, .LCPI7_1@toc@ha
; FMF-NEXT:    addi 3, 3, .LCPI7_1@toc@l
; FMF-NEXT:    lfsx 2, 0, 3
; FMF-NEXT:    xsmulsp 0, 1, 0
; FMF-NEXT:    xsmaddasp 0, 1, 2
; FMF-NEXT:    fmr 1, 0
; FMF-NEXT:    blr
;
; GLOBAL-LABEL: fmul_fma_reassoc2:
; GLOBAL:       # %bb.0:
; GLOBAL-NEXT:    addis 3, 2, .LCPI7_0@toc@ha
; GLOBAL-NEXT:    addi 3, 3, .LCPI7_0@toc@l
; GLOBAL-NEXT:    lfsx 0, 0, 3
; GLOBAL-NEXT:    xsmulsp 1, 1, 0
; GLOBAL-NEXT:    blr
  %mul = fmul reassoc float %x, 42.0
  %fma = call reassoc float @llvm.fma.f32(float %x, float 7.0, float %mul)
  ret float %fma
}

; The FMA is now fully 'fast'. This implies that reassociation is allowed.

; FMFDEBUG-LABEL: Optimized lowered selection DAG: %bb.0 'fmul_fma_fast1:'
; FMFDEBUG:         fma {{t[0-9]+}}
; FMFDEBUG:       Type-legalized selection DAG: %bb.0 'fmul_fma_fast1:'

; GLOBALDEBUG-LABEL: Optimized lowered selection DAG: %bb.0 'fmul_fma_fast1:'
; GLOBALDEBUG:         fmul reassoc {{t[0-9]+}}
; GLOBALDEBUG:       Type-legalized selection DAG: %bb.0 'fmul_fma_fast1:'

define float @fmul_fma_fast1(float %x) {
; FMF-LABEL: fmul_fma_fast1:
; FMF:       # %bb.0:
; FMF-NEXT:    addis 3, 2, .LCPI8_0@toc@ha
; FMF-NEXT:    addi 3, 3, .LCPI8_0@toc@l
; FMF-NEXT:    lfsx 0, 0, 3
; FMF-NEXT:    addis 3, 2, .LCPI8_1@toc@ha
; FMF-NEXT:    addi 3, 3, .LCPI8_1@toc@l
; FMF-NEXT:    lfsx 2, 0, 3
; FMF-NEXT:    xsmulsp 0, 1, 0
; FMF-NEXT:    xsmaddasp 0, 1, 2
; FMF-NEXT:    fmr 1, 0
; FMF-NEXT:    blr
;
; GLOBAL-LABEL: fmul_fma_fast1:
; GLOBAL:       # %bb.0:
; GLOBAL-NEXT:    addis 3, 2, .LCPI8_0@toc@ha
; GLOBAL-NEXT:    addi 3, 3, .LCPI8_0@toc@l
; GLOBAL-NEXT:    lfsx 0, 0, 3
; GLOBAL-NEXT:    xsmulsp 1, 1, 0
; GLOBAL-NEXT:    blr
  %mul = fmul float %x, 42.0
  %fma = call fast float @llvm.fma.f32(float %x, float 7.0, float %mul)
  ret float %fma
}

; This shouldn't change anything - the intermediate fmul result is now also flagged.

; FMFDEBUG-LABEL: Optimized lowered selection DAG: %bb.0 'fmul_fma_fast2:'
; FMFDEBUG:         fma {{t[0-9]+}}
; FMFDEBUG:       Type-legalized selection DAG: %bb.0 'fmul_fma_fast2:'

; GLOBALDEBUG-LABEL: Optimized lowered selection DAG: %bb.0 'fmul_fma_fast2:'
; GLOBALDEBUG:         fmul reassoc {{t[0-9]+}}
; GLOBALDEBUG:       Type-legalized selection DAG: %bb.0 'fmul_fma_fast2:'

define float @fmul_fma_fast2(float %x) {
; FMF-LABEL: fmul_fma_fast2:
; FMF:       # %bb.0:
; FMF-NEXT:    addis 3, 2, .LCPI9_0@toc@ha
; FMF-NEXT:    addi 3, 3, .LCPI9_0@toc@l
; FMF-NEXT:    lfsx 0, 0, 3
; FMF-NEXT:    addis 3, 2, .LCPI9_1@toc@ha
; FMF-NEXT:    addi 3, 3, .LCPI9_1@toc@l
; FMF-NEXT:    lfsx 2, 0, 3
; FMF-NEXT:    xsmulsp 0, 1, 0
; FMF-NEXT:    xsmaddasp 0, 1, 2
; FMF-NEXT:    fmr 1, 0
; FMF-NEXT:    blr
;
; GLOBAL-LABEL: fmul_fma_fast2:
; GLOBAL:       # %bb.0:
; GLOBAL-NEXT:    addis 3, 2, .LCPI9_0@toc@ha
; GLOBAL-NEXT:    addi 3, 3, .LCPI9_0@toc@l
; GLOBAL-NEXT:    lfsx 0, 0, 3
; GLOBAL-NEXT:    xsmulsp 1, 1, 0
; GLOBAL-NEXT:    blr
  %mul = fmul fast float %x, 42.0
  %fma = call fast float @llvm.fma.f32(float %x, float 7.0, float %mul)
  ret float %fma
}

; Reduced precision for sqrt is allowed - should use estimate and NR iterations.

; FMFDEBUG-LABEL: Optimized lowered selection DAG: %bb.0 'sqrt_afn:'
; FMFDEBUG:         fsqrt {{t[0-9]+}}
; FMFDEBUG:       Type-legalized selection DAG: %bb.0 'sqrt_afn:'

; GLOBALDEBUG-LABEL: Optimized lowered selection DAG: %bb.0 'sqrt_afn:'
; GLOBALDEBUG:         fmul reassoc {{t[0-9]+}}
; GLOBALDEBUG:       Type-legalized selection DAG: %bb.0 'sqrt_afn:'

define float @sqrt_afn(float %x) {
; FMF-LABEL: sqrt_afn:
; FMF:       # %bb.0:
; FMF-NEXT:    xssqrtsp 1, 1
; FMF-NEXT:    blr
;
; GLOBAL-LABEL: sqrt_afn:
; GLOBAL:       # %bb.0:
; GLOBAL-NEXT:    xxlxor 0, 0, 0
; GLOBAL-NEXT:    fcmpu 0, 1, 0
; GLOBAL-NEXT:    beq 0, .LBB10_2
; GLOBAL-NEXT:  # %bb.1:
; GLOBAL-NEXT:    xsrsqrtesp 2, 1
; GLOBAL-NEXT:    addis 3, 2, .LCPI10_0@toc@ha
; GLOBAL-NEXT:    fneg 0, 1
; GLOBAL-NEXT:    fmr 4, 1
; GLOBAL-NEXT:    addi 3, 3, .LCPI10_0@toc@l
; GLOBAL-NEXT:    lfsx 3, 0, 3
; GLOBAL-NEXT:    xsmaddasp 4, 0, 3
; GLOBAL-NEXT:    xsmulsp 0, 2, 2
; GLOBAL-NEXT:    xsmaddasp 3, 4, 0
; GLOBAL-NEXT:    xsmulsp 0, 2, 3
; GLOBAL-NEXT:    xsmulsp 0, 0, 1
; GLOBAL-NEXT:  .LBB10_2:
; GLOBAL-NEXT:    fmr 1, 0
; GLOBAL-NEXT:    blr
  %rt = call afn float @llvm.sqrt.f32(float %x)
  ret float %rt
}

; The call is now fully 'fast'. This implies that approximation is allowed.

; FMFDEBUG-LABEL: Optimized lowered selection DAG: %bb.0 'sqrt_fast:'
; FMFDEBUG:         fsqrt {{t[0-9]+}}
; FMFDEBUG:       Type-legalized selection DAG: %bb.0 'sqrt_fast:'

; GLOBALDEBUG-LABEL: Optimized lowered selection DAG: %bb.0 'sqrt_fast:'
; GLOBALDEBUG:         fmul reassoc {{t[0-9]+}}
; GLOBALDEBUG:       Type-legalized selection DAG: %bb.0 'sqrt_fast:'

define float @sqrt_fast(float %x) {
; FMF-LABEL: sqrt_fast:
; FMF:       # %bb.0:
; FMF-NEXT:    xssqrtsp 1, 1
; FMF-NEXT:    blr
;
; GLOBAL-LABEL: sqrt_fast:
; GLOBAL:       # %bb.0:
; GLOBAL-NEXT:    xxlxor 0, 0, 0
; GLOBAL-NEXT:    fcmpu 0, 1, 0
; GLOBAL-NEXT:    beq 0, .LBB11_2
; GLOBAL-NEXT:  # %bb.1:
; GLOBAL-NEXT:    xsrsqrtesp 2, 1
; GLOBAL-NEXT:    addis 3, 2, .LCPI11_0@toc@ha
; GLOBAL-NEXT:    fneg 0, 1
; GLOBAL-NEXT:    fmr 4, 1
; GLOBAL-NEXT:    addi 3, 3, .LCPI11_0@toc@l
; GLOBAL-NEXT:    lfsx 3, 0, 3
; GLOBAL-NEXT:    xsmaddasp 4, 0, 3
; GLOBAL-NEXT:    xsmulsp 0, 2, 2
; GLOBAL-NEXT:    xsmaddasp 3, 4, 0
; GLOBAL-NEXT:    xsmulsp 0, 2, 3
; GLOBAL-NEXT:    xsmulsp 0, 0, 1
; GLOBAL-NEXT:  .LBB11_2:
; GLOBAL-NEXT:    fmr 1, 0
; GLOBAL-NEXT:    blr
  %rt = call fast float @llvm.sqrt.f32(float %x)
  ret float %rt
}

