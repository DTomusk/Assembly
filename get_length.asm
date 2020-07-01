	global _start
	section .text
_start:
	call 	read 		; read input to variable
	
	xor	rax, rax	; clear rax
	mov 	rbp, rsp 	; prepare the rbp 
	push 	inp 		; push the variable we read onto the stack 
	
	call 	get_len
	pop	rax 
	
	call	write
	
	jmp 	end
	
read: 
	mov 	rax, 0
	mov 	rdi, 1
	mov	rsi, inp 	; so we give rsi the address allocated to inp and tell it to write 256 bytes into memory starting from that address
	mov	rdx, 256	; need to test 
	syscall
	
	ret
	
write: 
	mov	rax, 1
	mov	rdi, 1
	mov	rsi, inp	; not sure how syscall 1 works, if I give it the address of inp and len will it read len bytes starting from inp? I imagine that's how it's done 
	mov 	rdx, len
	syscall 
	
	ret
	
get_len:
	inc	rax		; doesn't yet check for zero length, if zero returns one 
	cmp 	byte [inp + rax], 0
	
	jnz	get_len 	; jump if the next byte isn't zero 
	
	mov 	[len], rax 	; move length into len

	ret			; return once we have the length
	
end: 
	mov	rax, 0x3c
	xor	rdi, rdi
	syscall
	
	section .bss 
inp:	resb	0x100		; our string is up to 256 bytes long (but for some reason it isn't)
len: 	resq 	1		; the variable where our length gets stored 
