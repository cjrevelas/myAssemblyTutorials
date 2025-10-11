%define SYSCALL_WRITE 4
%define SYSCALL_EXIT 1
%define STD_OUT 1

section .data                  ; data segment
    msg db "Hello world!", 0xa ; the string to be printed
    len equ $ -msg             ; length of the string

section .text                  ; code segment
    global main                ; declare entry point for the linker

main:                          ; entry point
    mov eax, SYSCALL_WRITE     ; system-call number corresponding to sys_write
    mov ebx, STD_OUT           ; file descriptor corresponding to stdout
    mov ecx, msg               ; message to write to stdout
    mov edx, len               ; length of the message
    int 0x80                   ; perform an interrupt to invoke kernel functionality

    mov eax, SYSCALL_EXIT      ; system-call number corresponding to sys_exit
    mov ebx, 0                 ; error code
    int 0x80                   ; perform an interrupt to terminate program execution
