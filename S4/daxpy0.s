	.file	"daxpy.c"
	.section	.rodata
.LC4:
	.string	"Tama\303\261o: %d\n"
.LC5:
	.string	"Tiempo(seg.):%11.9f\n"
	.align 8
.LC6:
	.string	"Resultado: v[0]=%f || v[%d]=%f\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$96, %rsp
	movl	$100000000, -68(%rbp)
	movl	-68(%rbp), %eax
	cltq
	salq	$3, %rax
	movq	%rax, %rdi
	call	malloc
	movq	%rax, -64(%rbp)
	movl	-68(%rbp), %eax
	cltq
	salq	$3, %rax
	movq	%rax, %rdi
	call	malloc
	movq	%rax, -56(%rbp)
	movabsq	$4612361558371493478, %rax
	movq	%rax, -48(%rbp)
	movl	$0, -72(%rbp)
	jmp	.L2
.L3:
	movl	-72(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	cvtsi2sd	-68(%rbp), %xmm0
	movsd	.LC1(%rip), %xmm1
	mulsd	%xmm1, %xmm0
	cvtsi2sd	-72(%rbp), %xmm1
	movsd	.LC2(%rip), %xmm2
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movsd	%xmm0, (%rax)
	movl	-72(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-64(%rbp), %rax
	addq	%rdx, %rax
	cvtsi2sd	-68(%rbp), %xmm0
	movsd	.LC1(%rip), %xmm1
	mulsd	%xmm0, %xmm1
	cvtsi2sd	-72(%rbp), %xmm0
	movsd	.LC2(%rip), %xmm2
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, (%rax)
	addl	$1, -72(%rbp)
.L2:
	movl	-72(%rbp), %eax
	cmpl	-68(%rbp), %eax
	jl	.L3
	leaq	-32(%rbp), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	clock_gettime
	movl	$0, -72(%rbp)
	jmp	.L4
.L5:
	movl	-72(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	movl	-72(%rbp), %edx
	movslq	%edx, %rdx
	leaq	0(,%rdx,8), %rcx
	movq	-64(%rbp), %rdx
	addq	%rcx, %rdx
	movsd	(%rdx), %xmm0
	mulsd	-48(%rbp), %xmm0
	movl	-72(%rbp), %edx
	movslq	%edx, %rdx
	leaq	0(,%rdx,8), %rcx
	movq	-56(%rbp), %rdx
	addq	%rcx, %rdx
	movsd	(%rdx), %xmm1
	addsd	%xmm1, %xmm0
	movsd	%xmm0, (%rax)
	addl	$1, -72(%rbp)
.L4:
	movl	-72(%rbp), %eax
	cmpl	-68(%rbp), %eax
	jl	.L5
	leaq	-16(%rbp), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	clock_gettime
	movq	-16(%rbp), %rdx
	movq	-32(%rbp), %rax
	subq	%rax, %rdx
	movq	%rdx, %rax
	cvtsi2sdq	%rax, %xmm1
	movq	-8(%rbp), %rdx
	movq	-24(%rbp), %rax
	subq	%rax, %rdx
	movq	%rdx, %rax
	cvtsi2sdq	%rax, %xmm0
	movsd	.LC3(%rip), %xmm2
	divsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -40(%rbp)
	movl	-68(%rbp), %eax
	movl	%eax, %esi
	movl	$.LC4, %edi
	movl	$0, %eax
	call	printf
	movq	-40(%rbp), %rax
	movq	%rax, -88(%rbp)
	movsd	-88(%rbp), %xmm0
	movl	$.LC5, %edi
	movl	$1, %eax
	call	printf
	movl	-68(%rbp), %eax
	cltq
	salq	$3, %rax
	leaq	-8(%rax), %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rdx
	movl	-68(%rbp), %eax
	leal	-1(%rax), %ecx
	movq	-56(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, -88(%rbp)
	movsd	-88(%rbp), %xmm1
	movl	%ecx, %esi
	movq	%rax, -88(%rbp)
	movsd	-88(%rbp), %xmm0
	movl	$.LC6, %edi
	movl	$2, %eax
	call	printf
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	main, .-main
	.section	.rodata
	.align 8
.LC1:
	.long	858993459
	.long	1070805811
	.align 8
.LC2:
	.long	0
	.long	1071644672
	.align 8
.LC3:
	.long	0
	.long	1104006501
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04.4) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
