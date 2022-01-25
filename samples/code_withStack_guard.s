	.file	"code.c"
	.text
	.globl	_addition
	.def	_addition;	.scl	2;	.type	32;	.endef
_addition:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$16, %esp
	movl	8(%ebp), %edx
	movl	12(%ebp), %eax
	addl	%edx, %eax
	movl	%eax, -4(%ebp)
	movl	-4(%ebp), %eax
	leave
	ret
	.def	___main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
LC0:
	.ascii "Please give input: \0"
LC1:
	.ascii "a has NOT changed.\0"
	.align 4
LC2:
	.ascii "a has changed. Buffer Overflow!\0"
LC3:
	.ascii "Exiting\0"
	.text
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
	pushl	%ebp
	movl	%esp, %ebp
	andl	$-16, %esp
	subl	$48, %esp
	call	___main
	movl	___stack_chk_guard, %eax
	movl	%eax, 44(%esp)
	xorl	%eax, %eax
	movl	$1, 4(%esp)
	movl	$1, (%esp)
	call	_addition
	movl	%eax, 32(%esp)
	movl	$0, 36(%esp)
	movl	$LC0, (%esp)
	call	_puts
	movl	$35, 8(%esp)
	leal	31(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$0, (%esp)
	call	_read
	movl	%eax, 40(%esp)
	cmpl	$0, 36(%esp)
	jne	L4
	movl	$LC1, (%esp)
	call	_puts
	jmp	L5
L4:
	movl	$LC2, (%esp)
	call	_puts
L5:
	movl	$LC3, (%esp)
	call	_puts
	movl	$0, %eax
	movl	44(%esp), %edx
	xorl	   , %edx
	je	L7
	call	___stack_chk_fail
L7:
	leave
	ret
	.ident	"GCC: (MinGW.org GCC Build-2) 9.2.0"
	.def	_puts;	.scl	2;	.type	32;	.endef
	.def	_read;	.scl	2;	.type	32;	.endef
	.def	___stack_chk_fail;	.scl	2;	.type	32;	.endef
