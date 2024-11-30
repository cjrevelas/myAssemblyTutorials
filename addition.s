section .data
    SYS_EXIT equ 1
    SYS_WRITE equ 4

    msg db "The sum is:", 0XA, 0xD
    len equ $-msg

    newLine db 0xA
    len2 equ $-newLine
    
    segment .bss
    sum resb 1

section .text
    global main

main:
    mov eax, '3'
    sub eax, '0'

    mov ebx, '4'
    sub ebx, '0'

    add eax, ebx
    add eax, '0'

    mov [sum], eax ; storing the sum in memory location "sum"

    mov eax, SYS_WRITE
    mov ebx, 1
    mov ecx, msg
    mov edx, len
    int 0x80

    mov eax, SYS_WRITE
    mov ebx, 1
    mov ecx, sum
    mov edx, 1
    int 0x80

    mov eax, SYS_WRITE
    mov ebx, 1
    mov ecx, newLine
    mov edx, len2
    int 0x80

    mov eax, SYS_EXIT
    mov ebx, 0
    int 0x80    