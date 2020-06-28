	global _start

	section .text
_start: 
	mov 	rax, 1
	mov 	rdi, 1
	mov	rsi, msg
	mov	rdx, 16
	syscall 
	
	mov	rax, 0
	mov 	rdi, 1
	mov 	rsi, res
	syscall
	
	mov	rax, 1
	mov 	rdi, 1
	mov 	rsi, res
	mov 	rdx, 4
	syscall
		
	mov	rax, 0x3c
	xor 	rdi, rdi
	syscall

	section .data
msg: 	db	"Enter something", 10

	section .bss
res:	resb 4
