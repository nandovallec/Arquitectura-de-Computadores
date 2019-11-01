	.file	"daxpy.c"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC12:
	.string	"%d %11.9f\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB39:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	movl	$10, %edx
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$56, %rsp
	.cfi_def_cfa_offset 96
	movq	8(%rsi), %rdi
	xorl	%esi, %esi
	call	strtol
	movslq	%eax, %rbp
	movq	%rax, %rbx
	salq	$3, %rbp
	movq	%rbp, %rdi
	call	malloc
	movq	%rbp, %rdi
	movq	%rax, %r12
	call	malloc
	testl	%ebx, %ebx
	jle	.L2
	cvtsi2sd	%ebx, %xmm0
	movq	%rax, %r13
	movq	%rax, %rbp
	salq	$60, %r13
	movl	%ebx, %eax
	shrq	$63, %r13
	cmpl	%ebx, %r13d
	cmova	%ebx, %r13d
	cmpl	$6, %ebx
	cmova	%r13d, %eax
	testl	%eax, %eax
	mulsd	.LC0(%rip), %xmm0
	je	.L23
	xorpd	%xmm1, %xmm1
	cmpl	$1, %eax
	movsd	%xmm0, 0(%rbp)
	addsd	%xmm0, %xmm1
	movsd	%xmm1, (%r12)
	jbe	.L24
	movsd	.LC2(%rip), %xmm1
	movapd	%xmm0, %xmm2
	cmpl	$2, %eax
	subsd	%xmm1, %xmm2
	addsd	%xmm0, %xmm1
	movsd	%xmm2, 8(%rbp)
	movsd	%xmm1, 8(%r12)
	jbe	.L25
	movsd	.LC3(%rip), %xmm1
	movapd	%xmm0, %xmm2
	cmpl	$3, %eax
	subsd	%xmm1, %xmm2
	addsd	%xmm0, %xmm1
	movsd	%xmm2, 16(%rbp)
	movsd	%xmm1, 16(%r12)
	jbe	.L26
	movsd	.LC4(%rip), %xmm1
	movapd	%xmm0, %xmm2
	cmpl	$4, %eax
	subsd	%xmm1, %xmm2
	addsd	%xmm0, %xmm1
	movsd	%xmm2, 24(%rbp)
	movsd	%xmm1, 24(%r12)
	jbe	.L27
	movsd	.LC5(%rip), %xmm1
	movapd	%xmm0, %xmm2
	cmpl	$5, %eax
	subsd	%xmm1, %xmm2
	addsd	%xmm0, %xmm1
	movsd	%xmm2, 32(%rbp)
	movsd	%xmm1, 32(%r12)
	jbe	.L28
	movsd	.LC6(%rip), %xmm1
	movapd	%xmm0, %xmm2
	movl	$6, %edx
	subsd	%xmm1, %xmm2
	addsd	%xmm0, %xmm1
	movsd	%xmm2, 40(%rbp)
	movsd	%xmm1, 40(%r12)
.L5:
	cmpl	%eax, %ebx
	je	.L6
.L4:
	movl	%ebx, %r9d
	movl	%eax, %ecx
	subl	%eax, %r9d
	movl	%r9d, %edi
	shrl	$2, %edi
	leal	0(,%rdi,4), %r8d
	testl	%r8d, %r8d
	je	.L7
	leal	1(%rdx), %eax
	movapd	%xmm0, %xmm3
	movapd	.LC8(%rip), %xmm4
	xorl	%esi, %esi
	movl	%eax, 4(%rsp)
	leal	2(%rdx), %eax
	unpcklpd	%xmm3, %xmm3
	movl	%eax, 8(%rsp)
	leal	3(%rdx), %eax
	movd	8(%rsp), %xmm2
	movl	%edx, 8(%rsp)
	movl	%eax, 12(%rsp)
	movd	8(%rsp), %xmm1
	leaq	0(,%rcx,8), %rax
	movd	12(%rsp), %xmm6
	leaq	0(%rbp,%rax), %rcx
	addq	%r12, %rax
	punpckldq	%xmm6, %xmm2
	movd	4(%rsp), %xmm6
	punpckldq	%xmm6, %xmm1
	movdqa	.LC7(%rip), %xmm6
	punpcklqdq	%xmm2, %xmm1
.L12:
	cvtdq2pd	%xmm1, %xmm2
	mulpd	%xmm4, %xmm2
	movapd	%xmm3, %xmm5
	movdqa	%xmm1, %xmm7
	addl	$1, %esi
	pshufd	$238, %xmm1, %xmm1
	addq	$32, %rcx
	addq	$32, %rax
	paddd	%xmm6, %xmm7
	subpd	%xmm2, %xmm5
	cvtdq2pd	%xmm1, %xmm1
	mulpd	%xmm4, %xmm1
	addpd	%xmm3, %xmm2
	movapd	%xmm5, -32(%rcx)
	movapd	%xmm3, %xmm5
	movlpd	%xmm2, -32(%rax)
	subpd	%xmm1, %xmm5
	movhpd	%xmm2, -24(%rax)
	addpd	%xmm3, %xmm1
	movapd	%xmm5, -16(%rcx)
	movlpd	%xmm1, -16(%rax)
	movhpd	%xmm1, -8(%rax)
	cmpl	%edi, %esi
	jnb	.L46
	movdqa	%xmm7, %xmm1
	jmp	.L12
