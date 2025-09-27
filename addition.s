section .data
    SYSCALL_EXIT equ 60
    SYSCALL_WRITE equ 1
    STD_OUT equ 1

    msg db "The sum is:", 0xa, 0xd
    len equ $-msg
    
    newLine db 0xa
    len2 equ $-newLine

section .bss
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

    mov eax, SYSCALL_WRITE
    mov edi, STD_OUT
    mov esi, msg
    mov edx, len
    syscall

    mov eax, SYSCALL_WRITE
    mov edi, STD_OUT
    mov esi, sum
    mov edx, len
    syscall

    mov eax, SYSCALL_WRITE
    mov edi, STD_OUT
    mov esi, newLine
    mov edx, len2
    syscall

    mov eax, SYSCALL_EXIT
    mov edi, 0
    syscall
