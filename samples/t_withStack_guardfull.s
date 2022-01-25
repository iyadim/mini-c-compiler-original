	.file	"t.c"
	.text
	.globl	___stack_chk_guard
	.data
	.align 4
___stack_chk_guard:
	.long	-1159795795
	.section .rdata,"dr"
	.align 4
LC0:
	.ascii "ERROR: __stack_chk_guard has been corrupted\0"
	.text
	.globl	___stack_chk_fail
	.def	___stack_chk_fail;	.scl	2;	.type	32;	.endef
___stack_chk_fail:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$24, %esp
	movl	$LC0, (%esp)
	call	_puts
	nop
	leave
	ret
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
	je	L3
	call	___stack_chk_fail
L3:
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
	.def	_puts;	.scl	2;	.type	32;	.endef
	.def	_strcpy;	.scl	2;	.type	32;	.endef
	.def	___stack_chk_fail;	.scl	2;	.type	32;	.endef
