section .data
    SYSCALL_EXIT equ 1
    SYSCALL_WRITE equ 4
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
    mov ebx, STD_OUT
    mov ecx, msg
    mov edx, len
    int 0x80

    mov eax, SYSCALL_WRITE
    mov ebx, STD_OUT
    mov ecx, sum
    mov edx, 1
    int 0x80

    mov eax, SYSCALL_WRITE
    mov ebx, STD_OUT
    mov ecx, newLine
    mov edx, len2
    int 0x80

    mov eax, SYSCALL_EXIT
    mov ebx, 0
    int 0x80    
