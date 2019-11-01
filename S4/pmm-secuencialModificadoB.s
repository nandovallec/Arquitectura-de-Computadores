	.file	"pmm-secuencialModificado.c"
	.comm	v1,8000000,32
	.comm	v2,8000000,32
	.comm	v3,8000000,32
	.section	.rodata
.LC3:
	.string	"V1"
.LC4:
	.string	"%f "
.LC5:
	.string	"\nV2"
.LC6:
	.string	"\nV3"
.LC7:
	.string	"V[%d][%d]=%f"
.LC8:
	.string	"Tama\303\261o: %d\n"
.LC9:
	.string	"Tiempo(seg.):%11.9f\n"
	.align 8
.LC10:
	.string	"Resultado: v[0][0]=%f || v[%d][%d]=%f\n"
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
	movl	%edi, -68(%rbp)
	movq	%rsi, -80(%rbp)
	movl	$500, -52(%rbp)
	movl	$0, -64(%rbp)
	jmp	.L2
.L9:
	movl	$0, -60(%rbp)
	jmp	.L3
.L8:
	movl	-52(%rbp), %eax
	testq	%rax, %rax
	js	.L4
	cvtsi2sdq	%rax, %xmm0
	jmp	.L5
.L4:
	movq	%rax, %rdx
	shrq	%rdx
	andl	$1, %eax
	orq	%rax, %rdx
	cvtsi2sdq	%rdx, %xmm0
	addsd	%xmm0, %xmm0
