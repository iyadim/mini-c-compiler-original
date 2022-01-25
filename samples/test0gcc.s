	.file	"test0.c"
	.text
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
	subl	$32, %esp
	call	___main
	movl	$0, 28(%esp)
	movl	$LC0, (%esp)
	call	_puts
	movl	$35, 8(%esp)
	leal	23(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$0, (%esp)
	call	_read
	movl	%eax, 24(%esp)
	cmpl	$0, 28(%esp)
	jne	L2
	movl	$LC1, (%esp)
	call	_puts
	jmp	L3
L2:
	movl	$LC2, (%esp)
	call	_puts
L3:
	movl	$LC3, (%esp)
	call	_puts
	movl	$0, %eax
	leave
	ret
	.ident	"GCC: (MinGW.org GCC Build-2) 9.2.0"
	.def	_puts;	.scl	2;	.type	32;	.endef
	.def	_read;	.scl	2;	.type	32;	.endef
