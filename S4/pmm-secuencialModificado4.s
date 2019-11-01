	.file	"pmm-secuencialModificado.c"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC4:
	.string	"Tama\303\261o: %d\n"
.LC5:
	.string	"Tiempo(seg.):%11.9f\n"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC6:
	.string	"Resultado: v[0][0]=%f || v[%d][%d]=%f\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB45:
	.cfi_startproc
	movl	$0, %edx
	movl	$0, %ecx
	movsd	.LC0(%rip), %xmm6
	movsd	.LC1(%rip), %xmm5
	movapd	%xmm6, %xmm2
	movapd	%xmm5, %xmm1
	xorpd	%xmm3, %xmm3
	jmp	.L2
.L5:
	cvtsi2sd	%eax, %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, v1(%rdx,%rax,8)
	movsd	%xmm4, v2(%rdx,%rax,8)
	movsd	%xmm3, v3(%rdx,%rax,8)
	addq	$1, %rax
	cmpq	$500, %rax
	jne	.L5
	addl	$1, %ecx
	addq	$8000, %rdx
	cmpl	$500, %ecx
	je	.L4
.L2:
	cvtsi2sd	%ecx, %xmm0
	mulsd	%xmm6, %xmm0
	movapd	%xmm5, %xmm4
	subsd	%xmm0, %xmm4
	movl	$0, %eax
	jmp	.L5
