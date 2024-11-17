section .data

section .text
	global main


main:
	mov eax, 4
	mov ebx, 1
	call add_registers
	mov ebx, eax
	mov eax, 1
	int 0x80

add_registers:
	add eax, ebx
	ret

