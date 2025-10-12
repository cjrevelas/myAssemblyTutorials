%define SYSCALL_EXIT 60

section .data 
    a dq 3
    b dq 4

section .text
    global main

main:
    xor  rax, rax
    xor  rbx, rbx
    xor  rcx, rcx

    mov  rbx, [a]
    imul rbx, [a]
    mov  rcx, [b]
    imul rcx, [b]

    add  rax, rbx
    add  rax, rcx

    mov rax, SYSCALL_EXIT  ; system-call number corresponding to sys_exit
    mov rdi, 0             ; error code
    syscall                ; perform the system call