.L8:
	.cfi_def_cfa_offset 128
	.cfi_offset 3, -56
	.cfi_offset 6, -48
	.cfi_offset 12, -40
	.cfi_offset 13, -32
	.cfi_offset 14, -24
	.cfi_offset 15, -16
	movsd	(%rdi), %xmm13
	movsd	(%rdx), %xmm9
	movsd	8(%rdi), %xmm12
	movsd	8000(%rdx), %xmm8
	movsd	16(%rdi), %xmm11
	movsd	16000(%rdx), %xmm7
	movsd	24(%rdi), %xmm10
	movsd	24000(%rdx), %xmm6
	movapd	%xmm13, %xmm0
	mulsd	%xmm9, %xmm0
	addsd	(%rsi), %xmm0
	movapd	%xmm12, %xmm1
	mulsd	%xmm8, %xmm1
	addsd	%xmm1, %xmm0
	movapd	%xmm11, %xmm1
	mulsd	%xmm7, %xmm1
	addsd	%xmm1, %xmm0
	movapd	%xmm10, %xmm1
	mulsd	%xmm6, %xmm1
	addsd	%xmm1, %xmm0
	movsd	%xmm0, (%rsi)
	movsd	(%rdx,%r10,8), %xmm5
	movsd	8000(%rdx,%r10,8), %xmm4
	movapd	%xmm13, %xmm0
	mulsd	%xmm5, %xmm0
	addsd	8(%rsi), %xmm0
	movapd	%xmm12, %xmm1
	mulsd	%xmm4, %xmm1
	addsd	%xmm1, %xmm0
	movapd	%xmm11, %xmm1
	mulsd	16000(%rdx,%r10,8), %xmm1
	addsd	%xmm1, %xmm0
	movapd	%xmm10, %xmm1
	mulsd	24000(%rdx,%r10,8), %xmm1
	addsd	%xmm1, %xmm0
	movsd	%xmm0, 8(%rsi)
	movsd	24000(%rdx,%r9,8), %xmm3
	movapd	%xmm13, %xmm1
	mulsd	(%rdx,%r9,8), %xmm1
	addsd	16(%rsi), %xmm1
	movapd	%xmm12, %xmm2
	mulsd	8000(%rdx,%r9,8), %xmm2
	addsd	%xmm2, %xmm1
	movapd	%xmm11, %xmm2
	mulsd	16000(%rdx,%r9,8), %xmm2
	addsd	%xmm2, %xmm1
	movapd	%xmm10, %xmm0
	mulsd	%xmm3, %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, 16(%rsi)
	movsd	8000(%rdx,%r8,8), %xmm2
	movsd	16000(%rdx,%r8,8), %xmm1
	movsd	24000(%rdx,%r8,8), %xmm0
	mulsd	(%rdx,%r8,8), %xmm13
	addsd	24(%rsi), %xmm13
	mulsd	%xmm2, %xmm12
	addsd	%xmm13, %xmm12
	mulsd	%xmm1, %xmm11
	addsd	%xmm11, %xmm12
	mulsd	%xmm0, %xmm10
	addsd	%xmm10, %xmm12
	movsd	%xmm12, 24(%rsi)
	leaq	(%rdi,%r15), %rcx
	movsd	(%rcx,%rbp), %xmm13
	movsd	8(%rcx,%rbp), %xmm12
	movsd	16(%rcx,%rbp), %xmm11
	movsd	24(%rcx,%rbp), %xmm10
	movapd	%xmm9, %xmm15
	mulsd	%xmm13, %xmm15
	addsd	(%rax,%rbp), %xmm15
	movapd	%xmm8, %xmm14
	mulsd	%xmm12, %xmm14
	addsd	%xmm14, %xmm15
	movapd	%xmm7, %xmm14
	mulsd	%xmm11, %xmm14
	addsd	%xmm14, %xmm15
	movapd	%xmm6, %xmm14
	mulsd	%xmm10, %xmm14
	addsd	%xmm15, %xmm14
	movsd	%xmm14, (%rax,%rbp)
	movapd	%xmm5, %xmm15
	mulsd	%xmm13, %xmm15
	addsd	8(%rax,%rbp), %xmm15
	movapd	%xmm4, %xmm14
	mulsd	%xmm12, %xmm14
	addsd	%xmm14, %xmm15
	movapd	%xmm11, %xmm14
	mulsd	16000(%rdx,%r10,8), %xmm14
	addsd	%xmm14, %xmm15
	movapd	%xmm10, %xmm14
	mulsd	24000(%rdx,%r10,8), %xmm14
	addsd	%xmm15, %xmm14
	movsd	%xmm14, 8(%rax,%rbp)
	movapd	%xmm13, %xmm15
	mulsd	(%rdx,%r9,8), %xmm15
	addsd	16(%rax,%rbp), %xmm15
	movapd	%xmm12, %xmm14
	mulsd	8000(%rdx,%r9,8), %xmm14
	addsd	%xmm14, %xmm15
	movapd	%xmm11, %xmm14
	mulsd	16000(%rdx,%r9,8), %xmm14
	addsd	%xmm14, %xmm15
	movapd	%xmm3, %xmm14
	mulsd	%xmm10, %xmm14
	addsd	%xmm15, %xmm14
	movsd	%xmm14, 16(%rax,%rbp)
	mulsd	(%rdx,%r8,8), %xmm13
	addsd	24(%rax,%rbp), %xmm13
	mulsd	%xmm2, %xmm12
	addsd	%xmm13, %xmm12
	mulsd	%xmm1, %xmm11
	addsd	%xmm11, %xmm12
	mulsd	%xmm0, %xmm10
	addsd	%xmm10, %xmm12
	movsd	%xmm12, 24(%rax,%rbp)
	movsd	(%rcx,%r12), %xmm13
	movsd	8(%rcx,%r12), %xmm12
	movsd	16(%rcx,%r12), %xmm11
	movsd	24(%rcx,%r12), %xmm10
	movapd	%xmm9, %xmm15
	mulsd	%xmm13, %xmm15
	addsd	(%rax,%r12), %xmm15
	movapd	%xmm8, %xmm14
	mulsd	%xmm12, %xmm14
	addsd	%xmm14, %xmm15
	movapd	%xmm7, %xmm14
	mulsd	%xmm11, %xmm14
	addsd	%xmm14, %xmm15
	movapd	%xmm6, %xmm14
	mulsd	%xmm10, %xmm14
	addsd	%xmm15, %xmm14
	movsd	%xmm14, (%rax,%r12)
	movapd	%xmm5, %xmm15
	mulsd	%xmm13, %xmm15
	addsd	8(%rax,%r12), %xmm15
	movapd	%xmm4, %xmm14
	mulsd	%xmm12, %xmm14
	addsd	%xmm14, %xmm15
	movapd	%xmm11, %xmm14
	mulsd	16000(%rdx,%r10,8), %xmm14
	addsd	%xmm14, %xmm15
	movapd	%xmm10, %xmm14
	mulsd	24000(%rdx,%r10,8), %xmm14
	addsd	%xmm15, %xmm14
	movsd	%xmm14, 8(%rax,%r12)
	movapd	%xmm13, %xmm15
	mulsd	(%rdx,%r9,8), %xmm15
	addsd	16(%rax,%r12), %xmm15
	movapd	%xmm12, %xmm14
	mulsd	8000(%rdx,%r9,8), %xmm14
	addsd	%xmm14, %xmm15
	movapd	%xmm11, %xmm14
	mulsd	16000(%rdx,%r9,8), %xmm14
	addsd	%xmm14, %xmm15
	movapd	%xmm3, %xmm14
	mulsd	%xmm10, %xmm14
	addsd	%xmm15, %xmm14
	movsd	%xmm14, 16(%rax,%r12)
	mulsd	(%rdx,%r8,8), %xmm13
	addsd	24(%rax,%r12), %xmm13
	mulsd	%xmm2, %xmm12
	addsd	%xmm13, %xmm12
	mulsd	%xmm1, %xmm11
	addsd	%xmm11, %xmm12
	mulsd	%xmm0, %xmm10
	addsd	%xmm10, %xmm12
	movsd	%xmm12, 24(%rax,%r12)
	movsd	(%rcx,%r13), %xmm13
	movsd	8(%rcx,%r13), %xmm12
	movsd	16(%rcx,%r13), %xmm11
	movsd	24(%rcx,%r13), %xmm10
	mulsd	%xmm13, %xmm9
	addsd	(%rax,%r13), %xmm9
	mulsd	%xmm12, %xmm8
	addsd	%xmm9, %xmm8
	mulsd	%xmm11, %xmm7
	addsd	%xmm7, %xmm8
	mulsd	%xmm10, %xmm6
	addsd	%xmm6, %xmm8
	movsd	%xmm8, (%rax,%r13)
	mulsd	%xmm13, %xmm5
	addsd	8(%rax,%r13), %xmm5
	mulsd	%xmm12, %xmm4
	addsd	%xmm5, %xmm4
	movapd	%xmm11, %xmm6
	mulsd	16000(%rdx,%r10,8), %xmm6
	addsd	%xmm6, %xmm4
	movapd	%xmm10, %xmm6
	mulsd	24000(%rdx,%r10,8), %xmm6
	addsd	%xmm6, %xmm4
	movsd	%xmm4, 8(%rax,%r13)
	movapd	%xmm13, %xmm4
	mulsd	(%rdx,%r9,8), %xmm4
	addsd	16(%rax,%r13), %xmm4
	movapd	%xmm12, %xmm5
	mulsd	8000(%rdx,%r9,8), %xmm5
	addsd	%xmm5, %xmm4
	movapd	%xmm11, %xmm5
	mulsd	16000(%rdx,%r9,8), %xmm5
	addsd	%xmm5, %xmm4
	mulsd	%xmm10, %xmm3
	addsd	%xmm3, %xmm4
	movsd	%xmm4, 16(%rax,%r13)
	movapd	%xmm13, %xmm3
	mulsd	(%rdx,%r8,8), %xmm3
	addsd	24(%rax,%r13), %xmm3
	mulsd	%xmm2, %xmm12
	addsd	%xmm12, %xmm3
	movapd	%xmm3, %xmm2
	mulsd	%xmm1, %xmm11
	addsd	%xmm11, %xmm2
	mulsd	%xmm0, %xmm10
	movapd	%xmm2, %xmm0
	addsd	%xmm10, %xmm0
	movsd	%xmm0, 24(%rax,%r13)
	addq	$32, %rdi
	addq	$32000, %rdx
	subl	$1, %r11d
	jne	.L8
	addq	$32, %r14
	addq	$32, %rsi
	addq	$4, (%rsp)
	addq	$4, %rbx
	addq	$4, 8(%rsp)
	addq	$4, 16(%rsp)
	cmpq	$500, %rbx
	je	.L7
