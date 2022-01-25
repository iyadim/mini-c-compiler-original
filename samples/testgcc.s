	.file	"test0.c"
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
	.def	___main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
LC1:
	.ascii "Please give input: \0"
LC2:
	.ascii "a has NOT changed.\0"
	.align 4
LC3:
	.ascii "a has changed. Buffer Overflow!\0"
LC4:
	.ascii "Exiting\0"
	.text
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
	pushl	%ebp
	movl	%esp, %ebp
	andl	$-16, %esp
	subl	$32, %esp
	call	___main
	movl	___stack_chk_guard, %eax
	movl	%eax, 28(%esp)
	xorl	%eax, %eax
	movl	$0, 20(%esp)
	movl	$LC1, (%esp)
	call	_puts
	movl	$35, 8(%esp)
	leal	19(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$0, (%esp)
	call	_read
	movl	%eax, 24(%esp)
	cmpl	$0, 20(%esp)
	jne	L3
	movl	$LC2, (%esp)
	call	_puts
	jmp	L4
L3:
	movl	$LC3, (%esp)
	call	_puts
L4:
	movl	$LC4, (%esp)
	call	_puts
	movl	$0, %eax
	movl	28(%esp), %edx
	xorl	___stack_chk_guard, %edx
	je	L6
	call	___stack_chk_fail
L6:
	leave
	ret
	.ident	"GCC: (MinGW.org GCC Build-2) 9.2.0"
	.def	_puts;	.scl	2;	.type	32;	.endef
	.def	_read;	.scl	2;	.type	32;	.endef
	.def	___stack_chk_fail;	.scl	2;	.type	32;	.endef
