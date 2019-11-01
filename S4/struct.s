	.file	"struct.cc"
	.globl	s
	.bss
	.align 32
	.type	s, @object
	.size	s, 40000
s:
	.zero	40000
	.section	.rodata
.LC1:
	.string	"Valor es %d\n"
.LC2:
	.string	"Tiempo(seg.):%11.9f\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB86:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$160080, %rsp
	movl	$0, %edi
	call	time
	movl	%eax, %edi
	call	srand
	movl	$0, -160056(%rbp)
	jmp	.L2
.L3:
	movl	-160056(%rbp), %eax
	cltq
	movl	-160056(%rbp), %edx
	movl	%edx, s(,%rax,8)
	movl	-160056(%rbp), %eax
	cltq
	movl	-160056(%rbp), %edx
	movl	%edx, s+4(,%rax,8)
	addl	$1, -160056(%rbp)
.L2:
	cmpl	$4999, -160056(%rbp)
	jle	.L3
	leaq	-160032(%rbp), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	clock_gettime
	movl	$0, -160052(%rbp)
	jmp	.L4
.L11:
	movl	$0, -160064(%rbp)
	movl	$0, -160060(%rbp)
	movl	$0, -160048(%rbp)
	jmp	.L5
.L6:
	movl	-160048(%rbp), %eax
	cltq
	movl	s(,%rax,8), %eax
	leal	(%rax,%rax), %edx
	movl	-160052(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, -160064(%rbp)
	addl	$1, -160048(%rbp)
.L5:
	cmpl	$4999, -160048(%rbp)
	jle	.L6
	movl	$0, -160044(%rbp)
	jmp	.L7
.L8:
	movl	-160044(%rbp), %eax
	cltq
	movl	s+4(,%rax,8), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	subl	-160052(%rbp), %eax
	movl	%eax, -160060(%rbp)
	addl	$1, -160044(%rbp)
.L7:
	cmpl	$4999, -160044(%rbp)
	jle	.L8
	movl	-160064(%rbp), %eax
	cmpl	-160060(%rbp), %eax
	jge	.L9
	movl	-160052(%rbp), %eax
	cltq
	movl	-160064(%rbp), %edx
	movl	%edx, -160000(%rbp,%rax,4)
	jmp	.L10
.L9:
	movl	-160052(%rbp), %eax
	cltq
	movl	-160060(%rbp), %edx
	movl	%edx, -160000(%rbp,%rax,4)
.L10:
	addl	$1, -160052(%rbp)
.L4:
	cmpl	$39999, -160052(%rbp)
	jle	.L11
	leaq	-160016(%rbp), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	clock_gettime
	movq	-160016(%rbp), %rdx
	movq	-160032(%rbp), %rax
	subq	%rax, %rdx
	movq	%rdx, %rax
	cvtsi2sdq	%rax, %xmm1
	movq	-160008(%rbp), %rdx
	movq	-160024(%rbp), %rax
	subq	%rax, %rdx
	movq	%rdx, %rax
	cvtsi2sdq	%rax, %xmm0
	movsd	.LC0(%rip), %xmm2
	divsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -160040(%rbp)
	leaq	-160000(%rbp), %rax
	leaq	160000(%rax), %rcx
	leaq	-160000(%rbp), %rax
	movl	$0, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	_ZSt10accumulateIPiiET0_T_S2_S1_
	movl	%eax, %esi
	movl	$.LC1, %edi
	movl	$0, %eax
	call	printf
	movq	-160040(%rbp), %rax
	movq	%rax, -160072(%rbp)
	movsd	-160072(%rbp), %xmm0
	movl	$.LC2, %edi
	movl	$1, %eax
	call	printf
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE86:
	.size	main, .-main
	.section	.text._ZSt10accumulateIPiiET0_T_S2_S1_,"axG",@progbits,_ZSt10accumulateIPiiET0_T_S2_S1_,comdat
	.weak	_ZSt10accumulateIPiiET0_T_S2_S1_
	.type	_ZSt10accumulateIPiiET0_T_S2_S1_, @function
_ZSt10accumulateIPiiET0_T_S2_S1_:
.LFB87:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movl	%edx, -20(%rbp)
	jmp	.L14
.L15:
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	addl	%eax, -20(%rbp)
	addq	$4, -8(%rbp)
.L14:
	movq	-8(%rbp), %rax
	cmpq	-16(%rbp), %rax
	jne	.L15
	movl	-20(%rbp), %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE87:
	.size	_ZSt10accumulateIPiiET0_T_S2_S1_, .-_ZSt10accumulateIPiiET0_T_S2_S1_
	.section	.rodata
	.align 4
	.type	_ZL1N, @object
	.size	_ZL1N, 4
_ZL1N:
	.long	5000
	.align 4
	.type	_ZL3REP, @object
	.size	_ZL3REP, 4
_ZL3REP:
	.long	40000
	.align 8
.LC0:
	.long	0
	.long	1104006501
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04.4) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
