	global _start

	section .text
_start: 
	mov 	rax, 1		; system call to write msg 
	mov 	rdi, 1
	mov	rsi, msg
	mov	rdx, 16
	syscall 
	
	mov	rax, 0		; system call to read input to res
	mov 	rdi, 1
	mov 	rsi, res
	syscall
	
	mov	rax, 1		; system call to write res 
	mov 	rdi, 1
	mov 	rsi, res
	mov 	rdx, 4
	syscall
		
	mov	rax, 0x3c	; system call to exit 
	xor 	rdi, rdi
	syscall

	section .data
msg: 	db	"Enter something", 10

	section .bss		; uninitialised data
res:	resb 4			; variable to store input 
