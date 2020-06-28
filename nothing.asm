	global		_start
	
	section 	.text		; .text contains all the code 
_start: mov 		rax, 1 	; rax stores the system call number (1 is to write)
	mov		rdi, 1		; unsigned int fd  
	mov 		rsi, message 	; contains constant character buffer address (defined in data)
	mov 		rdx, 13	; contains the size of the message
	syscall			; system call parameters set and syscall executes 
	mov		rax, 60	; sys_exit 
	xor 		rdi, rdi	; exit code 0 
	syscall			; OS exit 
	
	section 	.data
message db 		"Hello World", 10

