global _start
	section .text
_start:
	mov 	rax, 1
	mov 	rdi, 1
	mov 	rsi, msg
	mov	rdx, 64
	syscall
	
	call 	readi
	call 	writeo
	jmp 	finished
	
readi: 
	mov	rax, 0
	mov 	rdi, 1
	mov	rsi, var
	syscall
	ret

writeo:
	mov	rax, 1
	mov	rdi, 1
	mov	rsi, var
	mov	rdx, 4
	syscall
	ret

finished:
	mov 	rax, 60
	mov	rdi, 0
	syscall
	
	section .data
msg: 	db 	"For some reason it doesn't work if I omit this message", 10
	
	section .bss
var: 	resb	4 	; reserve four bytes for var 
