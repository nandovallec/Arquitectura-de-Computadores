	.file	"daxpy.c"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC4:
	.string	"Tama\303\261o: %d\n"
.LC5:
	.string	"Tiempo(seg.):%11.9f\n"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC6:
	.string	"Resultado: v[0]=%f || v[%d]=%f\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB39:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movl	$800000000, %edi
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$56, %rsp
	.cfi_def_cfa_offset 80
	call	malloc
	movl	$800000000, %edi
	movq	%rax, %rbp
	call	malloc
	movsd	.LC0(%rip), %xmm3
	movq	%rax, %rbx
	movsd	.LC1(%rip), %xmm1
	xorl	%edx, %edx
	.p2align 4,,10
	.p2align 3
.L3:
	cvtsi2sd	%edx, %xmm0
	movapd	%xmm1, %xmm2
	mulsd	%xmm3, %xmm0
	subsd	%xmm0, %xmm2
	addsd	%xmm1, %xmm0
	movsd	%xmm2, (%rbx,%rdx,8)
	movsd	%xmm0, 0(%rbp,%rdx,8)
	addq	$1, %rdx
	cmpq	$100000000, %rdx
	jne	.L3
	leaq	16(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime
	movsd	.LC2(%rip), %xmm1
	xorl	%edx, %edx
	.p2align 4,,10
	.p2align 3
.L5:
	movsd	0(%rbp,%rdx), %xmm0
	mulsd	%xmm1, %xmm0
	addsd	(%rbx,%rdx), %xmm0
	movsd	%xmm0, (%rbx,%rdx)
	addq	$8, %rdx
	cmpq	$800000000, %rdx
	jne	.L5
	leaq	32(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime
	movq	32(%rsp), %rax
	subq	16(%rsp), %rax
	movl	$100000000, %edx
	movl	$.LC4, %esi
	movl	$1, %edi
	cvtsi2sdq	%rax, %xmm0
	movq	40(%rsp), %rax
	subq	24(%rsp), %rax
	cvtsi2sdq	%rax, %xmm1
	xorl	%eax, %eax
	divsd	.LC3(%rip), %xmm1
	addsd	%xmm1, %xmm0
	movsd	%xmm0, 8(%rsp)
	call	__printf_chk
	movsd	8(%rsp), %xmm0
	movl	$.LC5, %esi
	movl	$1, %edi
	movl	$1, %eax
	call	__printf_chk
	movsd	799999992(%rbx), %xmm1
	movl	$99999999, %edx
	movsd	(%rbx), %xmm0
	movl	$.LC6, %esi
	movl	$1, %edi
	movl	$2, %eax
	call	__printf_chk
	addq	$56, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE39:
	.size	main, .-main
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC0:
	.long	0
	.long	1071644672
	.align 8
.LC1:
	.long	0
	.long	1098685496
	.align 8
.LC2:
	.long	1717986918
	.long	1073899110
	.align 8
.LC3:
	.long	0
	.long	1104006501
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04.4) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
