 	.syntax unified
 	.cpu cortex-m3
 	.thumb
 	.align 2
 	.global	pdm
 	.thumb_func
pdm:
@ write the code for pdm(CM,M,index) here
	PUSH {R3-R4};
	MOV R4, 4 @length of word 							0x03A04004
	MUL R3, R1, R2 @Calculate initial offset(without considering word length) 	0x00003211
	MUL R3, R4 @consider word length 						0x00003413
	ADD R0, R3  @apply offset 							0x00800003
	MUL R2, R4 @offset for index(accounting for word length)			0x00002412
	ADD R4, R0, R2 @mem loc for numerator						0x00804002
	LDR R2, [R4] @load numerator into R2						0x04142000
	MOV R4, 0 @initialize sum to 0							0x03A04000
loop:
	LDR R3, [R0], 4									0x04903004
	ADD R4, R3  @Calculating the denominator of the PD function			0x00844003
	SUBS R1, 1									0x02911001
	BGT loop									0xC8000010
	MOVW R1, 10000
	MUL R2, R1  @multiply numerator by 10000					0x00002112	
	SDIV R0, R2, R4 @numerator/denominator						
	POP {R3-R4};
	BX LR
