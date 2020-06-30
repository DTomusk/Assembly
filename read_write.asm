	global _start
	section .text
_start:
	call 	read

	mov	rbp, rsp
	push	inp
	call 	write
	pop	rax
	
	mov 	rbp, rsp
	push 	msg 
	call 	write
	pop 	rax
	
	jmp 	end

read:	; reads input to inp 
	mov	rax, 0
	mov  	rdi, 1
	mov	rsi, inp
	mov 	rdx, 64
	syscall
	
	ret

write:	; writes input  
	mov	rax, 1
	mov	rdi, 1
	mov	rsi, [rbp - 8]
	; ideally we would use the length of the string here, otherwise it can access other variables 
	mov	rdx, 17
	syscall

	ret 
	
end:
	mov 	rax, 0x3c
	xor	rdi, rdi
	syscall
	
	section .data 
msg: 	dq	"Words and such",10
	
	section .bss
inp: 	resb	8
