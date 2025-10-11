section .data                  ; data segment
    msg db "Hello world!", 0xa ; the string to be printed
    len equ $ -msg             ; length of the string

section .text                  ; code segment
    global main                ; declare "main" entry point for the linker

print:
    push rbp                    ; create stack frame
    mov  rbp, rsp               ; create stack frame
    mov  eax, 4                 ; system-call number corresponding to sys_write
    mov  ebx, 1                 ; file descriptor corresponding to stdout
    mov  ecx, msg               ; message to write to stdout/console
    mov  edx, len               ; length of the message
    int  0x80                   ; perform an interrupt to invoke kernel functionality
    pop  rbp                    ; restore stack frame
    ret

exit:
    push rbp                   ; create stack frame
    mov  rbp, rsp              ; create stack frame
    mov  eax, 1                ; system-call number corresponding to sys_exit
    mov  ebx, 0                ; error code
    int  0x80                  ; perform an interrupt to terminate program execution

main:                          ; entry point
    call print                 ; print hello world to the console
    call exit                  ; terminate program execution
