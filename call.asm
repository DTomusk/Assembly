	global _start

	section .text

_start:		; try pushing onto the stack and using that value in a function 
	mov	rbp, rsp; I don't think I have to do this right now 
	
	push 	msg	; has address 402000, this is where the program goes on ret
	call	func	; call pushes 40100d to stack
	
	; pop should be called here as variables were pushed on before rip
	pop	rdi
	jmp 	finish
	
func:
	;pop 	rsi 	 this actually put the return address in rsi, not msg
	mov 	rsi, [rbp - 8]	; use base pointer to access variables 
	mov 	rdi, 1
	mov	rax, 1
	mov	rdx, 8
	syscall
	
	ret		; pops value into rip, value is mistakenly 402000 so tries to execute msg 
	
finish: 
	mov 	rax, 60
	xor 	rdi, rdi
	syscall
	
	section .data
msg: 	dq	"Yo",10
