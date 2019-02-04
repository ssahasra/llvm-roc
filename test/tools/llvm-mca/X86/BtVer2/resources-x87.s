# NOTE: Assertions have been autogenerated by utils/update_mca_test_checks.py
# RUN: llvm-mca -mtriple=x86_64-unknown-unknown -mcpu=btver2 -instruction-tables < %s | FileCheck %s

f2xm1

fabs

fadd %st, %st(1)
fadd %st(2)
fadds (%ecx)
faddl (%ecx)
faddp %st(1)
faddp %st(2)
fiadds (%ecx)
fiaddl (%ecx)

fbld (%ecx)
fbstp (%eax)

fchs

fnclex

fcmovb %st(1), %st
fcmovbe %st(1), %st
fcmove %st(1), %st
fcmovnb %st(1), %st
fcmovnbe %st(1), %st
fcmovne %st(1), %st
fcmovnu %st(1), %st
fcmovu %st(1), %st

fcom %st(1)
fcom %st(3)
fcoms (%ecx)
fcoml (%eax)
fcomp %st(1)
fcomp %st(3)
fcomps (%ecx)
fcompl (%eax)
fcompp

fcomi %st(3)
fcompi %st(3)

fcos

fdecstp

fdiv %st, %st(1)
fdiv %st(2)
fdivs (%ecx)
fdivl (%eax)
fdivp %st(1)
fdivp %st(2)
fidivs (%ecx)
fidivl (%eax)

fdivr %st, %st(1)
fdivr %st(2)
fdivrs (%ecx)
fdivrl (%eax)
fdivrp %st(1)
fdivrp %st(2)
fidivrs (%ecx)
fidivrl (%eax)

ffree %st(0)

ficoms (%ecx)
ficoml (%eax)
ficomps (%ecx)
ficompl (%eax)

filds (%edx)
fildl (%ecx)
fildll (%eax)

fincstp

fninit

fists (%edx)
fistl (%ecx)
fistps (%edx)
fistpl (%ecx)
fistpll (%eax)

fisttps (%edx)
fisttpl (%ecx)
fisttpll (%eax)

fld %st(0)
flds (%edx)
fldl (%ecx)
fldt (%eax)

fldcw (%eax)
fldenv (%eax)

fld1
fldl2e
fldl2t
fldlg2
fldln2
fldpi
fldz

fmul %st, %st(1)
fmul %st(2)
fmuls (%ecx)
fmull (%eax)
fmulp %st(1)
fmulp %st(2)
fimuls (%ecx)
fimull (%eax)

fnop

fpatan

fprem
fprem1

fptan

frndint

frstor (%eax)

fnsave (%eax)

fscale

fsin

fsincos

fsqrt

fst %st(0)
fsts (%edx)
fstl (%ecx)
fstp %st(0)
fstpl (%edx)
fstpl (%ecx)
fstpt (%eax)

fnstcw (%eax)
fnstenv (%eax)
fnstsw (%eax)

frstor (%eax)
fsave (%eax)

fsub %st, %st(1)
fsub %st(2)
fsubs (%ecx)
fsubl (%eax)
fsubp %st(1)
fsubp %st(2)
fisubs (%ecx)
fisubl (%eax)

fsubr %st, %st(1)
fsubr %st(2)
fsubrs (%ecx)
fsubrl (%eax)
fsubrp %st(1)
fsubrp %st(2)
fisubrs (%ecx)
fisubrl (%eax)

ftst

fucom %st(1)
fucom %st(3)
fucomp %st(1)
fucomp %st(3)
fucompp

fucomi %st(3)
fucompi %st(3)

fwait

fxam

fxch %st(1)
fxch %st(3)

fxrstor (%eax)
fxsave (%eax)

fxtract

fyl2x
fyl2xp1

# CHECK:      Instruction Info:
# CHECK-NEXT: [1]: #uOps
# CHECK-NEXT: [2]: Latency
# CHECK-NEXT: [3]: RThroughput
# CHECK-NEXT: [4]: MayLoad
# CHECK-NEXT: [5]: MayStore
# CHECK-NEXT: [6]: HasSideEffects (U)

