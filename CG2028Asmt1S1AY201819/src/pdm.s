 	.syntax unified
 	.cpu cortex-m3
 	.thumb
 	.align 2
 	.global	pdm
 	.thumb_func
pdm:
@ write the code for pdm(CM,M,index) here
	PUSH {R3-R4};
	MOV R4, 4 @length of word
	MUL R3, R1, R2 @Calculate initial offset(without considering word length)
	MUL R3, R4 @consider word length
	ADD R0, R3  @apply offset
	MUL R2, R4 @offset for index(accounting for word length)
	ADD R4, R0, R2 @mem loc for numerator
	LDR R2, [R4] @load numerator into R2
	MOV R4, 0 @initialize sum to 0
loop:
	LDR R3, [R0], 4
	ADD R4, R3  @Calculating the denominator of the PD function
	SUBS R1, 1
	BGT loop
	MOVW R1, 10000
	MUL R2, R1@multiply numerator by 10000
	SDIV R0, R2, R4 @numerator/denominator
	POP {R3-R4};
	BX LR
