	global _start

	section .text

_start:		; push variable msg onto the stack and call func to print it  
	mov	rbp, rsp	; set base pointer to access variables 
	
	push 	msg	
	call	func	
	
	pop	rdi	; pop variable that was pushed on (call pushes rip and ret pops to rip so pop has to be called after ret)
	jmp 	finish
	
func:
	mov 	rsi, [rbp - 8]	; use base pointer to access variables, variable is 64 bits (to keep stack aligned) 
	mov 	rdi, 1
	mov	rax, 1
	mov	rdx, 8		; length is eight bytes 
	syscall
	
	ret		; pops value into rip which was the value pushed by call 
	
finish: 
	mov 	rax, 60
	xor 	rdi, rdi	; set rdi to 0
	syscall
	
	section .data
msg: 	dq	"Yo",10