# CHECK:      [1]    [2]    [3]    [4]    [5]    [6]    Instructions:
# CHECK-NEXT:  1      100   0.50                  U     f2xm1
# CHECK-NEXT:  1      2     1.00                  U     fabs
# CHECK-NEXT:  1      3     1.00                  U     fadd	%st, %st(1)
# CHECK-NEXT:  1      3     1.00                  U     fadd	%st(2)
# CHECK-NEXT:  1      8     1.00    *             U     fadds	(%ecx)
# CHECK-NEXT:  1      8     1.00    *             U     faddl	(%ecx)
# CHECK-NEXT:  1      3     1.00                  U     faddp	%st(1)
# CHECK-NEXT:  1      3     1.00                  U     faddp	%st(2)
# CHECK-NEXT:  1      8     1.00    *             U     fiadds	(%ecx)
# CHECK-NEXT:  1      8     1.00    *             U     fiaddl	(%ecx)
# CHECK-NEXT:  1      100   0.50                  U     fbld	(%ecx)
# CHECK-NEXT:  1      100   0.50                  U     fbstp	(%eax)
# CHECK-NEXT:  1      2     1.00                  U     fchs
# CHECK-NEXT:  1      100   0.50                  U     fnclex
# CHECK-NEXT:  1      3     1.00                  U     fcmovb	%st(1), %st
# CHECK-NEXT:  1      3     1.00                  U     fcmovbe	%st(1), %st
# CHECK-NEXT:  1      3     1.00                  U     fcmove	%st(1), %st
# CHECK-NEXT:  1      3     1.00                  U     fcmovnb	%st(1), %st
# CHECK-NEXT:  1      3     1.00                  U     fcmovnbe	%st(1), %st
# CHECK-NEXT:  1      3     1.00                  U     fcmovne	%st(1), %st
# CHECK-NEXT:  1      3     1.00                  U     fcmovnu	%st(1), %st
# CHECK-NEXT:  1      3     1.00                  U     fcmovu	%st(1), %st
# CHECK-NEXT:  1      3     1.00                  U     fcom	%st(1)
# CHECK-NEXT:  1      3     1.00                  U     fcom	%st(3)
# CHECK-NEXT:  1      8     1.00                  U     fcoms	(%ecx)
# CHECK-NEXT:  1      8     1.00                  U     fcoml	(%eax)
# CHECK-NEXT:  1      3     1.00                  U     fcomp	%st(1)
# CHECK-NEXT:  1      3     1.00                  U     fcomp	%st(3)
# CHECK-NEXT:  1      8     1.00                  U     fcomps	(%ecx)
# CHECK-NEXT:  1      8     1.00                  U     fcompl	(%eax)
# CHECK-NEXT:  1      100   0.50                  U     fcompp
# CHECK-NEXT:  1      3     1.00                  U     fcomi	%st(3)
# CHECK-NEXT:  1      3     1.00                  U     fcompi	%st(3)
# CHECK-NEXT:  1      100   0.50                  U     fcos
# CHECK-NEXT:  1      100   0.50                  U     fdecstp
# CHECK-NEXT:  1      19    19.00                 U     fdiv	%st, %st(1)
# CHECK-NEXT:  1      19    19.00                 U     fdiv	%st(2)
# CHECK-NEXT:  1      24    19.00   *             U     fdivs	(%ecx)
# CHECK-NEXT:  1      24    19.00   *             U     fdivl	(%eax)
# CHECK-NEXT:  1      19    19.00                 U     fdivp	%st(1)
# CHECK-NEXT:  1      19    19.00                 U     fdivp	%st(2)
# CHECK-NEXT:  1      24    19.00   *             U     fidivs	(%ecx)
# CHECK-NEXT:  1      24    19.00   *             U     fidivl	(%eax)
# CHECK-NEXT:  1      19    19.00                 U     fdivr	%st, %st(1)
# CHECK-NEXT:  1      19    19.00                 U     fdivr	%st(2)
# CHECK-NEXT:  1      24    19.00   *             U     fdivrs	(%ecx)
# CHECK-NEXT:  1      24    19.00   *             U     fdivrl	(%eax)
# CHECK-NEXT:  1      19    19.00                 U     fdivrp	%st(1)
# CHECK-NEXT:  1      19    19.00                 U     fdivrp	%st(2)
# CHECK-NEXT:  1      24    19.00   *             U     fidivrs	(%ecx)
# CHECK-NEXT:  1      24    19.00   *             U     fidivrl	(%eax)
# CHECK-NEXT:  1      100   0.50                  U     ffree	%st(0)
# CHECK-NEXT:  1      8     1.00                  U     ficoms	(%ecx)
# CHECK-NEXT:  1      8     1.00                  U     ficoml	(%eax)
# CHECK-NEXT:  1      8     1.00                  U     ficomps	(%ecx)
# CHECK-NEXT:  1      8     1.00                  U     ficompl	(%eax)
# CHECK-NEXT:  1      3     1.00    *             U     filds	(%edx)
# CHECK-NEXT:  1      3     1.00    *             U     fildl	(%ecx)
# CHECK-NEXT:  1      3     1.00    *             U     fildll	(%eax)
# CHECK-NEXT:  1      100   0.50                  U     fincstp
# CHECK-NEXT:  1      100   0.50                  U     fninit
# CHECK-NEXT:  1      1     1.00           *      U     fists	(%edx)
# CHECK-NEXT:  1      1     1.00           *      U     fistl	(%ecx)
# CHECK-NEXT:  1      1     1.00           *      U     fistps	(%edx)
# CHECK-NEXT:  1      1     1.00           *      U     fistpl	(%ecx)
# CHECK-NEXT:  1      1     1.00           *      U     fistpll	(%eax)
# CHECK-NEXT:  1      1     1.00           *      U     fisttps	(%edx)
# CHECK-NEXT:  1      1     1.00           *      U     fisttpl	(%ecx)
# CHECK-NEXT:  1      1     1.00           *      U     fisttpll	(%eax)
# CHECK-NEXT:  1      1     0.50                  U     fld	%st(0)
# CHECK-NEXT:  1      3     1.00    *             U     flds	(%edx)
# CHECK-NEXT:  1      3     1.00    *             U     fldl	(%ecx)
# CHECK-NEXT:  1      3     1.00    *             U     fldt	(%eax)
# CHECK-NEXT:  1      3     1.00    *             U     fldcw	(%eax)
# CHECK-NEXT:  1      100   0.50                  U     fldenv	(%eax)
# CHECK-NEXT:  1      3     1.00                  U     fld1
# CHECK-NEXT:  1      3     1.00                  U     fldl2e
# CHECK-NEXT:  1      3     1.00                  U     fldl2t
# CHECK-NEXT:  1      3     1.00                  U     fldlg2
# CHECK-NEXT:  1      3     1.00                  U     fldln2
# CHECK-NEXT:  1      3     1.00                  U     fldpi
# CHECK-NEXT:  1      3     1.00                  U     fldz
# CHECK-NEXT:  1      2     1.00                  U     fmul	%st, %st(1)
# CHECK-NEXT:  1      2     1.00                  U     fmul	%st(2)
# CHECK-NEXT:  1      7     1.00    *             U     fmuls	(%ecx)
# CHECK-NEXT:  1      7     1.00    *             U     fmull	(%eax)
# CHECK-NEXT:  1      2     1.00                  U     fmulp	%st(1)
# CHECK-NEXT:  1      2     1.00                  U     fmulp	%st(2)
# CHECK-NEXT:  1      7     1.00    *             U     fimuls	(%ecx)
# CHECK-NEXT:  1      7     1.00    *             U     fimull	(%eax)
# CHECK-NEXT:  1      1     0.50                  U     fnop
# CHECK-NEXT:  1      100   0.50                  U     fpatan
# CHECK-NEXT:  1      100   0.50                  U     fprem
# CHECK-NEXT:  1      100   0.50                  U     fprem1
# CHECK-NEXT:  1      100   0.50                  U     fptan
# CHECK-NEXT:  1      100   0.50                  U     frndint
# CHECK-NEXT:  1      100   0.50                  U     frstor	(%eax)
# CHECK-NEXT:  1      100   0.50                  U     fnsave	(%eax)
# CHECK-NEXT:  1      100   0.50                  U     fscale
# CHECK-NEXT:  1      100   0.50                  U     fsin
# CHECK-NEXT:  1      100   0.50                  U     fsincos
# CHECK-NEXT:  1      35    35.00                 U     fsqrt
# CHECK-NEXT:  1      1     0.50                  U     fst	%st(0)
# CHECK-NEXT:  1      1     1.00           *      U     fsts	(%edx)
# CHECK-NEXT:  1      1     1.00           *      U     fstl	(%ecx)
# CHECK-NEXT:  1      1     0.50                  U     fstp	%st(0)
# CHECK-NEXT:  1      1     1.00           *      U     fstpl	(%edx)
# CHECK-NEXT:  1      1     1.00           *      U     fstpl	(%ecx)
# CHECK-NEXT:  1      1     1.00           *      U     fstpt	(%eax)
# CHECK-NEXT:  1      1     0.50           *      U     fnstcw	(%eax)
# CHECK-NEXT:  1      100   0.50                  U     fnstenv	(%eax)
# CHECK-NEXT:  1      100   0.50                  U     fnstsw	(%eax)
# CHECK-NEXT:  1      100   0.50                  U     frstor	(%eax)
# CHECK-NEXT:  1      100   0.50                  U     wait
# CHECK-NEXT:  1      100   0.50                  U     fnsave	(%eax)
# CHECK-NEXT:  1      3     1.00                  U     fsub	%st, %st(1)
# CHECK-NEXT:  1      3     1.00                  U     fsub	%st(2)
# CHECK-NEXT:  1      8     1.00    *             U     fsubs	(%ecx)
# CHECK-NEXT:  1      8     1.00    *             U     fsubl	(%eax)
# CHECK-NEXT:  1      3     1.00                  U     fsubp	%st(1)
# CHECK-NEXT:  1      3     1.00                  U     fsubp	%st(2)
# CHECK-NEXT:  1      8     1.00    *             U     fisubs	(%ecx)
# CHECK-NEXT:  1      8     1.00    *             U     fisubl	(%eax)
# CHECK-NEXT:  1      3     1.00                  U     fsubr	%st, %st(1)
# CHECK-NEXT:  1      3     1.00                  U     fsubr	%st(2)
# CHECK-NEXT:  1      8     1.00    *             U     fsubrs	(%ecx)
# CHECK-NEXT:  1      8     1.00    *             U     fsubrl	(%eax)
# CHECK-NEXT:  1      3     1.00                  U     fsubrp	%st(1)
# CHECK-NEXT:  1      3     1.00                  U     fsubrp	%st(2)
# CHECK-NEXT:  1      8     1.00    *             U     fisubrs	(%ecx)
# CHECK-NEXT:  1      8     1.00    *             U     fisubrl	(%eax)
# CHECK-NEXT:  1      3     1.00                  U     ftst
# CHECK-NEXT:  1      3     1.00                  U     fucom	%st(1)
# CHECK-NEXT:  1      3     1.00                  U     fucom	%st(3)
# CHECK-NEXT:  1      3     1.00                  U     fucomp	%st(1)
# CHECK-NEXT:  1      3     1.00                  U     fucomp	%st(3)
# CHECK-NEXT:  1      3     1.00                  U     fucompp
# CHECK-NEXT:  1      3     1.00                  U     fucomi	%st(3)
# CHECK-NEXT:  1      3     1.00                  U     fucompi	%st(3)
# CHECK-NEXT:  1      100   0.50                  U     wait
# CHECK-NEXT:  1      100   0.50                  U     fxam
# CHECK-NEXT:  1      1     0.50                  U     fxch	%st(1)
# CHECK-NEXT:  1      1     0.50                  U     fxch	%st(3)
# CHECK-NEXT:  1      100   0.50    *      *      U     fxrstor	(%eax)
# CHECK-NEXT:  1      100   0.50    *      *      U     fxsave	(%eax)
# CHECK-NEXT:  1      100   0.50                  U     fxtract
# CHECK-NEXT:  1      100   0.50                  U     fyl2x
# CHECK-NEXT:  1      100   0.50                  U     fyl2xp1