.L10:
	movq	%r14, %rdx
	movq	24(%rsp), %rdi
	movl	$125, %r11d
	movq	(%rsp), %r10
	subq	%rbx, %r10
	movq	8(%rsp), %r9
	subq	%rbx, %r9
	movq	16(%rsp), %r8
	subq	%rbx, %r8
	leaq	(%rsi,%r15), %rax
	jmp	.L8
.L7:
	subq	$32000, %r15
	addq	$32000, %rbp
	addq	$32000, %r12
	addq	$32000, %r13
	cmpq	$-4000000, %r15
	je	.L9
.L11:
	movl	$v2, %r14d
	movl	$v3, %esi
	subq	%r15, %rsi
	movq	$3, 16(%rsp)
	movq	$2, 8(%rsp)
	movl	$0, %ebx
	movq	$1, (%rsp)
	movl	$v1, %eax
	subq	%r15, %rax
	movq	%rax, 24(%rsp)
	jmp	.L10
.L4:
	.cfi_def_cfa_offset 8
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	.cfi_restore 13
	.cfi_restore 14
	.cfi_restore 15
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$72, %rsp
	.cfi_def_cfa_offset 128
	leaq	32(%rsp), %rsi
	movl	$0, %edi
	call	clock_gettime
	movl	$24000, %r13d
	movl	$16000, %r12d
	movl	$8000, %ebp
	movl	$0, %r15d
	jmp	.L11
