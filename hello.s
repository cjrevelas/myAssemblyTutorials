section .data                  ; data segment
    msg db "Hello world!", 0xa ; the string to be printed
    len equ $ -msg             ; length of the string

section .text                  ; code segment
    global main                ; declare entry point for the linker

main:                          ; entry point
    mov eax, 4                 ; system-call number corresponding to sys_write
    mov ebx, 1                 ; file descriptor corresponding to stdout
    mov ecx, msg               ; message to write to stdout
    mov edx, len               ; length of the message
    int 0x80                   ; perform an interrupt to invoke kernel functionality

    mov eax, 1                 ; system-call number corresponding to sys_exit
    mov ebx, 0                 ; error code
    int 0x80                   ; perform an interrupt to terminate program execution
