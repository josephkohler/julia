; NOTE: Assertions have been autogenerated by utils/update_test_checks.py UTC_ARGS: -p
; RUN: opt  --load-pass-plugin=libjulia-codegen%shlibext -passes='DemoteFloat16' -S %s | FileCheck %s

define half @demote_half_test(half %a, half %b) #0 {
top:
; CHECK-LABEL: @demote_half_test(
; CHECK-NEXT:  top:
; CHECK-NEXT:    %0 = fpext half %a to float
; CHECK-NEXT:    %1 = fpext half %b to float
; CHECK-NEXT:    %2 = fadd float %0, %1
; CHECK-NEXT:    %3 = fptrunc float %2 to half
; CHECK-NEXT:    %4 = fpext half %3 to float
; CHECK-NEXT:    %5 = fpext half %b to float
; CHECK-NEXT:    %6 = fadd float %4, %5
; CHECK-NEXT:    %7 = fptrunc float %6 to half
; CHECK-NEXT:    %8 = fpext half %7 to float
; CHECK-NEXT:    %9 = fpext half %b to float
; CHECK-NEXT:    %10 = fadd float %8, %9
; CHECK-NEXT:    %11 = fptrunc float %10 to half
; CHECK-NEXT:    %12 = fpext half %11 to float
; CHECK-NEXT:    %13 = fpext half %b to float
; CHECK-NEXT:    %14 = fmul float %12, %13
; CHECK-NEXT:    %15 = fptrunc float %14 to half
; CHECK-NEXT:    %16 = fpext half %15 to float
; CHECK-NEXT:    %17 = fpext half %b to float
; CHECK-NEXT:    %18 = fdiv float %16, %17
; CHECK-NEXT:    %19 = fptrunc float %18 to half
; CHECK-NEXT:    %20 = insertelement <2 x half> undef, half %a, i32 0
; CHECK-NEXT:    %21 = insertelement <2 x half> %20, half %b, i32 1
; CHECK-NEXT:    %22 = insertelement <2 x half> undef, half %b, i32 0
; CHECK-NEXT:    %23 = insertelement <2 x half> %22, half %b, i32 1
; CHECK-NEXT:    %24 = fpext <2 x half> %21 to <2 x float>
; CHECK-NEXT:    %25 = fpext <2 x half> %23 to <2 x float>
; CHECK-NEXT:    %26 = fadd <2 x float> %24, %25
; CHECK-NEXT:    %27 = fptrunc <2 x float> %26 to <2 x half>
; CHECK-NEXT:    %28 = extractelement <2 x half> %27, i32 0
; CHECK-NEXT:    %29 = extractelement <2 x half> %27, i32 1
; CHECK-NEXT:    %30 = fpext half %28 to float
; CHECK-NEXT:    %31 = fpext half %29 to float
; CHECK-NEXT:    %32 = fadd float %30, %31
; CHECK-NEXT:    %33 = fptrunc float %32 to half
; CHECK-NEXT:    %34 = fpext half %33 to float
; CHECK-NEXT:    %35 = fpext half %19 to float
; CHECK-NEXT:    %36 = fadd float %34, %35
; CHECK-NEXT:    %37 = fptrunc float %36 to half
; CHECK-NEXT:    ret half %37
;
  %0 = fadd half %a, %b
  %1 = fadd half %0, %b
  %2 = fadd half %1, %b
  %3 = fmul half %2, %b
  %4 = fdiv half %3, %b
  %5 = insertelement <2 x half> undef, half %a, i32 0
  %6 = insertelement <2 x half> %5, half %b, i32 1
  %7 = insertelement <2 x half> undef, half %b, i32 0
  %8 = insertelement <2 x half> %7, half %b, i32 1
  %9 = fadd <2 x half> %6, %8
  %10 = extractelement <2 x half> %9, i32 0
  %11 = extractelement <2 x half> %9, i32 1
  %12 = fadd half %10, %11
  %13 = fadd half %12, %4
  ret half %13
}