.L9:
	leaq	48(%rsp), %rsi
	movl	$0, %edi
	call	clock_gettime
	movq	48(%rsp), %rax
	subq	32(%rsp), %rax
	cvtsi2sdq	%rax, %xmm1
	movq	56(%rsp), %rax
	subq	40(%rsp), %rax
	cvtsi2sdq	%rax, %xmm0
	divsd	.LC3(%rip), %xmm0
	addsd	%xmm0, %xmm1
	movsd	%xmm1, (%rsp)
	movl	$500, %edx
	movl	$.LC4, %esi
	movl	$1, %edi
	movl	$0, %eax
	call	__printf_chk
	movsd	(%rsp), %xmm0
	movl	$.LC5, %esi
	movl	$1, %edi
	movl	$1, %eax
	call	__printf_chk
	movsd	v3+3995992(%rip), %xmm1
	movl	$499, %ecx
	movl	$499, %edx
	movsd	v3(%rip), %xmm0
	movl	$.LC6, %esi
	movl	$1, %edi
	movl	$2, %eax
	call	__printf_chk
	movl	$0, %eax
	addq	$72, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_restore 3
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_restore 12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_restore 13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_restore 14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_restore 15
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE45:
	.size	main, .-main
	.globl	v3
	.bss
	.align 32
	.type	v3, @object
	.size	v3, 8000000
v3:
	.zero	8000000
	.globl	v2
	.align 32
	.type	v2, @object
	.size	v2, 8000000
v2:
	.zero	8000000
	.globl	v1
	.align 32
	.type	v1, @object
	.size	v1, 8000000
v1:
	.zero	8000000
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC0:
	.long	2576980378
	.long	1069128089
	.align 8
.LC1:
	.long	0
	.long	1078525952
	.align 8
.LC3:
	.long	0
	.long	1104006501
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04.4) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
