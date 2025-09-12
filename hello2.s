%define SYSCALL_WRITE 1
%define SYSCALL_EXIT 60
%define STD_OUT 1

section .data                  ; data segment
    msg db "Hello world!", 0xa ; the string to be printed
    len equ $ -msg             ; length of the string

section .text                  ; code segment
    global main                ; declare entry point for the linker

main:                          ; entry point
    ; WRITE system call
    mov rax, SYSCALL_WRITE     ; WRITE system call will be performed
    mov rdi, STD_OUT           ; file descriptor corresponding to stdout
    lea rsi, [msg]             ; message to write to stdout
    mov rdx, len               ; length of the message
    syscall                    ; perform the system call

    ; EXIT system call
    mov rax, SYSCALL_EXIT      ; system-call number corresponding to sys_exit
    mov rdi, 0                 ; error code
    syscall                    ; perform the system call