define half @native_half_test(half %a, half %b) #1 {
; CHECK-LABEL: @native_half_test(
; CHECK-NEXT   top:
; CHECK-NEXT     %0 = fadd half %a, %b
; CHECK-NEXT     %1 = fadd half %0, %b
; CHECK-NEXT     %2 = fadd half %1, %b
; CHECK-NEXT     %3 = fmul half %2, %b
; CHECK-NEXT     %4 = fdiv half %3, %b
; CHECK-NEXT     %5 = insertelement <2 x half> undef, half %a, i32 0
; CHECK-NEXT     %6 = insertelement <2 x half> %5, half %b, i32 1
; CHECK-NEXT     %7 = insertelement <2 x half> undef, half %b, i32 0
; CHECK-NEXT     %8 = insertelement <2 x half> %7, half %b, i32 1
; CHECK-NEXT     %9 = fadd <2 x half> %6, %8
; CHECK-NEXT     %10 = extractelement <2 x half> %9, i32 0
; CHECK-NEXT     %11 = extractelement <2 x half> %9, i32 1
; CHECK-NEXT     %12 = fadd half %10, %11
; CHECK-NEXT     %13 = fadd half %12, %4
; CHECK-NEXT     ret half %13
;
top:
  %0 = fadd half %a, %b
  %1 = fadd half %0, %b
  %2 = fadd half %1, %b
  %3 = fmul half %2, %b
  %4 = fdiv half %3, %b
  %5 = insertelement <2 x half> undef, half %a, i32 0
  %6 = insertelement <2 x half> %5, half %b, i32 1
  %7 = insertelement <2 x half> undef, half %b, i32 0
  %8 = insertelement <2 x half> %7, half %b, i32 1
  %9 = fadd <2 x half> %6, %8
  %10 = extractelement <2 x half> %9, i32 0
  %11 = extractelement <2 x half> %9, i32 1
  %12 = fadd half %10, %11
  %13 = fadd half %12, %4
  ret half %13
}

define bfloat @demote_bfloat_test(bfloat %a, bfloat %b) #2 {
top:
; CHECK-LABEL: @demote_bfloat_test(
; CHECK-NEXT:  top:
; CHECK-NEXT:    %0 = fpext bfloat %a to float
; CHECK-NEXT:    %1 = fpext bfloat %b to float
; CHECK-NEXT:    %2 = fadd float %0, %1
; CHECK-NEXT:    %3 = fptrunc float %2 to bfloat
; CHECK-NEXT:    %4 = fpext bfloat %3 to float
; CHECK-NEXT:    %5 = fpext bfloat %b to float
; CHECK-NEXT:    %6 = fadd float %4, %5
; CHECK-NEXT:    %7 = fptrunc float %6 to bfloat
; CHECK-NEXT:    %8 = fpext bfloat %7 to float
; CHECK-NEXT:    %9 = fpext bfloat %b to float
; CHECK-NEXT:    %10 = fadd float %8, %9
; CHECK-NEXT:    %11 = fptrunc float %10 to bfloat
; CHECK-NEXT:    %12 = fpext bfloat %11 to float
; CHECK-NEXT:    %13 = fpext bfloat %b to float
; CHECK-NEXT:    %14 = fmul float %12, %13
; CHECK-NEXT:    %15 = fptrunc float %14 to bfloat
; CHECK-NEXT:    %16 = fpext bfloat %15 to float
; CHECK-NEXT:    %17 = fpext bfloat %b to float
; CHECK-NEXT:    %18 = fdiv float %16, %17
; CHECK-NEXT:    %19 = fptrunc float %18 to bfloat
; CHECK-NEXT:    %20 = insertelement <2 x bfloat> undef, bfloat %a, i32 0
; CHECK-NEXT:    %21 = insertelement <2 x bfloat> %20, bfloat %b, i32 1
; CHECK-NEXT:    %22 = insertelement <2 x bfloat> undef, bfloat %b, i32 0
; CHECK-NEXT:    %23 = insertelement <2 x bfloat> %22, bfloat %b, i32 1
; CHECK-NEXT:    %24 = fpext <2 x bfloat> %21 to <2 x float>
; CHECK-NEXT:    %25 = fpext <2 x bfloat> %23 to <2 x float>
; CHECK-NEXT:    %26 = fadd <2 x float> %24, %25
; CHECK-NEXT:    %27 = fptrunc <2 x float> %26 to <2 x bfloat>
; CHECK-NEXT:    %28 = extractelement <2 x bfloat> %27, i32 0
; CHECK-NEXT:    %29 = extractelement <2 x bfloat> %27, i32 1
; CHECK-NEXT:    %30 = fpext bfloat %28 to float
; CHECK-NEXT:    %31 = fpext bfloat %29 to float
; CHECK-NEXT:    %32 = fadd float %30, %31
; CHECK-NEXT:    %33 = fptrunc float %32 to bfloat
; CHECK-NEXT:    %34 = fpext bfloat %33 to float
; CHECK-NEXT:    %35 = fpext bfloat %19 to float
; CHECK-NEXT:    %36 = fadd float %34, %35
; CHECK-NEXT:    %37 = fptrunc float %36 to bfloat
; CHECK-NEXT:    ret bfloat %37
;
  %0 = fadd bfloat %a, %b
  %1 = fadd bfloat %0, %b
  %2 = fadd bfloat %1, %b
  %3 = fmul bfloat %2, %b
  %4 = fdiv bfloat %3, %b
  %5 = insertelement <2 x bfloat> undef, bfloat %a, i32 0
  %6 = insertelement <2 x bfloat> %5, bfloat %b, i32 1
  %7 = insertelement <2 x bfloat> undef, bfloat %b, i32 0
  %8 = insertelement <2 x bfloat> %7, bfloat %b, i32 1
  %9 = fadd <2 x bfloat> %6, %8
  %10 = extractelement <2 x bfloat> %9, i32 0
  %11 = extractelement <2 x bfloat> %9, i32 1
  %12 = fadd bfloat %10, %11
  %13 = fadd bfloat %12, %4
  ret bfloat %13
}