.L5:
	movsd	.LC0(%rip), %xmm1
	mulsd	%xmm0, %xmm1
	cvtsi2sd	-60(%rbp), %xmm0
	movsd	.LC0(%rip), %xmm2
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movl	-60(%rbp), %eax
	cltq
	movl	-64(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	%xmm0, v1(,%rax,8)
	movl	-52(%rbp), %eax
	testq	%rax, %rax
	js	.L6
	cvtsi2sdq	%rax, %xmm0
	jmp	.L7
.L6:
	movq	%rax, %rdx
	shrq	%rdx
	andl	$1, %eax
	orq	%rax, %rdx
	cvtsi2sdq	%rdx, %xmm0
	addsd	%xmm0, %xmm0
.L7:
	movsd	.LC0(%rip), %xmm1
	mulsd	%xmm1, %xmm0
	cvtsi2sd	-64(%rbp), %xmm1
	movsd	.LC0(%rip), %xmm2
	mulsd	%xmm2, %xmm1
	subsd	%xmm1, %xmm0
	movl	-60(%rbp), %eax
	cltq
	movl	-64(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	%xmm0, v2(,%rax,8)
	movl	-60(%rbp), %eax
	cltq
	movl	-64(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rax, %rdx
	movl	$0, %eax
	movq	%rax, v3(,%rdx,8)
	addl	$1, -60(%rbp)
.L3:
	movl	-60(%rbp), %eax
	cmpl	-52(%rbp), %eax
	jb	.L8
	addl	$1, -64(%rbp)
.L2:
	movl	-64(%rbp), %eax
	cmpl	-52(%rbp), %eax
	jb	.L9
	movl	$0, %eax
	movq	%rax, -48(%rbp)
	leaq	-32(%rbp), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	clock_gettime
	movl	$0, -64(%rbp)
	jmp	.L10
.L15:
	movl	$0, -60(%rbp)
	jmp	.L11
.L14:
	movl	$0, -56(%rbp)
	jmp	.L12
.L13:
	movl	-60(%rbp), %eax
	cltq
	movl	-64(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v3(,%rax,8), %xmm1
	movl	-56(%rbp), %eax
	cltq
	movl	-64(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v1(,%rax,8), %xmm2
	movl	-60(%rbp), %eax
	cltq
	movl	-56(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v2(,%rax,8), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movl	-60(%rbp), %eax
	cltq
	movl	-64(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	%xmm0, v3(,%rax,8)
	movl	-60(%rbp), %eax
	cltq
	movl	-64(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v3(,%rax,8), %xmm1
	movl	-56(%rbp), %eax
	addl	$1, %eax
	cltq
	movl	-64(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v1(,%rax,8), %xmm2
	movl	-56(%rbp), %eax
	leal	1(%rax), %edx
	movl	-60(%rbp), %eax
	cltq
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v2(,%rax,8), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movl	-60(%rbp), %eax
	cltq
	movl	-64(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	%xmm0, v3(,%rax,8)
	movl	-60(%rbp), %eax
	cltq
	movl	-64(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v3(,%rax,8), %xmm1
	movl	-56(%rbp), %eax
	addl	$2, %eax
	cltq
	movl	-64(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v1(,%rax,8), %xmm2
	movl	-56(%rbp), %eax
	leal	2(%rax), %edx
	movl	-60(%rbp), %eax
	cltq
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v2(,%rax,8), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movl	-60(%rbp), %eax
	cltq
	movl	-64(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	%xmm0, v3(,%rax,8)
	movl	-60(%rbp), %eax
	cltq
	movl	-64(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v3(,%rax,8), %xmm1
	movl	-56(%rbp), %eax
	addl	$3, %eax
	cltq
	movl	-64(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v1(,%rax,8), %xmm2
	movl	-56(%rbp), %eax
	leal	3(%rax), %edx
	movl	-60(%rbp), %eax
	cltq
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v2(,%rax,8), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movl	-60(%rbp), %eax
	cltq
	movl	-64(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	%xmm0, v3(,%rax,8)
	movl	-60(%rbp), %eax
	leal	1(%rax), %ecx
	movl	-60(%rbp), %eax
	addl	$1, %eax
	cltq
	movl	-64(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v3(,%rax,8), %xmm1
	movl	-56(%rbp), %eax
	cltq
	movl	-64(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v1(,%rax,8), %xmm2
	movl	-60(%rbp), %eax
	addl	$1, %eax
	cltq
	movl	-56(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v2(,%rax,8), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movslq	%ecx, %rax
	movl	-64(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	%xmm0, v3(,%rax,8)
	movl	-60(%rbp), %eax
	leal	1(%rax), %ecx
	movl	-60(%rbp), %eax
	addl	$1, %eax
	cltq
	movl	-64(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v3(,%rax,8), %xmm1
	movl	-56(%rbp), %eax
	addl	$1, %eax
	cltq
	movl	-64(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v1(,%rax,8), %xmm2
	movl	-56(%rbp), %eax
	leal	1(%rax), %edx
	movl	-60(%rbp), %eax
	addl	$1, %eax
	cltq
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v2(,%rax,8), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movslq	%ecx, %rax
	movl	-64(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	%xmm0, v3(,%rax,8)
	movl	-60(%rbp), %eax
	leal	1(%rax), %ecx
	movl	-60(%rbp), %eax
	addl	$1, %eax
	cltq
	movl	-64(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v3(,%rax,8), %xmm1
	movl	-56(%rbp), %eax
	addl	$2, %eax
	cltq
	movl	-64(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v1(,%rax,8), %xmm2
	movl	-56(%rbp), %eax
	leal	2(%rax), %edx
	movl	-60(%rbp), %eax
	addl	$1, %eax
	cltq
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v2(,%rax,8), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movslq	%ecx, %rax
	movl	-64(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	%xmm0, v3(,%rax,8)
	movl	-60(%rbp), %eax
	leal	1(%rax), %ecx
	movl	-60(%rbp), %eax
	addl	$1, %eax
	cltq
	movl	-64(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v3(,%rax,8), %xmm1
	movl	-56(%rbp), %eax
	addl	$3, %eax
	cltq
	movl	-64(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v1(,%rax,8), %xmm2
	movl	-56(%rbp), %eax
	leal	3(%rax), %edx
	movl	-60(%rbp), %eax
	addl	$1, %eax
	cltq
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v2(,%rax,8), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movslq	%ecx, %rax
	movl	-64(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	%xmm0, v3(,%rax,8)
	movl	-60(%rbp), %eax
	leal	2(%rax), %ecx
	movl	-60(%rbp), %eax
	addl	$2, %eax
	cltq
	movl	-64(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v3(,%rax,8), %xmm1
	movl	-56(%rbp), %eax
	cltq
	movl	-64(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v1(,%rax,8), %xmm2
	movl	-60(%rbp), %eax
	addl	$2, %eax
	cltq
	movl	-56(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v2(,%rax,8), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movslq	%ecx, %rax
	movl	-64(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	%xmm0, v3(,%rax,8)
	movl	-60(%rbp), %eax
	leal	2(%rax), %ecx
	movl	-60(%rbp), %eax
	addl	$2, %eax
	cltq
	movl	-64(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v3(,%rax,8), %xmm1
	movl	-56(%rbp), %eax
	addl	$1, %eax
	cltq
	movl	-64(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v1(,%rax,8), %xmm2
	movl	-56(%rbp), %eax
	leal	1(%rax), %edx
	movl	-60(%rbp), %eax
	addl	$2, %eax
	cltq
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v2(,%rax,8), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movslq	%ecx, %rax
	movl	-64(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	%xmm0, v3(,%rax,8)
	movl	-60(%rbp), %eax
	leal	2(%rax), %ecx
	movl	-60(%rbp), %eax
	addl	$2, %eax
	cltq
	movl	-64(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v3(,%rax,8), %xmm1
	movl	-56(%rbp), %eax
	addl	$2, %eax
	cltq
	movl	-64(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v1(,%rax,8), %xmm2
	movl	-56(%rbp), %eax
	leal	2(%rax), %edx
	movl	-60(%rbp), %eax
	addl	$2, %eax
	cltq
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v2(,%rax,8), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movslq	%ecx, %rax
	movl	-64(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	%xmm0, v3(,%rax,8)
	movl	-60(%rbp), %eax
	leal	2(%rax), %ecx
	movl	-60(%rbp), %eax
	addl	$2, %eax
	cltq
	movl	-64(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v3(,%rax,8), %xmm1
	movl	-56(%rbp), %eax
	addl	$3, %eax
	cltq
	movl	-64(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v1(,%rax,8), %xmm2
	movl	-56(%rbp), %eax
	leal	3(%rax), %edx
	movl	-60(%rbp), %eax
	addl	$2, %eax
	cltq
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v2(,%rax,8), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movslq	%ecx, %rax
	movl	-64(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	%xmm0, v3(,%rax,8)
	movl	-60(%rbp), %eax
	leal	3(%rax), %ecx
	movl	-60(%rbp), %eax
	addl	$3, %eax
	cltq
	movl	-64(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v3(,%rax,8), %xmm1
	movl	-56(%rbp), %eax
	cltq
	movl	-64(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v1(,%rax,8), %xmm2
	movl	-60(%rbp), %eax
	addl	$3, %eax
	cltq
	movl	-56(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v2(,%rax,8), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movslq	%ecx, %rax
	movl	-64(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	%xmm0, v3(,%rax,8)
	movl	-60(%rbp), %eax
	leal	3(%rax), %ecx
	movl	-60(%rbp), %eax
	addl	$3, %eax
	cltq
	movl	-64(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v3(,%rax,8), %xmm1
	movl	-56(%rbp), %eax
	addl	$1, %eax
	cltq
	movl	-64(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v1(,%rax,8), %xmm2
	movl	-56(%rbp), %eax
	leal	1(%rax), %edx
	movl	-60(%rbp), %eax
	addl	$3, %eax
	cltq
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v2(,%rax,8), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movslq	%ecx, %rax
	movl	-64(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	%xmm0, v3(,%rax,8)
	movl	-60(%rbp), %eax
	leal	3(%rax), %ecx
	movl	-60(%rbp), %eax
	addl	$3, %eax
	cltq
	movl	-64(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v3(,%rax,8), %xmm1
	movl	-56(%rbp), %eax
	addl	$2, %eax
	cltq
	movl	-64(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v1(,%rax,8), %xmm2
	movl	-56(%rbp), %eax
	leal	2(%rax), %edx
	movl	-60(%rbp), %eax
	addl	$3, %eax
	cltq
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v2(,%rax,8), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movslq	%ecx, %rax
	movl	-64(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	%xmm0, v3(,%rax,8)
	movl	-60(%rbp), %eax
	leal	3(%rax), %ecx
	movl	-60(%rbp), %eax
	addl	$3, %eax
	cltq
	movl	-64(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v3(,%rax,8), %xmm1
	movl	-56(%rbp), %eax
	addl	$3, %eax
	cltq
	movl	-64(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v1(,%rax,8), %xmm2
	movl	-56(%rbp), %eax
	leal	3(%rax), %edx
	movl	-60(%rbp), %eax
	addl	$3, %eax
	cltq
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v2(,%rax,8), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movslq	%ecx, %rax
	movl	-64(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	%xmm0, v3(,%rax,8)
	movl	-64(%rbp), %eax
	leal	1(%rax), %ecx
	movl	-64(%rbp), %eax
	leal	1(%rax), %edx
	movl	-60(%rbp), %eax
	cltq
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v3(,%rax,8), %xmm1
	movl	-64(%rbp), %eax
	leal	1(%rax), %edx
	movl	-56(%rbp), %eax
	cltq
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v1(,%rax,8), %xmm2
	movl	-60(%rbp), %eax
	cltq
	movl	-56(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v2(,%rax,8), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movl	-60(%rbp), %eax
	cltq
	movslq	%ecx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	%xmm0, v3(,%rax,8)
	movl	-64(%rbp), %eax
	leal	1(%rax), %ecx
	movl	-64(%rbp), %eax
	leal	1(%rax), %edx
	movl	-60(%rbp), %eax
	cltq
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v3(,%rax,8), %xmm1
	movl	-64(%rbp), %eax
	leal	1(%rax), %edx
	movl	-56(%rbp), %eax
	addl	$1, %eax
	cltq
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v1(,%rax,8), %xmm2
	movl	-56(%rbp), %eax
	leal	1(%rax), %edx
	movl	-60(%rbp), %eax
	cltq
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v2(,%rax,8), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movl	-60(%rbp), %eax
	cltq
	movslq	%ecx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	%xmm0, v3(,%rax,8)
	movl	-64(%rbp), %eax
	leal	1(%rax), %ecx
	movl	-64(%rbp), %eax
	leal	1(%rax), %edx
	movl	-60(%rbp), %eax
	cltq
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v3(,%rax,8), %xmm1
	movl	-64(%rbp), %eax
	leal	1(%rax), %edx
	movl	-56(%rbp), %eax
	addl	$2, %eax
	cltq
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v1(,%rax,8), %xmm2
	movl	-56(%rbp), %eax
	leal	2(%rax), %edx
	movl	-60(%rbp), %eax
	cltq
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v2(,%rax,8), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movl	-60(%rbp), %eax
	cltq
	movslq	%ecx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	%xmm0, v3(,%rax,8)
	movl	-64(%rbp), %eax
	leal	1(%rax), %ecx
	movl	-64(%rbp), %eax
	leal	1(%rax), %edx
	movl	-60(%rbp), %eax
	cltq
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v3(,%rax,8), %xmm1
	movl	-64(%rbp), %eax
	leal	1(%rax), %edx
	movl	-56(%rbp), %eax
	addl	$3, %eax
	cltq
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v1(,%rax,8), %xmm2
	movl	-56(%rbp), %eax
	leal	3(%rax), %edx
	movl	-60(%rbp), %eax
	cltq
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v2(,%rax,8), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movl	-60(%rbp), %eax
	cltq
	movslq	%ecx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	%xmm0, v3(,%rax,8)
	movl	-64(%rbp), %eax
	leal	1(%rax), %ecx
	movl	-60(%rbp), %eax
	leal	1(%rax), %esi
	movl	-64(%rbp), %eax
	leal	1(%rax), %edx
	movl	-60(%rbp), %eax
	addl	$1, %eax
	cltq
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v3(,%rax,8), %xmm1
	movl	-64(%rbp), %eax
	leal	1(%rax), %edx
	movl	-56(%rbp), %eax
	cltq
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v1(,%rax,8), %xmm2
	movl	-60(%rbp), %eax
	addl	$1, %eax
	cltq
	movl	-56(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v2(,%rax,8), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movslq	%esi, %rax
	movslq	%ecx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	%xmm0, v3(,%rax,8)
	movl	-64(%rbp), %eax
	leal	1(%rax), %ecx
	movl	-60(%rbp), %eax
	leal	1(%rax), %esi
	movl	-64(%rbp), %eax
	leal	1(%rax), %edx
	movl	-60(%rbp), %eax
	addl	$1, %eax
	cltq
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v3(,%rax,8), %xmm1
	movl	-64(%rbp), %eax
	leal	1(%rax), %edx
	movl	-56(%rbp), %eax
	addl	$1, %eax
	cltq
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v1(,%rax,8), %xmm2
	movl	-56(%rbp), %eax
	leal	1(%rax), %edx
	movl	-60(%rbp), %eax
	addl	$1, %eax
	cltq
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v2(,%rax,8), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movslq	%esi, %rax
	movslq	%ecx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	%xmm0, v3(,%rax,8)
	movl	-64(%rbp), %eax
	leal	1(%rax), %ecx
	movl	-60(%rbp), %eax
	leal	1(%rax), %esi
	movl	-64(%rbp), %eax
	leal	1(%rax), %edx
	movl	-60(%rbp), %eax
	addl	$1, %eax
	cltq
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v3(,%rax,8), %xmm1
	movl	-64(%rbp), %eax
	leal	1(%rax), %edx
	movl	-56(%rbp), %eax
	addl	$2, %eax
	cltq
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v1(,%rax,8), %xmm2
	movl	-56(%rbp), %eax
	leal	2(%rax), %edx
	movl	-60(%rbp), %eax
	addl	$1, %eax
	cltq
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v2(,%rax,8), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movslq	%esi, %rax
	movslq	%ecx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	%xmm0, v3(,%rax,8)
	movl	-64(%rbp), %eax
	leal	1(%rax), %ecx
	movl	-60(%rbp), %eax
	leal	1(%rax), %esi
	movl	-64(%rbp), %eax
	leal	1(%rax), %edx
	movl	-60(%rbp), %eax
	addl	$1, %eax
	cltq
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v3(,%rax,8), %xmm1
	movl	-64(%rbp), %eax
	leal	1(%rax), %edx
	movl	-56(%rbp), %eax
	addl	$3, %eax
	cltq
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v1(,%rax,8), %xmm2
	movl	-56(%rbp), %eax
	leal	3(%rax), %edx
	movl	-60(%rbp), %eax
	addl	$1, %eax
	cltq
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v2(,%rax,8), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movslq	%esi, %rax
	movslq	%ecx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	%xmm0, v3(,%rax,8)
	movl	-64(%rbp), %eax
	leal	1(%rax), %ecx
	movl	-60(%rbp), %eax
	leal	2(%rax), %esi
	movl	-64(%rbp), %eax
	leal	1(%rax), %edx
	movl	-60(%rbp), %eax
	addl	$2, %eax
	cltq
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v3(,%rax,8), %xmm1
	movl	-64(%rbp), %eax
	leal	1(%rax), %edx
	movl	-56(%rbp), %eax
	cltq
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v1(,%rax,8), %xmm2
	movl	-60(%rbp), %eax
	addl	$2, %eax
	cltq
	movl	-56(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v2(,%rax,8), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movslq	%esi, %rax
	movslq	%ecx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	%xmm0, v3(,%rax,8)
	movl	-64(%rbp), %eax
	leal	1(%rax), %ecx
	movl	-60(%rbp), %eax
	leal	2(%rax), %esi
	movl	-64(%rbp), %eax
	leal	1(%rax), %edx
	movl	-60(%rbp), %eax
	addl	$2, %eax
	cltq
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v3(,%rax,8), %xmm1
	movl	-64(%rbp), %eax
	leal	1(%rax), %edx
	movl	-56(%rbp), %eax
	addl	$1, %eax
	cltq
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v1(,%rax,8), %xmm2
	movl	-56(%rbp), %eax
	leal	1(%rax), %edx
	movl	-60(%rbp), %eax
	addl	$2, %eax
	cltq
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v2(,%rax,8), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movslq	%esi, %rax
	movslq	%ecx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	%xmm0, v3(,%rax,8)
	movl	-64(%rbp), %eax
	leal	1(%rax), %ecx
	movl	-60(%rbp), %eax
	leal	2(%rax), %esi
	movl	-64(%rbp), %eax
	leal	1(%rax), %edx
	movl	-60(%rbp), %eax
	addl	$2, %eax
	cltq
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v3(,%rax,8), %xmm1
	movl	-64(%rbp), %eax
	leal	1(%rax), %edx
	movl	-56(%rbp), %eax
	addl	$2, %eax
	cltq
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v1(,%rax,8), %xmm2
	movl	-56(%rbp), %eax
	leal	2(%rax), %edx
	movl	-60(%rbp), %eax
	addl	$2, %eax
	cltq
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v2(,%rax,8), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movslq	%esi, %rax
	movslq	%ecx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	%xmm0, v3(,%rax,8)
	movl	-64(%rbp), %eax
	leal	1(%rax), %ecx
	movl	-60(%rbp), %eax
	leal	2(%rax), %esi
	movl	-64(%rbp), %eax
	leal	1(%rax), %edx
	movl	-60(%rbp), %eax
	addl	$2, %eax
	cltq
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v3(,%rax,8), %xmm1
	movl	-64(%rbp), %eax
	leal	1(%rax), %edx
	movl	-56(%rbp), %eax
	addl	$3, %eax
	cltq
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v1(,%rax,8), %xmm2
	movl	-56(%rbp), %eax
	leal	3(%rax), %edx
	movl	-60(%rbp), %eax
	addl	$2, %eax
	cltq
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v2(,%rax,8), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movslq	%esi, %rax
	movslq	%ecx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	%xmm0, v3(,%rax,8)
	movl	-64(%rbp), %eax
	leal	1(%rax), %ecx
	movl	-60(%rbp), %eax
	leal	3(%rax), %esi
	movl	-64(%rbp), %eax
	leal	1(%rax), %edx
	movl	-60(%rbp), %eax
	addl	$3, %eax
	cltq
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v3(,%rax,8), %xmm1
	movl	-64(%rbp), %eax
	leal	1(%rax), %edx
	movl	-56(%rbp), %eax
	cltq
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v1(,%rax,8), %xmm2
	movl	-60(%rbp), %eax
	addl	$3, %eax
	cltq
	movl	-56(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v2(,%rax,8), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movslq	%esi, %rax
	movslq	%ecx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	%xmm0, v3(,%rax,8)
	movl	-64(%rbp), %eax
	leal	1(%rax), %ecx
	movl	-60(%rbp), %eax
	leal	3(%rax), %esi
	movl	-64(%rbp), %eax
	leal	1(%rax), %edx
	movl	-60(%rbp), %eax
	addl	$3, %eax
	cltq
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v3(,%rax,8), %xmm1
	movl	-64(%rbp), %eax
	leal	1(%rax), %edx
	movl	-56(%rbp), %eax
	addl	$1, %eax
	cltq
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v1(,%rax,8), %xmm2
	movl	-56(%rbp), %eax
	leal	1(%rax), %edx
	movl	-60(%rbp), %eax
	addl	$3, %eax
	cltq
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v2(,%rax,8), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movslq	%esi, %rax
	movslq	%ecx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	%xmm0, v3(,%rax,8)
	movl	-64(%rbp), %eax
	leal	1(%rax), %ecx
	movl	-60(%rbp), %eax
	leal	3(%rax), %esi
	movl	-64(%rbp), %eax
	leal	1(%rax), %edx
	movl	-60(%rbp), %eax
	addl	$3, %eax
	cltq
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v3(,%rax,8), %xmm1
	movl	-64(%rbp), %eax
	leal	1(%rax), %edx
	movl	-56(%rbp), %eax
	addl	$2, %eax
	cltq
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v1(,%rax,8), %xmm2
	movl	-56(%rbp), %eax
	leal	2(%rax), %edx
	movl	-60(%rbp), %eax
	addl	$3, %eax
	cltq
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v2(,%rax,8), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movslq	%esi, %rax
	movslq	%ecx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	%xmm0, v3(,%rax,8)
	movl	-64(%rbp), %eax
	leal	1(%rax), %ecx
	movl	-60(%rbp), %eax
	leal	3(%rax), %esi
	movl	-64(%rbp), %eax
	leal	1(%rax), %edx
	movl	-60(%rbp), %eax
	addl	$3, %eax
	cltq
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v3(,%rax,8), %xmm1
	movl	-64(%rbp), %eax
	leal	1(%rax), %edx
	movl	-56(%rbp), %eax
	addl	$3, %eax
	cltq
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v1(,%rax,8), %xmm2
	movl	-56(%rbp), %eax
	leal	3(%rax), %edx
	movl	-60(%rbp), %eax
	addl	$3, %eax
	cltq
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v2(,%rax,8), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movslq	%esi, %rax
	movslq	%ecx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	%xmm0, v3(,%rax,8)
	movl	-64(%rbp), %eax
	leal	2(%rax), %ecx
	movl	-64(%rbp), %eax
	leal	2(%rax), %edx
	movl	-60(%rbp), %eax
	cltq
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v3(,%rax,8), %xmm1
	movl	-64(%rbp), %eax
	leal	2(%rax), %edx
	movl	-56(%rbp), %eax
	cltq
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v1(,%rax,8), %xmm2
	movl	-60(%rbp), %eax
	cltq
	movl	-56(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v2(,%rax,8), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movl	-60(%rbp), %eax
	cltq
	movslq	%ecx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	%xmm0, v3(,%rax,8)
	movl	-64(%rbp), %eax
	leal	2(%rax), %ecx
	movl	-64(%rbp), %eax
	leal	2(%rax), %edx
	movl	-60(%rbp), %eax
	cltq
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v3(,%rax,8), %xmm1
	movl	-64(%rbp), %eax
	leal	2(%rax), %edx
	movl	-56(%rbp), %eax
	addl	$1, %eax
	cltq
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v1(,%rax,8), %xmm2
	movl	-56(%rbp), %eax
	leal	1(%rax), %edx
	movl	-60(%rbp), %eax
	cltq
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v2(,%rax,8), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movl	-60(%rbp), %eax
	cltq
	movslq	%ecx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	%xmm0, v3(,%rax,8)
	movl	-64(%rbp), %eax
	leal	2(%rax), %ecx
	movl	-64(%rbp), %eax
	leal	2(%rax), %edx
	movl	-60(%rbp), %eax
	cltq
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v3(,%rax,8), %xmm1
	movl	-64(%rbp), %eax
	leal	2(%rax), %edx
	movl	-56(%rbp), %eax
	addl	$2, %eax
	cltq
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v1(,%rax,8), %xmm2
	movl	-56(%rbp), %eax
	leal	2(%rax), %edx
	movl	-60(%rbp), %eax
	cltq
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v2(,%rax,8), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movl	-60(%rbp), %eax
	cltq
	movslq	%ecx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	%xmm0, v3(,%rax,8)
	movl	-64(%rbp), %eax
	leal	2(%rax), %ecx
	movl	-64(%rbp), %eax
	leal	2(%rax), %edx
	movl	-60(%rbp), %eax
	cltq
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v3(,%rax,8), %xmm1
	movl	-64(%rbp), %eax
	leal	2(%rax), %edx
	movl	-56(%rbp), %eax
	addl	$3, %eax
	cltq
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v1(,%rax,8), %xmm2
	movl	-56(%rbp), %eax
	leal	3(%rax), %edx
	movl	-60(%rbp), %eax
	cltq
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v2(,%rax,8), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movl	-60(%rbp), %eax
	cltq
	movslq	%ecx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	%xmm0, v3(,%rax,8)
	movl	-64(%rbp), %eax
	leal	2(%rax), %ecx
	movl	-60(%rbp), %eax
	leal	1(%rax), %esi
	movl	-64(%rbp), %eax
	leal	2(%rax), %edx
	movl	-60(%rbp), %eax
	addl	$1, %eax
	cltq
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v3(,%rax,8), %xmm1
	movl	-64(%rbp), %eax
	leal	2(%rax), %edx
	movl	-56(%rbp), %eax
	cltq
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v1(,%rax,8), %xmm2
	movl	-60(%rbp), %eax
	addl	$1, %eax
	cltq
	movl	-56(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v2(,%rax,8), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movslq	%esi, %rax
	movslq	%ecx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	%xmm0, v3(,%rax,8)
	movl	-64(%rbp), %eax
	leal	2(%rax), %ecx
	movl	-60(%rbp), %eax
	leal	1(%rax), %esi
	movl	-64(%rbp), %eax
	leal	2(%rax), %edx
	movl	-60(%rbp), %eax
	addl	$1, %eax
	cltq
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v3(,%rax,8), %xmm1
	movl	-64(%rbp), %eax
	leal	2(%rax), %edx
	movl	-56(%rbp), %eax
	addl	$1, %eax
	cltq
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v1(,%rax,8), %xmm2
	movl	-56(%rbp), %eax
	leal	1(%rax), %edx
	movl	-60(%rbp), %eax
	addl	$1, %eax
	cltq
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v2(,%rax,8), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movslq	%esi, %rax
	movslq	%ecx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	%xmm0, v3(,%rax,8)
	movl	-64(%rbp), %eax
	leal	2(%rax), %ecx
	movl	-60(%rbp), %eax
	leal	1(%rax), %esi
	movl	-64(%rbp), %eax
	leal	2(%rax), %edx
	movl	-60(%rbp), %eax
	addl	$1, %eax
	cltq
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v3(,%rax,8), %xmm1
	movl	-64(%rbp), %eax
	leal	2(%rax), %edx
	movl	-56(%rbp), %eax
	addl	$2, %eax
	cltq
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v1(,%rax,8), %xmm2
	movl	-56(%rbp), %eax
	leal	2(%rax), %edx
	movl	-60(%rbp), %eax
	addl	$1, %eax
	cltq
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v2(,%rax,8), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movslq	%esi, %rax
	movslq	%ecx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	%xmm0, v3(,%rax,8)
	movl	-64(%rbp), %eax
	leal	2(%rax), %ecx
	movl	-60(%rbp), %eax
	leal	1(%rax), %esi
	movl	-64(%rbp), %eax
	leal	2(%rax), %edx
	movl	-60(%rbp), %eax
	addl	$1, %eax
	cltq
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v3(,%rax,8), %xmm1
	movl	-64(%rbp), %eax
	leal	2(%rax), %edx
	movl	-56(%rbp), %eax
	addl	$3, %eax
	cltq
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v1(,%rax,8), %xmm2
	movl	-56(%rbp), %eax
	leal	3(%rax), %edx
	movl	-60(%rbp), %eax
	addl	$1, %eax
	cltq
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v2(,%rax,8), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movslq	%esi, %rax
	movslq	%ecx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	%xmm0, v3(,%rax,8)
	movl	-64(%rbp), %eax
	leal	2(%rax), %ecx
	movl	-60(%rbp), %eax
	leal	2(%rax), %esi
	movl	-64(%rbp), %eax
	leal	2(%rax), %edx
	movl	-60(%rbp), %eax
	addl	$2, %eax
	cltq
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v3(,%rax,8), %xmm1
	movl	-64(%rbp), %eax
	leal	2(%rax), %edx
	movl	-56(%rbp), %eax
	cltq
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v1(,%rax,8), %xmm2
	movl	-60(%rbp), %eax
	addl	$2, %eax
	cltq
	movl	-56(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v2(,%rax,8), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movslq	%esi, %rax
	movslq	%ecx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	%xmm0, v3(,%rax,8)
	movl	-64(%rbp), %eax
	leal	2(%rax), %ecx
	movl	-60(%rbp), %eax
	leal	2(%rax), %esi
	movl	-64(%rbp), %eax
	leal	2(%rax), %edx
	movl	-60(%rbp), %eax
	addl	$2, %eax
	cltq
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v3(,%rax,8), %xmm1
	movl	-64(%rbp), %eax
	leal	2(%rax), %edx
	movl	-56(%rbp), %eax
	addl	$1, %eax
	cltq
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v1(,%rax,8), %xmm2
	movl	-56(%rbp), %eax
	leal	1(%rax), %edx
	movl	-60(%rbp), %eax
	addl	$2, %eax
	cltq
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v2(,%rax,8), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movslq	%esi, %rax
	movslq	%ecx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	%xmm0, v3(,%rax,8)
	movl	-64(%rbp), %eax
	leal	2(%rax), %ecx
	movl	-60(%rbp), %eax
	leal	2(%rax), %esi
	movl	-64(%rbp), %eax
	leal	2(%rax), %edx
	movl	-60(%rbp), %eax
	addl	$2, %eax
	cltq
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v3(,%rax,8), %xmm1
	movl	-64(%rbp), %eax
	leal	2(%rax), %edx
	movl	-56(%rbp), %eax
	addl	$2, %eax
	cltq
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v1(,%rax,8), %xmm2
	movl	-56(%rbp), %eax
	leal	2(%rax), %edx
	movl	-60(%rbp), %eax
	addl	$2, %eax
	cltq
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v2(,%rax,8), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movslq	%esi, %rax
	movslq	%ecx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	%xmm0, v3(,%rax,8)
	movl	-64(%rbp), %eax
	leal	2(%rax), %ecx
	movl	-60(%rbp), %eax
	leal	2(%rax), %esi
	movl	-64(%rbp), %eax
	leal	2(%rax), %edx
	movl	-60(%rbp), %eax
	addl	$2, %eax
	cltq
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v3(,%rax,8), %xmm1
	movl	-64(%rbp), %eax
	leal	2(%rax), %edx
	movl	-56(%rbp), %eax
	addl	$3, %eax
	cltq
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v1(,%rax,8), %xmm2
	movl	-56(%rbp), %eax
	leal	3(%rax), %edx
	movl	-60(%rbp), %eax
	addl	$2, %eax
	cltq
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v2(,%rax,8), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movslq	%esi, %rax
	movslq	%ecx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	%xmm0, v3(,%rax,8)
	movl	-64(%rbp), %eax
	leal	2(%rax), %ecx
	movl	-60(%rbp), %eax
	leal	3(%rax), %esi
	movl	-64(%rbp), %eax
	leal	2(%rax), %edx
	movl	-60(%rbp), %eax
	addl	$3, %eax
	cltq
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v3(,%rax,8), %xmm1
	movl	-64(%rbp), %eax
	leal	2(%rax), %edx
	movl	-56(%rbp), %eax
	cltq
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v1(,%rax,8), %xmm2
	movl	-60(%rbp), %eax
	addl	$3, %eax
	cltq
	movl	-56(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v2(,%rax,8), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movslq	%esi, %rax
	movslq	%ecx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	%xmm0, v3(,%rax,8)
	movl	-64(%rbp), %eax
	leal	2(%rax), %ecx
	movl	-60(%rbp), %eax
	leal	3(%rax), %esi
	movl	-64(%rbp), %eax
	leal	2(%rax), %edx
	movl	-60(%rbp), %eax
	addl	$3, %eax
	cltq
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v3(,%rax,8), %xmm1
	movl	-64(%rbp), %eax
	leal	2(%rax), %edx
	movl	-56(%rbp), %eax
	addl	$1, %eax
	cltq
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v1(,%rax,8), %xmm2
	movl	-56(%rbp), %eax
	leal	1(%rax), %edx
	movl	-60(%rbp), %eax
	addl	$3, %eax
	cltq
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v2(,%rax,8), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movslq	%esi, %rax
	movslq	%ecx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	%xmm0, v3(,%rax,8)
	movl	-64(%rbp), %eax
	leal	2(%rax), %ecx
	movl	-60(%rbp), %eax
	leal	3(%rax), %esi
	movl	-64(%rbp), %eax
	leal	2(%rax), %edx
	movl	-60(%rbp), %eax
	addl	$3, %eax
	cltq
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v3(,%rax,8), %xmm1
	movl	-64(%rbp), %eax
	leal	2(%rax), %edx
	movl	-56(%rbp), %eax
	addl	$2, %eax
	cltq
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v1(,%rax,8), %xmm2
	movl	-56(%rbp), %eax
	leal	2(%rax), %edx
	movl	-60(%rbp), %eax
	addl	$3, %eax
	cltq
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v2(,%rax,8), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movslq	%esi, %rax
	movslq	%ecx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	%xmm0, v3(,%rax,8)
	movl	-64(%rbp), %eax
	leal	2(%rax), %ecx
	movl	-60(%rbp), %eax
	leal	3(%rax), %esi
	movl	-64(%rbp), %eax
	leal	2(%rax), %edx
	movl	-60(%rbp), %eax
	addl	$3, %eax
	cltq
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v3(,%rax,8), %xmm1
	movl	-64(%rbp), %eax
	leal	2(%rax), %edx
	movl	-56(%rbp), %eax
	addl	$3, %eax
	cltq
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v1(,%rax,8), %xmm2
	movl	-56(%rbp), %eax
	leal	3(%rax), %edx
	movl	-60(%rbp), %eax
	addl	$3, %eax
	cltq
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v2(,%rax,8), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movslq	%esi, %rax
	movslq	%ecx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	%xmm0, v3(,%rax,8)
	movl	-64(%rbp), %eax
	leal	3(%rax), %ecx
	movl	-64(%rbp), %eax
	leal	3(%rax), %edx
	movl	-60(%rbp), %eax
	cltq
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v3(,%rax,8), %xmm1
	movl	-64(%rbp), %eax
	leal	3(%rax), %edx
	movl	-56(%rbp), %eax
	cltq
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v1(,%rax,8), %xmm2
	movl	-60(%rbp), %eax
	cltq
	movl	-56(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v2(,%rax,8), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movl	-60(%rbp), %eax
	cltq
	movslq	%ecx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	%xmm0, v3(,%rax,8)
	movl	-64(%rbp), %eax
	leal	3(%rax), %ecx
	movl	-64(%rbp), %eax
	leal	3(%rax), %edx
	movl	-60(%rbp), %eax
	cltq
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v3(,%rax,8), %xmm1
	movl	-64(%rbp), %eax
	leal	3(%rax), %edx
	movl	-56(%rbp), %eax
	addl	$1, %eax
	cltq
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v1(,%rax,8), %xmm2
	movl	-56(%rbp), %eax
	leal	1(%rax), %edx
	movl	-60(%rbp), %eax
	cltq
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v2(,%rax,8), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movl	-60(%rbp), %eax
	cltq
	movslq	%ecx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	%xmm0, v3(,%rax,8)
	movl	-64(%rbp), %eax
	leal	3(%rax), %ecx
	movl	-64(%rbp), %eax
	leal	3(%rax), %edx
	movl	-60(%rbp), %eax
	cltq
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v3(,%rax,8), %xmm1
	movl	-64(%rbp), %eax
	leal	3(%rax), %edx
	movl	-56(%rbp), %eax
	addl	$2, %eax
	cltq
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v1(,%rax,8), %xmm2
	movl	-56(%rbp), %eax
	leal	2(%rax), %edx
	movl	-60(%rbp), %eax
	cltq
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v2(,%rax,8), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movl	-60(%rbp), %eax
	cltq
	movslq	%ecx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	%xmm0, v3(,%rax,8)
	movl	-64(%rbp), %eax
	leal	3(%rax), %ecx
	movl	-64(%rbp), %eax
	leal	3(%rax), %edx
	movl	-60(%rbp), %eax
	cltq
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v3(,%rax,8), %xmm1
	movl	-64(%rbp), %eax
	leal	3(%rax), %edx
	movl	-56(%rbp), %eax
	addl	$3, %eax
	cltq
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v1(,%rax,8), %xmm2
	movl	-56(%rbp), %eax
	leal	3(%rax), %edx
	movl	-60(%rbp), %eax
	cltq
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v2(,%rax,8), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movl	-60(%rbp), %eax
	cltq
	movslq	%ecx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	%xmm0, v3(,%rax,8)
	movl	-64(%rbp), %eax
	leal	3(%rax), %ecx
	movl	-60(%rbp), %eax
	leal	1(%rax), %esi
	movl	-64(%rbp), %eax
	leal	3(%rax), %edx
	movl	-60(%rbp), %eax
	addl	$1, %eax
	cltq
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v3(,%rax,8), %xmm1
	movl	-64(%rbp), %eax
	leal	3(%rax), %edx
	movl	-56(%rbp), %eax
	cltq
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v1(,%rax,8), %xmm2
	movl	-60(%rbp), %eax
	addl	$1, %eax
	cltq
	movl	-56(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v2(,%rax,8), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movslq	%esi, %rax
	movslq	%ecx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	%xmm0, v3(,%rax,8)
	movl	-64(%rbp), %eax
	leal	3(%rax), %ecx
	movl	-60(%rbp), %eax
	leal	1(%rax), %esi
	movl	-64(%rbp), %eax
	leal	3(%rax), %edx
	movl	-60(%rbp), %eax
	addl	$1, %eax
	cltq
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v3(,%rax,8), %xmm1
	movl	-64(%rbp), %eax
	leal	3(%rax), %edx
	movl	-56(%rbp), %eax
	addl	$1, %eax
	cltq
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v1(,%rax,8), %xmm2
	movl	-56(%rbp), %eax
	leal	1(%rax), %edx
	movl	-60(%rbp), %eax
	addl	$1, %eax
	cltq
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v2(,%rax,8), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movslq	%esi, %rax
	movslq	%ecx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	%xmm0, v3(,%rax,8)
	movl	-64(%rbp), %eax
	leal	3(%rax), %ecx
	movl	-60(%rbp), %eax
	leal	1(%rax), %esi
	movl	-64(%rbp), %eax
	leal	3(%rax), %edx
	movl	-60(%rbp), %eax
	addl	$1, %eax
	cltq
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v3(,%rax,8), %xmm1
	movl	-64(%rbp), %eax
	leal	3(%rax), %edx
	movl	-56(%rbp), %eax
	addl	$2, %eax
	cltq
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v1(,%rax,8), %xmm2
	movl	-56(%rbp), %eax
	leal	2(%rax), %edx
	movl	-60(%rbp), %eax
	addl	$1, %eax
	cltq
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v2(,%rax,8), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movslq	%esi, %rax
	movslq	%ecx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	%xmm0, v3(,%rax,8)
	movl	-64(%rbp), %eax
	leal	3(%rax), %ecx
	movl	-60(%rbp), %eax
	leal	1(%rax), %esi
	movl	-64(%rbp), %eax
	leal	3(%rax), %edx
	movl	-60(%rbp), %eax
	addl	$1, %eax
	cltq
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v3(,%rax,8), %xmm1
	movl	-64(%rbp), %eax
	leal	3(%rax), %edx
	movl	-56(%rbp), %eax
	addl	$3, %eax
	cltq
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v1(,%rax,8), %xmm2
	movl	-56(%rbp), %eax
	leal	3(%rax), %edx
	movl	-60(%rbp), %eax
	addl	$1, %eax
	cltq
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v2(,%rax,8), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movslq	%esi, %rax
	movslq	%ecx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	%xmm0, v3(,%rax,8)
	movl	-64(%rbp), %eax
	leal	3(%rax), %ecx
	movl	-60(%rbp), %eax
	leal	2(%rax), %esi
	movl	-64(%rbp), %eax
	leal	3(%rax), %edx
	movl	-60(%rbp), %eax
	addl	$2, %eax
	cltq
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v3(,%rax,8), %xmm1
	movl	-64(%rbp), %eax
	leal	3(%rax), %edx
	movl	-56(%rbp), %eax
	cltq
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v1(,%rax,8), %xmm2
	movl	-60(%rbp), %eax
	addl	$2, %eax
	cltq
	movl	-56(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v2(,%rax,8), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movslq	%esi, %rax
	movslq	%ecx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	%xmm0, v3(,%rax,8)
	movl	-64(%rbp), %eax
	leal	3(%rax), %ecx
	movl	-60(%rbp), %eax
	leal	2(%rax), %esi
	movl	-64(%rbp), %eax
	leal	3(%rax), %edx
	movl	-60(%rbp), %eax
	addl	$2, %eax
	cltq
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v3(,%rax,8), %xmm1
	movl	-64(%rbp), %eax
	leal	3(%rax), %edx
	movl	-56(%rbp), %eax
	addl	$1, %eax
	cltq
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v1(,%rax,8), %xmm2
	movl	-56(%rbp), %eax
	leal	1(%rax), %edx
	movl	-60(%rbp), %eax
	addl	$2, %eax
	cltq
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v2(,%rax,8), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movslq	%esi, %rax
	movslq	%ecx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	%xmm0, v3(,%rax,8)
	movl	-64(%rbp), %eax
	leal	3(%rax), %ecx
	movl	-60(%rbp), %eax
	leal	2(%rax), %esi
	movl	-64(%rbp), %eax
	leal	3(%rax), %edx
	movl	-60(%rbp), %eax
	addl	$2, %eax
	cltq
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v3(,%rax,8), %xmm1
	movl	-64(%rbp), %eax
	leal	3(%rax), %edx
	movl	-56(%rbp), %eax
	addl	$2, %eax
	cltq
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v1(,%rax,8), %xmm2
	movl	-56(%rbp), %eax
	leal	2(%rax), %edx
	movl	-60(%rbp), %eax
	addl	$2, %eax
	cltq
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v2(,%rax,8), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movslq	%esi, %rax
	movslq	%ecx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	%xmm0, v3(,%rax,8)
	movl	-64(%rbp), %eax
	leal	3(%rax), %ecx
	movl	-60(%rbp), %eax
	leal	2(%rax), %esi
	movl	-64(%rbp), %eax
	leal	3(%rax), %edx
	movl	-60(%rbp), %eax
	addl	$2, %eax
	cltq
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v3(,%rax,8), %xmm1
	movl	-64(%rbp), %eax
	leal	3(%rax), %edx
	movl	-56(%rbp), %eax
	addl	$3, %eax
	cltq
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v1(,%rax,8), %xmm2
	movl	-56(%rbp), %eax
	leal	3(%rax), %edx
	movl	-60(%rbp), %eax
	addl	$2, %eax
	cltq
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v2(,%rax,8), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movslq	%esi, %rax
	movslq	%ecx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	%xmm0, v3(,%rax,8)
	movl	-64(%rbp), %eax
	leal	3(%rax), %ecx
	movl	-60(%rbp), %eax
	leal	3(%rax), %esi
	movl	-64(%rbp), %eax
	leal	3(%rax), %edx
	movl	-60(%rbp), %eax
	addl	$3, %eax
	cltq
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v3(,%rax,8), %xmm1
	movl	-64(%rbp), %eax
	leal	3(%rax), %edx
	movl	-56(%rbp), %eax
	cltq
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v1(,%rax,8), %xmm2
	movl	-60(%rbp), %eax
	addl	$3, %eax
	cltq
	movl	-56(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v2(,%rax,8), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movslq	%esi, %rax
	movslq	%ecx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	%xmm0, v3(,%rax,8)
	movl	-64(%rbp), %eax
	leal	3(%rax), %ecx
	movl	-60(%rbp), %eax
	leal	3(%rax), %esi
	movl	-64(%rbp), %eax
	leal	3(%rax), %edx
	movl	-60(%rbp), %eax
	addl	$3, %eax
	cltq
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v3(,%rax,8), %xmm1
	movl	-64(%rbp), %eax
	leal	3(%rax), %edx
	movl	-56(%rbp), %eax
	addl	$1, %eax
	cltq
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v1(,%rax,8), %xmm2
	movl	-56(%rbp), %eax
	leal	1(%rax), %edx
	movl	-60(%rbp), %eax
	addl	$3, %eax
	cltq
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v2(,%rax,8), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movslq	%esi, %rax
	movslq	%ecx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	%xmm0, v3(,%rax,8)
	movl	-64(%rbp), %eax
	leal	3(%rax), %ecx
	movl	-60(%rbp), %eax
	leal	3(%rax), %esi
	movl	-64(%rbp), %eax
	leal	3(%rax), %edx
	movl	-60(%rbp), %eax
	addl	$3, %eax
	cltq
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v3(,%rax,8), %xmm1
	movl	-64(%rbp), %eax
	leal	3(%rax), %edx
	movl	-56(%rbp), %eax
	addl	$2, %eax
	cltq
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v1(,%rax,8), %xmm2
	movl	-56(%rbp), %eax
	leal	2(%rax), %edx
	movl	-60(%rbp), %eax
	addl	$3, %eax
	cltq
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v2(,%rax,8), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movslq	%esi, %rax
	movslq	%ecx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	%xmm0, v3(,%rax,8)
	movl	-64(%rbp), %eax
	leal	3(%rax), %ecx
	movl	-60(%rbp), %eax
	leal	3(%rax), %esi
	movl	-64(%rbp), %eax
	leal	3(%rax), %edx
	movl	-60(%rbp), %eax
	addl	$3, %eax
	cltq
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v3(,%rax,8), %xmm1
	movl	-64(%rbp), %eax
	leal	3(%rax), %edx
	movl	-56(%rbp), %eax
	addl	$3, %eax
	cltq
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v1(,%rax,8), %xmm2
	movl	-56(%rbp), %eax
	leal	3(%rax), %edx
	movl	-60(%rbp), %eax
	addl	$3, %eax
	cltq
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	v2(,%rax,8), %xmm0
	mulsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movslq	%esi, %rax
	movslq	%ecx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movsd	%xmm0, v3(,%rax,8)
	addl	$4, -56(%rbp)
.L12:
	movl	-56(%rbp), %eax
	cmpl	-52(%rbp), %eax
	jb	.L13
	addl	$4, -60(%rbp)
.L11:
	movl	-60(%rbp), %eax
	cmpl	-52(%rbp), %eax
	jb	.L14
	addl	$4, -64(%rbp)
.L10:
	movl	-64(%rbp), %eax
	cmpl	-52(%rbp), %eax
	jb	.L15
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
	movsd	.LC2(%rip), %xmm2
	divsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -40(%rbp)
	cmpl	$14, -52(%rbp)
	ja	.L16
	movl	$.LC3, %edi
	call	puts
	movl	$0, -64(%rbp)
	jmp	.L17
.L20:
	movl	$0, -60(%rbp)
	jmp	.L18
.L19:
	movl	-60(%rbp), %eax
	cltq
	movl	-64(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movq	v1(,%rax,8), %rax
	movq	%rax, -88(%rbp)
	movsd	-88(%rbp), %xmm0
	movl	$.LC4, %edi
	movl	$1, %eax
	call	printf
	addl	$1, -60(%rbp)
.L18:
	movl	-60(%rbp), %eax
	cmpl	-52(%rbp), %eax
	jb	.L19
	movl	$10, %edi
	call	putchar
	addl	$1, -64(%rbp)
.L17:
	movl	-64(%rbp), %eax
	cmpl	-52(%rbp), %eax
	jb	.L20
	movl	$.LC5, %edi
	call	puts
	movl	$0, -64(%rbp)
	jmp	.L21
.L24:
	movl	$0, -60(%rbp)
	jmp	.L22
.L23:
	movl	-60(%rbp), %eax
	cltq
	movl	-64(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movq	v2(,%rax,8), %rax
	movq	%rax, -88(%rbp)
	movsd	-88(%rbp), %xmm0
	movl	$.LC4, %edi
	movl	$1, %eax
	call	printf
	addl	$1, -60(%rbp)
.L22:
	movl	-60(%rbp), %eax
	cmpl	-52(%rbp), %eax
	jb	.L23
	movl	$10, %edi
	call	putchar
	addl	$1, -64(%rbp)
.L21:
	movl	-64(%rbp), %eax
	cmpl	-52(%rbp), %eax
	jb	.L24
	movl	$.LC6, %edi
	call	puts
	movl	$0, -64(%rbp)
	jmp	.L25
.L28:
	movl	$0, -60(%rbp)
	jmp	.L26
.L27:
	movl	-60(%rbp), %eax
	cltq
	movl	-64(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movq	v3(,%rax,8), %rax
	movl	-60(%rbp), %edx
	movl	-64(%rbp), %ecx
	movq	%rax, -88(%rbp)
	movsd	-88(%rbp), %xmm0
	movl	%ecx, %esi
	movl	$.LC7, %edi
	movl	$1, %eax
	call	printf
	addl	$1, -60(%rbp)
.L26:
	movl	-60(%rbp), %eax
	cmpl	-52(%rbp), %eax
	jb	.L27
	addl	$1, -64(%rbp)
.L25:
	movl	-64(%rbp), %eax
	cmpl	-52(%rbp), %eax
	jb	.L28
	movl	$10, %edi
	call	putchar
.L16:
	movl	-52(%rbp), %eax
	movl	%eax, %esi
	movl	$.LC8, %edi
	movl	$0, %eax
	call	printf
	movq	-40(%rbp), %rax
	movq	%rax, -88(%rbp)
	movsd	-88(%rbp), %xmm0
	movl	$.LC9, %edi
	movl	$1, %eax
	call	printf
	movl	-52(%rbp), %eax
	leal	-1(%rax), %edx
	movl	-52(%rbp), %eax
	subl	$1, %eax
	movl	%eax, %eax
	movl	%edx, %edx
	imulq	$1000, %rdx, %rdx
	addq	%rdx, %rax
	movq	v3(,%rax,8), %rdx
	movl	-52(%rbp), %eax
	leal	-1(%rax), %esi
	movl	-52(%rbp), %eax
	leal	-1(%rax), %ecx
	movq	v3(%rip), %rax
	movq	%rdx, -88(%rbp)
	movsd	-88(%rbp), %xmm1
	movl	%esi, %edx
	movl	%ecx, %esi
	movq	%rax, -88(%rbp)
	movsd	-88(%rbp), %xmm0
	movl	$.LC10, %edi
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
.LC0:
	.long	2576980378
	.long	1069128089
	.align 8
.LC2:
	.long	0
	.long	1104006501
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04.4) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