.L46:
	addl	%r8d, %edx
	cmpl	%r8d, %r9d
	je	.L6
.L7:
	cvtsi2sd	%edx, %xmm1
	movapd	%xmm0, %xmm3
	movsd	.LC2(%rip), %xmm2
	movslq	%edx, %rax
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm3
	addsd	%xmm0, %xmm1
	movsd	%xmm3, 0(%rbp,%rax,8)
	movsd	%xmm1, (%r12,%rax,8)
	leal	1(%rdx), %eax
	cmpl	%eax, %ebx
	jle	.L6
	cvtsi2sd	%eax, %xmm1
	movapd	%xmm0, %xmm3
	addl	$2, %edx
	movslq	%eax, %rcx
	cmpl	%edx, %ebx
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm3
	addsd	%xmm0, %xmm1
	movsd	%xmm3, 0(%rbp,%rcx,8)
	movsd	%xmm1, (%r12,%rcx,8)
	jle	.L6
	cvtsi2sd	%edx, %xmm1
	movslq	%edx, %rax
	mulsd	%xmm2, %xmm1
	movapd	%xmm0, %xmm2
	addsd	%xmm1, %xmm0
	subsd	%xmm1, %xmm2
	movsd	%xmm0, (%r12,%rax,8)
	movsd	%xmm2, 0(%rbp,%rax,8)
.L6:
	leaq	16(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime
	cmpl	$3, %ebx
	movl	%r13d, %eax
	cmovbe	%ebx, %eax
	testl	%eax, %eax
	je	.L16
	movsd	.LC10(%rip), %xmm0
	cmpl	$1, %eax
	movsd	(%r12), %xmm1
	mulsd	%xmm0, %xmm1
	addsd	0(%rbp), %xmm1
	movsd	%xmm1, 0(%rbp)
	jbe	.L17
	movsd	8(%r12), %xmm1
	cmpl	$2, %eax
	mulsd	%xmm0, %xmm1
	addsd	8(%rbp), %xmm1
	movsd	%xmm1, 8(%rbp)
	jbe	.L17
	mulsd	16(%r12), %xmm0
	addsd	16(%rbp), %xmm0
	movsd	%xmm0, 16(%rbp)
.L17:
	cmpl	%ebx, %eax
	je	.L21
.L16:
	movl	%ebx, %edx
	movl	%eax, %ecx
	subl	%eax, %edx
	shrl	%edx
	je	.L21
	leaq	0(,%rcx,8), %rax
	movapd	.LC9(%rip), %xmm1
	xorl	%ecx, %ecx
	addq	%rax, %r12
	addq	%rax, %rbp
	xorl	%eax, %eax
.L20:
	movsd	(%r12,%rcx), %xmm0
	addl	$1, %eax
	movhpd	8(%r12,%rcx), %xmm0
	mulpd	%xmm1, %xmm0
	addpd	0(%rbp,%rcx), %xmm0
	movapd	%xmm0, 0(%rbp,%rcx)
	addq	$16, %rcx
	cmpl	%eax, %edx
	ja	.L20
.L21:
	leaq	32(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime
	movq	32(%rsp), %rax
	subq	16(%rsp), %rax
	movl	%ebx, %edx
	movl	$.LC12, %esi
	movl	$1, %edi
	cvtsi2sdq	%rax, %xmm0
	movq	40(%rsp), %rax
	subq	24(%rsp), %rax
	cvtsi2sdq	%rax, %xmm1
	movl	$1, %eax
	divsd	.LC11(%rip), %xmm1
	addsd	%xmm1, %xmm0
	call	__printf_chk
	addq	$56, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
.L23:
	.cfi_restore_state
	xorl	%edx, %edx
	jmp	.L4
.L27:
	movl	$4, %edx
	jmp	.L5
.L24:
	movl	$1, %edx
	jmp	.L5
.L25:
	movl	$2, %edx
	jmp	.L5
.L28:
	movl	$5, %edx
	jmp	.L5
.L26:
	movl	$3, %edx
	jmp	.L5
.L2:
	leaq	16(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime
	jmp	.L21
	.cfi_endproc
.LFE39:
	.size	main, .-main
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC0:
	.long	858993459
	.long	1070805811
	.align 8
.LC2:
	.long	0
	.long	1071644672
	.align 8
.LC3:
	.long	0
	.long	1072693248
	.align 8
.LC4:
	.long	0
	.long	1073217536
	.align 8
.LC5:
	.long	0
	.long	1073741824
	.align 8
.LC6:
	.long	0
	.long	1074003968
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC7:
	.long	4
	.long	4
	.long	4
	.long	4
	.align 16
.LC8:
	.long	0
	.long	1071644672
	.long	0
	.long	1071644672
	.align 16
.LC9:
	.long	1717986918
	.long	1073899110
	.long	1717986918
	.long	1073899110
	.section	.rodata.cst8
	.align 8
.LC10:
	.long	1717986918
	.long	1073899110
	.align 8
.LC11:
	.long	0
	.long	1104006501
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04.4) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