define bfloat @native_bfloat_test(bfloat %a, bfloat %b) #3 {
top:
; CHECK-LABEL: @native_bfloat_test(
; CHECK-NEXT:  top:
; CHECK-NEXT:    %0 = fadd bfloat %a, %b
; CHECK-NEXT:    %1 = fadd bfloat %0, %b
; CHECK-NEXT:    %2 = fadd bfloat %1, %b
; CHECK-NEXT:    %3 = fmul bfloat %2, %b
; CHECK-NEXT:    %4 = fdiv bfloat %3, %b
; CHECK-NEXT:    %5 = insertelement <2 x bfloat> undef, bfloat %a, i32 0
; CHECK-NEXT:    %6 = insertelement <2 x bfloat> %5, bfloat %b, i32 1
; CHECK-NEXT:    %7 = insertelement <2 x bfloat> undef, bfloat %b, i32 0
; CHECK-NEXT:    %8 = insertelement <2 x bfloat> %7, bfloat %b, i32 1
; CHECK-NEXT:    %9 = fadd <2 x bfloat> %6, %8
; CHECK-NEXT:    %10 = extractelement <2 x bfloat> %9, i32 0
; CHECK-NEXT:    %11 = extractelement <2 x bfloat> %9, i32 1
; CHECK-NEXT:    %12 = fadd bfloat %10, %11
; CHECK-NEXT:    %13 = fadd bfloat %12, %4
; CHECK-NEXT:    ret bfloat %13
;
  %0 = fadd bfloat %a, %b
  %1 = fadd bfloat %0, %b
  %2 = fadd bfloat %1, %b
  %3 = fmul bfloat %2, %b
  %4 = fdiv bfloat %3, %b
  %5 = insertelement <2 x bfloat> undef, bfloat %a, i32 0
  %6 = insertelement <2 x bfloat> %5, bfloat %b, i32 1
  %7 = insertelement <2 x bfloat> undef, bfloat %b, i32 0
  %8 = insertelement <2 x bfloat> %7, bfloat %b, i32 1
  %9 = fadd <2 x bfloat> %6, %8
  %10 = extractelement <2 x bfloat> %9, i32 0
  %11 = extractelement <2 x bfloat> %9, i32 1
  %12 = fadd bfloat %10, %11
  %13 = fadd bfloat %12, %4
  ret bfloat %13
}

define i1 @fast_half_test(half %0, half %1) #0 {
top:
; CHECK-LABEL: @fast_half_test(
; CHECK-NEXT:  top:
; CHECK-NEXT:    %2 = fsub fast half %0, %1
; CHECK-NEXT:    %3 = fcmp fast oeq half %2, 0xH0000
; CHECK-NEXT:    ret i1 %3
;
  %2 = fsub fast half %0, %1
  %3 = fcmp fast oeq half %2, 0xH0000
  ret i1 %3
}

define i1 @fast_bfloat_test(bfloat %0, bfloat %1) #2 {
top:
; CHECK-LABEL: @fast_bfloat_test(
; CHECK-NEXT:  top:
; CHECK-NEXT:    %2 = fsub fast bfloat %0, %1
; CHECK-NEXT:    %3 = fcmp fast oeq bfloat %2, 0xR0000
; CHECK-NEXT:    ret i1 %3
;
  %2 = fsub fast bfloat %0, %1
  %3 = fcmp fast oeq bfloat %2, 0xR0000
  ret i1 %3
}

attributes #0 = { "julia.hasfp16"="false" }
attributes #1 = { "julia.hasfp16"="true" }
attributes #2 = { "julia.hasbf16"="false" }
attributes #3 = { "julia.hasbf16"="true" }
