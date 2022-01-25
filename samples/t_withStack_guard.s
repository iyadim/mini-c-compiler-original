	.file	"t.c"
	.text
	.globl	_func
	.def	_func;	.scl	2;	.type	32;	.endef
_func:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$56, %esp
	movl	16(%ebp), %eax
	movl	%eax, -28(%ebp)
	movl	___stack_chk_guard, %eax
	movl	%eax, -12(%ebp)
	xorl	%eax, %eax
	movl	$-559038737, -20(%ebp)
	movl	-28(%ebp), %eax
	movl	%eax, 4(%esp)
	leal	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_strcpy
	nop
	movl	-12(%ebp), %eax
	xorl	___stack_chk_guard, %eax
	je	L2
	call	___stack_chk_fail
L2:
	leave
	ret
	.def	___main;	.scl	2;	.type	32;	.endef
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
	pushl	%ebp
	movl	%esp, %ebp
	andl	$-16, %esp
	subl	$16, %esp
	call	___main
	movl	12(%ebp), %eax
	addl	$4, %eax
	movl	(%eax), %eax
	movl	%eax, 8(%esp)
	movl	$-1145324613, 4(%esp)
	movl	$-1431655766, (%esp)
	call	_func
	movl	$0, %eax
	leave
	ret
	.ident	"GCC: (MinGW.org GCC Build-2) 9.2.0"
	.def	_strcpy;	.scl	2;	.type	32;	.endef
	.def	___stack_chk_fail;	.scl	2;	.type	32;	.endef