# CHECK:      Resources:
# CHECK-NEXT: [0]   - JALU0
# CHECK-NEXT: [1]   - JALU1
# CHECK-NEXT: [2]   - JDiv
# CHECK-NEXT: [3]   - JFPA
# CHECK-NEXT: [4]   - JFPM
# CHECK-NEXT: [5]   - JFPU0
# CHECK-NEXT: [6]   - JFPU1
# CHECK-NEXT: [7]   - JLAGU
# CHECK-NEXT: [8]   - JMul
# CHECK-NEXT: [9]   - JSAGU
# CHECK-NEXT: [10]  - JSTC
# CHECK-NEXT: [11]  - JVALU0
# CHECK-NEXT: [12]  - JVALU1
# CHECK-NEXT: [13]  - JVIMUL

# CHECK:      Resource pressure per iteration:
# CHECK-NEXT: [0]    [1]    [2]    [3]    [4]    [5]    [6]    [7]    [8]    [9]    [10]   [11]   [12]   [13]
# CHECK-NEXT: 42.00  20.00   -     54.00  349.00 54.00  34.00  39.00   -     13.00  7.00    -      -      -

# CHECK:      Resource pressure by instruction:
# CHECK-NEXT: [0]    [1]    [2]    [3]    [4]    [5]    [6]    [7]    [8]    [9]    [10]   [11]   [12]   [13]   Instructions:
# CHECK-NEXT: 0.50   0.50    -      -      -      -      -      -      -      -      -      -      -      -     f2xm1
# CHECK-NEXT:  -      -      -      -     1.00    -     1.00    -      -      -      -      -      -      -     fabs
# CHECK-NEXT:  -      -      -     1.00    -     1.00    -      -      -      -      -      -      -      -     fadd	%st, %st(1)
# CHECK-NEXT:  -      -      -     1.00    -     1.00    -      -      -      -      -      -      -      -     fadd	%st(2)
# CHECK-NEXT:  -      -      -     1.00    -     1.00    -     1.00    -      -      -      -      -      -     fadds	(%ecx)
# CHECK-NEXT:  -      -      -     1.00    -     1.00    -     1.00    -      -      -      -      -      -     faddl	(%ecx)
# CHECK-NEXT:  -      -      -     1.00    -     1.00    -      -      -      -      -      -      -      -     faddp	%st(1)
# CHECK-NEXT:  -      -      -     1.00    -     1.00    -      -      -      -      -      -      -      -     faddp	%st(2)
# CHECK-NEXT:  -      -      -     1.00    -     1.00    -     1.00    -      -      -      -      -      -     fiadds	(%ecx)
# CHECK-NEXT:  -      -      -     1.00    -     1.00    -     1.00    -      -      -      -      -      -     fiaddl	(%ecx)
# CHECK-NEXT: 0.50   0.50    -      -      -      -      -      -      -      -      -      -      -      -     fbld	(%ecx)
# CHECK-NEXT: 0.50   0.50    -      -      -      -      -      -      -      -      -      -      -      -     fbstp	(%eax)
# CHECK-NEXT:  -      -      -      -     1.00    -     1.00    -      -      -      -      -      -      -     fchs
# CHECK-NEXT: 0.50   0.50    -      -      -      -      -      -      -      -      -      -      -      -     fnclex
# CHECK-NEXT:  -      -      -     1.00    -     1.00    -      -      -      -      -      -      -      -     fcmovb	%st(1), %st
# CHECK-NEXT:  -      -      -     1.00    -     1.00    -      -      -      -      -      -      -      -     fcmovbe	%st(1), %st
# CHECK-NEXT:  -      -      -     1.00    -     1.00    -      -      -      -      -      -      -      -     fcmove	%st(1), %st
# CHECK-NEXT:  -      -      -     1.00    -     1.00    -      -      -      -      -      -      -      -     fcmovnb	%st(1), %st
# CHECK-NEXT:  -      -      -     1.00    -     1.00    -      -      -      -      -      -      -      -     fcmovnbe	%st(1), %st
# CHECK-NEXT:  -      -      -     1.00    -     1.00    -      -      -      -      -      -      -      -     fcmovne	%st(1), %st
# CHECK-NEXT:  -      -      -     1.00    -     1.00    -      -      -      -      -      -      -      -     fcmovnu	%st(1), %st
# CHECK-NEXT:  -      -      -     1.00    -     1.00    -      -      -      -      -      -      -      -     fcmovu	%st(1), %st
# CHECK-NEXT: 1.00    -      -     1.00    -     1.00    -      -      -      -      -      -      -      -     fcom	%st(1)
# CHECK-NEXT: 1.00    -      -     1.00    -     1.00    -      -      -      -      -      -      -      -     fcom	%st(3)
# CHECK-NEXT: 1.00    -      -     1.00    -     1.00    -     1.00    -      -      -      -      -      -     fcoms	(%ecx)
# CHECK-NEXT: 1.00    -      -     1.00    -     1.00    -     1.00    -      -      -      -      -      -     fcoml	(%eax)
# CHECK-NEXT: 1.00    -      -     1.00    -     1.00    -      -      -      -      -      -      -      -     fcomp	%st(1)
# CHECK-NEXT: 1.00    -      -     1.00    -     1.00    -      -      -      -      -      -      -      -     fcomp	%st(3)
# CHECK-NEXT: 1.00    -      -     1.00    -     1.00    -     1.00    -      -      -      -      -      -     fcomps	(%ecx)
# CHECK-NEXT: 1.00    -      -     1.00    -     1.00    -     1.00    -      -      -      -      -      -     fcompl	(%eax)
# CHECK-NEXT: 0.50   0.50    -      -      -      -      -      -      -      -      -      -      -      -     fcompp
# CHECK-NEXT: 1.00    -      -     1.00    -     1.00    -      -      -      -      -      -      -      -     fcomi	%st(3)
# CHECK-NEXT: 1.00    -      -     1.00    -     1.00    -      -      -      -      -      -      -      -     fcompi	%st(3)
# CHECK-NEXT: 0.50   0.50    -      -      -      -      -      -      -      -      -      -      -      -     fcos
# CHECK-NEXT: 0.50   0.50    -      -      -      -      -      -      -      -      -      -      -      -     fdecstp
# CHECK-NEXT:  -      -      -      -     19.00   -     1.00    -      -      -      -      -      -      -     fdiv	%st, %st(1)
# CHECK-NEXT:  -      -      -      -     19.00   -     1.00    -      -      -      -      -      -      -     fdiv	%st(2)
# CHECK-NEXT:  -      -      -      -     19.00   -     1.00   1.00    -      -      -      -      -      -     fdivs	(%ecx)
# CHECK-NEXT:  -      -      -      -     19.00   -     1.00   1.00    -      -      -      -      -      -     fdivl	(%eax)
# CHECK-NEXT:  -      -      -      -     19.00   -     1.00    -      -      -      -      -      -      -     fdivp	%st(1)
# CHECK-NEXT:  -      -      -      -     19.00   -     1.00    -      -      -      -      -      -      -     fdivp	%st(2)
# CHECK-NEXT:  -      -      -      -     19.00   -     1.00   1.00    -      -      -      -      -      -     fidivs	(%ecx)
# CHECK-NEXT:  -      -      -      -     19.00   -     1.00   1.00    -      -      -      -      -      -     fidivl	(%eax)
# CHECK-NEXT:  -      -      -      -     19.00   -     1.00    -      -      -      -      -      -      -     fdivr	%st, %st(1)
# CHECK-NEXT:  -      -      -      -     19.00   -     1.00    -      -      -      -      -      -      -     fdivr	%st(2)
# CHECK-NEXT:  -      -      -      -     19.00   -     1.00   1.00    -      -      -      -      -      -     fdivrs	(%ecx)
# CHECK-NEXT:  -      -      -      -     19.00   -     1.00   1.00    -      -      -      -      -      -     fdivrl	(%eax)
# CHECK-NEXT:  -      -      -      -     19.00   -     1.00    -      -      -      -      -      -      -     fdivrp	%st(1)
# CHECK-NEXT:  -      -      -      -     19.00   -     1.00    -      -      -      -      -      -      -     fdivrp	%st(2)
# CHECK-NEXT:  -      -      -      -     19.00   -     1.00   1.00    -      -      -      -      -      -     fidivrs	(%ecx)
# CHECK-NEXT:  -      -      -      -     19.00   -     1.00   1.00    -      -      -      -      -      -     fidivrl	(%eax)
# CHECK-NEXT: 0.50   0.50    -      -      -      -      -      -      -      -      -      -      -      -     ffree	%st(0)
# CHECK-NEXT: 1.00    -      -     1.00    -     1.00    -     1.00    -      -      -      -      -      -     ficoms	(%ecx)
# CHECK-NEXT: 1.00    -      -     1.00    -     1.00    -     1.00    -      -      -      -      -      -     ficoml	(%eax)
# CHECK-NEXT: 1.00    -      -     1.00    -     1.00    -     1.00    -      -      -      -      -      -     ficomps	(%ecx)
# CHECK-NEXT: 1.00    -      -     1.00    -     1.00    -     1.00    -      -      -      -      -      -     ficompl	(%eax)
# CHECK-NEXT:  -      -      -      -      -      -      -     1.00    -      -      -      -      -      -     filds	(%edx)
# CHECK-NEXT:  -      -      -      -      -      -      -     1.00    -      -      -      -      -      -     fildl	(%ecx)
# CHECK-NEXT:  -      -      -      -      -      -      -     1.00    -      -      -      -      -      -     fildll	(%eax)
# CHECK-NEXT: 0.50   0.50    -      -      -      -      -      -      -      -      -      -      -      -     fincstp
# CHECK-NEXT: 0.50   0.50    -      -      -      -      -      -      -      -      -      -      -      -     fninit
# CHECK-NEXT:  -      -      -      -      -      -      -      -      -     1.00    -      -      -      -     fists	(%edx)
# CHECK-NEXT:  -      -      -      -      -      -      -      -      -     1.00    -      -      -      -     fistl	(%ecx)
# CHECK-NEXT:  -      -      -      -      -      -      -      -      -     1.00    -      -      -      -     fistps	(%edx)
# CHECK-NEXT:  -      -      -      -      -      -      -      -      -     1.00    -      -      -      -     fistpl	(%ecx)
# CHECK-NEXT:  -      -      -      -      -      -      -      -      -     1.00    -      -      -      -     fistpll	(%eax)
# CHECK-NEXT:  -      -      -      -      -      -      -      -      -     1.00    -      -      -      -     fisttps	(%edx)
# CHECK-NEXT:  -      -      -      -      -      -      -      -      -     1.00    -      -      -      -     fisttpl	(%ecx)
# CHECK-NEXT:  -      -      -      -      -      -      -      -      -     1.00    -      -      -      -     fisttpll	(%eax)
# CHECK-NEXT: 0.50   0.50    -      -      -      -      -      -      -      -      -      -      -      -     fld	%st(0)
# CHECK-NEXT:  -      -      -      -      -      -      -     1.00    -      -      -      -      -      -     flds	(%edx)
# CHECK-NEXT:  -      -      -      -      -      -      -     1.00    -      -      -      -      -      -     fldl	(%ecx)
# CHECK-NEXT:  -      -      -      -      -      -      -     1.00    -      -      -      -      -      -     fldt	(%eax)
# CHECK-NEXT:  -      -      -      -      -      -      -     1.00    -      -      -      -      -      -     fldcw	(%eax)
# CHECK-NEXT: 0.50   0.50    -      -      -      -      -      -      -      -      -      -      -      -     fldenv	(%eax)
# CHECK-NEXT:  -      -      -      -      -      -     1.00    -      -      -     1.00    -      -      -     fld1
# CHECK-NEXT:  -      -      -      -      -      -     1.00    -      -      -     1.00    -      -      -     fldl2e
# CHECK-NEXT:  -      -      -      -      -      -     1.00    -      -      -     1.00    -      -      -     fldl2t
# CHECK-NEXT:  -      -      -      -      -      -     1.00    -      -      -     1.00    -      -      -     fldlg2
# CHECK-NEXT:  -      -      -      -      -      -     1.00    -      -      -     1.00    -      -      -     fldln2
# CHECK-NEXT:  -      -      -      -      -      -     1.00    -      -      -     1.00    -      -      -     fldpi
# CHECK-NEXT:  -      -      -      -      -      -     1.00    -      -      -     1.00    -      -      -     fldz
# CHECK-NEXT:  -      -      -      -     1.00    -     1.00    -      -      -      -      -      -      -     fmul	%st, %st(1)
# CHECK-NEXT:  -      -      -      -     1.00    -     1.00    -      -      -      -      -      -      -     fmul	%st(2)
# CHECK-NEXT:  -      -      -      -     1.00    -     1.00   1.00    -      -      -      -      -      -     fmuls	(%ecx)
# CHECK-NEXT:  -      -      -      -     1.00    -     1.00   1.00    -      -      -      -      -      -     fmull	(%eax)
# CHECK-NEXT:  -      -      -      -     1.00    -     1.00    -      -      -      -      -      -      -     fmulp	%st(1)
# CHECK-NEXT:  -      -      -      -     1.00    -     1.00    -      -      -      -      -      -      -     fmulp	%st(2)
# CHECK-NEXT:  -      -      -      -     1.00    -     1.00   1.00    -      -      -      -      -      -     fimuls	(%ecx)
# CHECK-NEXT:  -      -      -      -     1.00    -     1.00   1.00    -      -      -      -      -      -     fimull	(%eax)
# CHECK-NEXT: 0.50   0.50    -      -      -      -      -      -      -      -      -      -      -      -     fnop
# CHECK-NEXT: 0.50   0.50    -      -      -      -      -      -      -      -      -      -      -      -     fpatan
# CHECK-NEXT: 0.50   0.50    -      -      -      -      -      -      -      -      -      -      -      -     fprem
# CHECK-NEXT: 0.50   0.50    -      -      -      -      -      -      -      -      -      -      -      -     fprem1
# CHECK-NEXT: 0.50   0.50    -      -      -      -      -      -      -      -      -      -      -      -     fptan
# CHECK-NEXT: 0.50   0.50    -      -      -      -      -      -      -      -      -      -      -      -     frndint
# CHECK-NEXT: 0.50   0.50    -      -      -      -      -      -      -      -      -      -      -      -     frstor	(%eax)
# CHECK-NEXT: 0.50   0.50    -      -      -      -      -      -      -      -      -      -      -      -     fnsave	(%eax)
# CHECK-NEXT: 0.50   0.50    -      -      -      -      -      -      -      -      -      -      -      -     fscale
# CHECK-NEXT: 0.50   0.50    -      -      -      -      -      -      -      -      -      -      -      -     fsin
# CHECK-NEXT: 0.50   0.50    -      -      -      -      -      -      -      -      -      -      -      -     fsincos
# CHECK-NEXT:  -      -      -      -     35.00   -     1.00    -      -      -      -      -      -      -     fsqrt
# CHECK-NEXT: 0.50   0.50    -      -      -      -      -      -      -      -      -      -      -      -     fst	%st(0)
# CHECK-NEXT:  -      -      -      -      -      -      -      -      -     1.00    -      -      -      -     fsts	(%edx)
# CHECK-NEXT:  -      -      -      -      -      -      -      -      -     1.00    -      -      -      -     fstl	(%ecx)
# CHECK-NEXT: 0.50   0.50    -      -      -      -      -      -      -      -      -      -      -      -     fstp	%st(0)
# CHECK-NEXT:  -      -      -      -      -      -      -      -      -     1.00    -      -      -      -     fstpl	(%edx)
# CHECK-NEXT:  -      -      -      -      -      -      -      -      -     1.00    -      -      -      -     fstpl	(%ecx)
# CHECK-NEXT:  -      -      -      -      -      -      -      -      -     1.00    -      -      -      -     fstpt	(%eax)
# CHECK-NEXT: 0.50   0.50    -      -      -      -      -      -      -      -      -      -      -      -     fnstcw	(%eax)
# CHECK-NEXT: 0.50   0.50    -      -      -      -      -      -      -      -      -      -      -      -     fnstenv	(%eax)
# CHECK-NEXT: 0.50   0.50    -      -      -      -      -      -      -      -      -      -      -      -     fnstsw	(%eax)
# CHECK-NEXT: 0.50   0.50    -      -      -      -      -      -      -      -      -      -      -      -     frstor	(%eax)
# CHECK-NEXT: 0.50   0.50    -      -      -      -      -      -      -      -      -      -      -      -     wait
# CHECK-NEXT: 0.50   0.50    -      -      -      -      -      -      -      -      -      -      -      -     fnsave	(%eax)
# CHECK-NEXT:  -      -      -     1.00    -     1.00    -      -      -      -      -      -      -      -     fsub	%st, %st(1)
# CHECK-NEXT:  -      -      -     1.00    -     1.00    -      -      -      -      -      -      -      -     fsub	%st(2)
# CHECK-NEXT:  -      -      -     1.00    -     1.00    -     1.00    -      -      -      -      -      -     fsubs	(%ecx)
# CHECK-NEXT:  -      -      -     1.00    -     1.00    -     1.00    -      -      -      -      -      -     fsubl	(%eax)
# CHECK-NEXT:  -      -      -     1.00    -     1.00    -      -      -      -      -      -      -      -     fsubp	%st(1)
# CHECK-NEXT:  -      -      -     1.00    -     1.00    -      -      -      -      -      -      -      -     fsubp	%st(2)
# CHECK-NEXT:  -      -      -     1.00    -     1.00    -     1.00    -      -      -      -      -      -     fisubs	(%ecx)
# CHECK-NEXT:  -      -      -     1.00    -     1.00    -     1.00    -      -      -      -      -      -     fisubl	(%eax)
# CHECK-NEXT:  -      -      -     1.00    -     1.00    -      -      -      -      -      -      -      -     fsubr	%st, %st(1)
# CHECK-NEXT:  -      -      -     1.00    -     1.00    -      -      -      -      -      -      -      -     fsubr	%st(2)
# CHECK-NEXT:  -      -      -     1.00    -     1.00    -     1.00    -      -      -      -      -      -     fsubrs	(%ecx)
# CHECK-NEXT:  -      -      -     1.00    -     1.00    -     1.00    -      -      -      -      -      -     fsubrl	(%eax)
# CHECK-NEXT:  -      -      -     1.00    -     1.00    -      -      -      -      -      -      -      -     fsubrp	%st(1)
# CHECK-NEXT:  -      -      -     1.00    -     1.00    -      -      -      -      -      -      -      -     fsubrp	%st(2)
# CHECK-NEXT:  -      -      -     1.00    -     1.00    -     1.00    -      -      -      -      -      -     fisubrs	(%ecx)
# CHECK-NEXT:  -      -      -     1.00    -     1.00    -     1.00    -      -      -      -      -      -     fisubrl	(%eax)
# CHECK-NEXT: 1.00    -      -     1.00    -     1.00    -      -      -      -      -      -      -      -     ftst
# CHECK-NEXT: 1.00    -      -     1.00    -     1.00    -      -      -      -      -      -      -      -     fucom	%st(1)
# CHECK-NEXT: 1.00    -      -     1.00    -     1.00    -      -      -      -      -      -      -      -     fucom	%st(3)
# CHECK-NEXT: 1.00    -      -     1.00    -     1.00    -      -      -      -      -      -      -      -     fucomp	%st(1)
# CHECK-NEXT: 1.00    -      -     1.00    -     1.00    -      -      -      -      -      -      -      -     fucomp	%st(3)
# CHECK-NEXT: 1.00    -      -     1.00    -     1.00    -      -      -      -      -      -      -      -     fucompp
# CHECK-NEXT: 1.00    -      -     1.00    -     1.00    -      -      -      -      -      -      -      -     fucomi	%st(3)
# CHECK-NEXT: 1.00    -      -     1.00    -     1.00    -      -      -      -      -      -      -      -     fucompi	%st(3)
# CHECK-NEXT: 0.50   0.50    -      -      -      -      -      -      -      -      -      -      -      -     wait
# CHECK-NEXT: 0.50   0.50    -      -      -      -      -      -      -      -      -      -      -      -     fxam
# CHECK-NEXT: 0.50   0.50    -      -      -      -      -      -      -      -      -      -      -      -     fxch	%st(1)
# CHECK-NEXT: 0.50   0.50    -      -      -      -      -      -      -      -      -      -      -      -     fxch	%st(3)
# CHECK-NEXT: 0.50   0.50    -      -      -      -      -      -      -      -      -      -      -      -     fxrstor	(%eax)
# CHECK-NEXT: 0.50   0.50    -      -      -      -      -      -      -      -      -      -      -      -     fxsave	(%eax)
# CHECK-NEXT: 0.50   0.50    -      -      -      -      -      -      -      -      -      -      -      -     fxtract
# CHECK-NEXT: 0.50   0.50    -      -      -      -      -      -      -      -      -      -      -      -     fyl2x
# CHECK-NEXT: 0.50   0.50    -      -      -      -      -      -      -      -      -      -      -      -     fyl2xp1
