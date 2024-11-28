; This program stores a name in the data section of the memory
; then alters its value and displays both names on the console.

section .data
    name db "Costas Revelas"

section .text
    global _start

_start:
    mov edx,16
    mov ecx,name
    mov ebx,1
    mov eax,4
    int 0x80

    mov [name], dword "Geor"

    mov edx,16
    mov ecx,name
    mov ebx,1
    mov eax,4
    int 0x80

    mov eax,1
    int 0x80