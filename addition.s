section .data
    SYSCALL_EXIT equ 60
    SYSCALL_WRITE equ 1
    STD_OUT equ 1

    msg db "The sum is:", 0xa, 0xd
    len equ $-msg
    
    newLine db 0xa
    len2 equ $-newLine

    arg1 equ 0
    arg2 equ 8


section .bss
    sum resb 1


section .text
    global main

print:
    push rbp
    mov rbp, rsp

    sub rsp, 16

    mov [rsp+arg1], rdi
    mov [rsp+arg2], rsi

    mov rax, SYSCALL_WRITE
    mov rdi, STD_OUT
    mov rsi, [rsp+arg1]
    mov rdx, [rsp+arg2]
    syscall

    mov rsp, rbp
    pop rbp
    ret

exit:

main:
    mov rax, '3'
    sub rax, '0'

    mov rbx, '4'
    sub rbx, '0'

    add rax, rbx
    add rax, '0'

    mov [sum], rax ; storing the sum in memory location "sum"

   ; mov eax, SYSCALL_WRITE
   ; mov edi, STD_OUT
   ; mov esi, msg
   ; mov edx, len
   ; syscall

    mov rdi, msg
    mov rsi, len
    call print

   ; mov eax, SYSCALL_WRITE
   ; mov edi, STD_OUT
   ; mov esi, sum
   ; mov edx, len
   ; syscall

   mov rdi, sum
   mov rsi, len
   call print
   ; mov eax, SYSCALL_WRITE
   ; mov edi, STD_OUT
   ; mov esi, newLine
   ; mov edx, len2
   ; syscall

    mov rdi, newLine
    mov rsi, len2
    call print

    mov rax, SYSCALL_EXIT
    mov rdi, 0
    syscall
