   1              		.syntax unified
   2              		.cpu cortex-m3
   3              		.fpu softvfp
   4              		.eabi_attribute 20, 1
   5              		.eabi_attribute 21, 1
   6              		.eabi_attribute 23, 3
   7              		.eabi_attribute 24, 1
   8              		.eabi_attribute 25, 1
   9              		.eabi_attribute 26, 1
  10              		.eabi_attribute 30, 6
  11              		.eabi_attribute 34, 1
  12              		.eabi_attribute 18, 4
  13              		.thumb
  14              		.file	"main.c"
  15              		.text
  16              	.Ltext0:
  17              		.cfi_sections	.debug_frame
  18              		.section	.rodata
  19              		.align	2
  20              	.LC1:
  21 0000 2566200A 		.ascii	"%f \012\000"
  21      00
  22              		.global	__aeabi_i2d
  23              		.global	__aeabi_ddiv
  24 0005 000000   		.align	2
  25              	.LC0:
  26 0008 3C000000 		.word	60
  27 000c 02000000 		.word	2
  28 0010 03000000 		.word	3
  29 0014 0B000000 		.word	11
  30 0018 2F000000 		.word	47
  31 001c 07000000 		.word	7
  32 0020 1B000000 		.word	27
  33 0024 0E000000 		.word	14
  34 0028 18000000 		.word	24
  35              		.section	.text.main,"ax",%progbits
  36              		.align	2
  37              		.global	main
  38              		.thumb
  39              		.thumb_func
  41              	main:
  42              	.LFB0:
  43              		.file 1 "../src/main.c"
   1:../src/main.c **** #include "stdio.h"
   2:../src/main.c **** 
   3:../src/main.c **** extern int pdm(int* base, int ncol, int index);
   4:../src/main.c **** 
   5:../src/main.c **** // CG2028 Assignment 1, Sem 1, AY 2018/19
   6:../src/main.c **** // (c) CK Tham, ECE NUS, 2018
   7:../src/main.c **** 
   8:../src/main.c **** // Dimension of confusion matrix, i.e. MxM square matrix
   9:../src/main.c **** // Note: pdm() must work for different values of M, e.g. M=10
  10:../src/main.c **** #define M 3
  11:../src/main.c **** 
  12:../src/main.c **** int main(void)
  13:../src/main.c **** {
  44              		.loc 1 13 0
  45              		.cfi_startproc
  46              		@ args = 0, pretend = 0, frame = 40
  47              		@ frame_needed = 1, uses_anonymous_args = 0
  48 0000 B0B5     		push	{r4, r5, r7, lr}
  49              	.LCFI0:
  50              		.cfi_def_cfa_offset 16
  51              		.cfi_offset 14, -4
  52              		.cfi_offset 7, -8
  53              		.cfi_offset 5, -12
  54              		.cfi_offset 4, -16
  55 0002 8AB0     		sub	sp, sp, #40
  56              	.LCFI1:
  57              		.cfi_def_cfa_offset 56
  58 0004 00AF     		add	r7, sp, #0
  59              	.LCFI2:
  60              		.cfi_def_cfa_register 7
  14:../src/main.c **** 	// Variable definitions
  15:../src/main.c **** 	int index;
  16:../src/main.c **** 	// Note: different initialisation list is needed for different M
  17:../src/main.c **** 	int CM[M][M]={{60,2,3},{11,47,7},{27,14,24}};
  61              		.loc 1 17 0
  62 0006 40F20003 		movw	r3, #:lower16:.LC0
  63 000a C0F20003 		movt	r3, #:upper16:.LC0
  64 000e 3C46     		mov	r4, r7
  65 0010 1D46     		mov	r5, r3
  66 0012 0FCD     		ldmia	r5!, {r0, r1, r2, r3}
  67 0014 0FC4     		stmia	r4!, {r0, r1, r2, r3}
  68 0016 0FCD     		ldmia	r5!, {r0, r1, r2, r3}
  69 0018 0FC4     		stmia	r4!, {r0, r1, r2, r3}
  70 001a 2B68     		ldr	r3, [r5, #0]
  71 001c 2360     		str	r3, [r4, #0]
  18:../src/main.c **** 
  19:../src/main.c **** 	// PDm: Call assembly language function pdm() for each class m
  20:../src/main.c **** 	// note: index = m - 1
  21:../src/main.c **** 	for ( index=0; index<M; index++ )
  72              		.loc 1 21 0
  73 001e 4FF00003 		mov	r3, #0
  74 0022 7B62     		str	r3, [r7, #36]
  75 0024 20E0     		b	.L2
  76              	.L3:
  22:../src/main.c **** 		printf("%f \n", pdm((int*)CM, M, index)/10000.0);
  77              		.loc 1 22 0 discriminator 2
  78 0026 40F20004 		movw	r4, #:lower16:.LC1
  79 002a C0F20004 		movt	r4, #:upper16:.LC1
  80 002e 3B46     		mov	r3, r7
  81 0030 1846     		mov	r0, r3
  82 0032 4FF00301 		mov	r1, #3
  83 0036 7A6A     		ldr	r2, [r7, #36]
  84 0038 FFF7FEFF 		bl	pdm
  85 003c 0346     		mov	r3, r0
  86 003e 1846     		mov	r0, r3
  87 0040 FFF7FEFF 		bl	__aeabi_i2d
  88 0044 0246     		mov	r2, r0
  89 0046 0B46     		mov	r3, r1
  90 0048 1046     		mov	r0, r2
  91 004a 1946     		mov	r1, r3
  92 004c 0EA3     		adr	r3, .L5
  93 004e D3E90023 		ldrd	r2, [r3]
  94 0052 FFF7FEFF 		bl	__aeabi_ddiv
  95 0056 0246     		mov	r2, r0
  96 0058 0B46     		mov	r3, r1
  97 005a 2046     		mov	r0, r4
  98 005c FFF7FEFF 		bl	printf
  21:../src/main.c **** 	for ( index=0; index<M; index++ )
  99              		.loc 1 21 0 discriminator 2
 100 0060 7B6A     		ldr	r3, [r7, #36]
 101 0062 03F10103 		add	r3, r3, #1
 102 0066 7B62     		str	r3, [r7, #36]
 103              	.L2:
  21:../src/main.c **** 	for ( index=0; index<M; index++ )
 104              		.loc 1 21 0 is_stmt 0 discriminator 1
 105 0068 7B6A     		ldr	r3, [r7, #36]
 106 006a 022B     		cmp	r3, #2
 107 006c DBDD     		ble	.L3
 108              	.L4:
  23:../src/main.c **** 
  24:../src/main.c **** 	// Enter an infinite loop, just incrementing a counter
  25:../src/main.c **** 	volatile static int loop = 0;
  26:../src/main.c **** 	while (1) {
  27:../src/main.c **** 		loop++;
 109              		.loc 1 27 0 is_stmt 1 discriminator 1
 110 006e 40F20003 		movw	r3, #:lower16:loop.3818
 111 0072 C0F20003 		movt	r3, #:upper16:loop.3818
 112 0076 1B68     		ldr	r3, [r3, #0]
 113 0078 03F10102 		add	r2, r3, #1
 114 007c 40F20003 		movw	r3, #:lower16:loop.3818
 115 0080 C0F20003 		movt	r3, #:upper16:loop.3818
 116 0084 1A60     		str	r2, [r3, #0]
  28:../src/main.c **** 	}
 117              		.loc 1 28 0 discriminator 1
 118 0086 F2E7     		b	.L4
 119              	.L6:
 120              		.align	3
 121              	.L5:
 122 0088 00000000 		.word	0
 123 008c 0088C340 		.word	1086556160
 124              		.cfi_endproc
 125              	.LFE0:
 127              		.bss
 128              		.align	2
 129              	loop.3818:
 130 0000 00000000 		.space	4
 131              		.text
 132              	.Letext0:
DEFINED SYMBOLS
                            *ABS*:00000000 main.c
C:\Users\BOONJU~1\AppData\Local\Temp\cceNeq0p.s:19     .rodata:00000000 $d
C:\Users\BOONJU~1\AppData\Local\Temp\cceNeq0p.s:20     .rodata:00000000 .LC1
C:\Users\BOONJU~1\AppData\Local\Temp\cceNeq0p.s:25     .rodata:00000008 .LC0
C:\Users\BOONJU~1\AppData\Local\Temp\cceNeq0p.s:36     .text.main:00000000 $t
C:\Users\BOONJU~1\AppData\Local\Temp\cceNeq0p.s:41     .text.main:00000000 main
C:\Users\BOONJU~1\AppData\Local\Temp\cceNeq0p.s:129    .bss:00000000 loop.3818
C:\Users\BOONJU~1\AppData\Local\Temp\cceNeq0p.s:122    .text.main:00000088 $d
C:\Users\BOONJU~1\AppData\Local\Temp\cceNeq0p.s:128    .bss:00000000 $d
                     .debug_frame:00000010 $d

UNDEFINED SYMBOLS
__aeabi_i2d
__aeabi_ddiv
pdm
printf
